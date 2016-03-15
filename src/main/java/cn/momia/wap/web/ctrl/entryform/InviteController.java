package cn.momia.wap.web.ctrl.entryform;

import cn.momia.common.webapp.config.Configuration;
import cn.momia.wap.web.ctrl.AbstractController;
import cn.momia.wap.web.ctrl.user.WxConfig;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class InviteController extends AbstractController {
    @RequestMapping(value = { "/invite" }, method = RequestMethod.GET)
    public ModelAndView invite(HttpServletRequest request) {
        JSONObject share = new JSONObject();
        String queryString = request.getQueryString();
        share.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), request.getRequestURL() + (StringUtils.isBlank(queryString) ? "" : ("?" + queryString))));

        return new ModelAndView("invite", "share", share);
    }
}
