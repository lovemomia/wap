package cn.momia.wap.web.ctrl.user;

import cn.momia.common.webapp.config.Configuration;
import cn.momia.wap.web.ctrl.AbstractController;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;

@Controller
public class UserController extends AbstractController {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/my", method = RequestMethod.GET)
    public ModelAndView my(HttpServletRequest request) {
        String utoken = getUtoken(request);
        if (!StringUtils.isBlank(utoken)) {
            try {
                return new ModelAndView("my", "user", get("/user?utoken=" + utoken));
            } catch (Exception e) {
                LOGGER.error("fail to get user info", e);
            }
        }

        return new ModelAndView("my");
    }

    @RequestMapping(value = "/user/profile", method = RequestMethod.GET)
    public ModelAndView profile(HttpServletRequest request) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(request.getRequestURL().toString()) + "&back=" + request.getHeader("Referer"));

        return new ModelAndView("user/profile", "user", get("/user?utoken=" + utoken));
    }

    @RequestMapping(value = { "/share", "/user/share" }, method = RequestMethod.GET)
    public ModelAndView share(HttpServletRequest request) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(request.getRequestURL().toString()) + "&back=" + request.getHeader("Referer"));

        JSONObject share = (JSONObject) get("/coupon/share?utoken=" + utoken);
        String queryString = request.getQueryString();
        share.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), request.getRequestURL() + (StringUtils.isBlank(queryString) ? "" : ("?" + queryString))));

        return new ModelAndView("user/share", "share", share);
    }
}
