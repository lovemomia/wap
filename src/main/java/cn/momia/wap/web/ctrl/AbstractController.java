package cn.momia.wap.web.ctrl;

import cn.momia.common.core.exception.MomiaErrorException;
import cn.momia.common.core.exception.MomiaLoginException;
import cn.momia.common.core.http.MomiaHttpResponse;
import cn.momia.common.core.util.CastUtil;
import cn.momia.common.webapp.config.Configuration;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

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
            if (!momiaHttpResponse.isSuccessful()) throw new MomiaErrorException(momiaHttpResponse.getErrmsg());

            return momiaHttpResponse;
        } catch (IOException e) {
            throw new MomiaErrorException(e.getMessage());
        }
    }

    private MomiaHttpResponse buildResponse(HttpResponse response) throws IOException {
        String entity = EntityUtils.toString(response.getEntity());
        JSONObject responseJson = JSON.parseObject(entity);

        return CastUtil.toObject(responseJson, MomiaHttpResponse.class);
    }

    @ExceptionHandler
    public ModelAndView exception(Exception exception) throws Exception {
        LOGGER.error("exception!!", exception);

        if (exception instanceof MomiaErrorException) {
            return new ModelAndView("error", "msg", exception.getMessage());
        } else if (exception instanceof MomiaLoginException) {
            return new ModelAndView("auth/login");
        } else {
            return new ModelAndView("error", "msg", "网络异常，请稍后再试");
        }
    }
}
