package cn.momia.wap.web.ctrl.gift;

import cn.momia.common.core.http.MomiaHttpResponse;
import cn.momia.common.webapp.config.Configuration;
import cn.momia.wap.web.ctrl.AbstractController;
import cn.momia.wap.web.ctrl.user.WxConfig;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/gift")
public class GiftController extends AbstractController {
    @RequestMapping(value = "/send", method = RequestMethod.GET)
    public ModelAndView send(HttpServletRequest request) {
        JSONObject share = new JSONObject();
        String url = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        share.put("url", url);
        share.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), url + (StringUtils.isBlank(queryString) ? "" : ("?" + queryString))));

        return new ModelAndView("gift/send", "share", share);
    }

    @RequestMapping(value = "/placeorder", method = RequestMethod.GET)
    public ModelAndView placeorder(HttpServletRequest request, @RequestParam long id) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) {
            String referer = request.getHeader("Referer");
            StringBuffer url = request.getRequestURL().append("?").append(request.getQueryString());
            return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(url.toString()) + "&back=" + URLEncoder.encode(referer));
        }

        MomiaHttpResponse resp = get("/v2/subject/sku?utoken=" + utoken + "&id=" + id);
        JSONObject params = (JSONObject) resp.getData();

        return new ModelAndView("gift/placeorder", "params", params);
    }

    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public ModelAndView pay(@RequestParam long oid, @RequestParam int count, @RequestParam BigDecimal fee) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("oid", oid);
        params.put("count", count);
        params.put("fee", fee);

        return new ModelAndView("gift/pay", "params", params);
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public ModelAndView result(HttpServletRequest request, @RequestParam long oid) {
        JSONObject share = new JSONObject();
        share.put("url", buildReceiveUrl());
        String url = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        share.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), url + (StringUtils.isBlank(queryString) ? "" : ("?" + queryString))));

        return new ModelAndView("gift/result", "share", share);
    }

    private String buildReceiveUrl() {
        return Configuration.getString("Gift.ReceiveUrl");
    }
}
