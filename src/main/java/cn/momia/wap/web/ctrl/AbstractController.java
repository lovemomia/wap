package cn.momia.wap.web.ctrl;

import cn.momia.common.api.exception.MomiaFailedException;
import cn.momia.common.api.exception.MomiaLoginException;
import cn.momia.common.api.http.MomiaHttpResponse;
import cn.momia.common.api.util.CastUtil;
import cn.momia.common.webapp.config.Configuration;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpEntityEnclosingRequestBase;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AbstractController {
    private static final Logger LOGGER = LoggerFactory.getLogger(AbstractController.class);

    protected String getUtoken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        for(Cookie cookie : cookies) {
            if (cookie.getName().equals("utoken")) return cookie.getValue();
        }

        return "";
    }

    protected MomiaHttpResponse get(String url) {
        try {
            HttpClient httpClient = HttpClients.createDefault();

            if (!url.startsWith("http")) {
                if (!url.startsWith("/")) url = "/" + url;
                url = Configuration.getString("Api.Http") + url;
            }

            HttpResponse response = httpClient.execute(new HttpGet(url));
            if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) throw new NetworkException("fail to execute request: " + url);

            MomiaHttpResponse momiaHttpResponse = buildResponse(response);
            if (momiaHttpResponse.isTokenExpired()) throw new MomiaLoginException();
            if (!momiaHttpResponse.isSuccessful()) throw new MomiaFailedException(momiaHttpResponse.getErrmsg());

            return momiaHttpResponse;
        } catch (IOException e) {
            throw new MomiaFailedException(e.getMessage());
        }
    }

    private MomiaHttpResponse buildResponse(HttpResponse response) throws IOException {
        String entity = EntityUtils.toString(response.getEntity());
        JSONObject responseJson = JSON.parseObject(entity);

        return CastUtil.toObject(responseJson, MomiaHttpResponse.class);
    }

    protected MomiaHttpResponse post(String url, Map<String, String> params) {
        try {
            HttpClient httpClient = HttpClients.createDefault();

            if (!url.startsWith("http")) {
                if (!url.startsWith("/")) url = "/" + url;
                url = Configuration.getString("Api.Https") + url;
            }

            HttpPost httpPost = new HttpPost(url);
            parseEntity(httpPost, params);
            HttpResponse response = httpClient.execute(httpPost);
            if (response.getStatusLine().getStatusCode() != HttpStatus.SC_OK) throw new NetworkException("fail to execute request: " + url);

            MomiaHttpResponse momiaHttpResponse = buildResponse(response);
            if (momiaHttpResponse.isTokenExpired()) throw new MomiaLoginException();
            if (!momiaHttpResponse.isSuccessful()) throw new MomiaFailedException(momiaHttpResponse.getErrmsg());

            return momiaHttpResponse;
        } catch (IOException e) {
            throw new MomiaFailedException(e.getMessage());
        }
    }

    private static void parseEntity(HttpEntityEnclosingRequestBase httpMethod, Map<String, String> params) {
        if (params == null && params.isEmpty()) return;

        try {
            HttpEntity entity = new UrlEncodedFormEntity(toNameValuePairs(params), "UTF-8");
            httpMethod.setEntity(entity);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    private static List<NameValuePair> toNameValuePairs(Map<String, String> params) {
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
        for (Map.Entry<String, String> entry : params.entrySet()) {
            nameValuePairs.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
        }

        return nameValuePairs;
    }

    @ExceptionHandler
    public ModelAndView exception(Exception exception) throws Exception {
        LOGGER.error("exception!!", exception);

        if (exception instanceof MomiaFailedException) {
            return new ModelAndView("error", "msg", exception.getMessage());
        } else if (exception instanceof MomiaLoginException) {
            return new ModelAndView("auth/login");
        } else {
            return new ModelAndView("error", "msg", "网络异常，请稍后再试");
        }
    }
}
