package cn.momia.wap.web.ctrl.user;

import cn.momia.common.api.http.MomiaHttpResponse;
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
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController extends AbstractController {
    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

    @RequestMapping(value = "/my", method = RequestMethod.GET)
    public ModelAndView my(HttpServletRequest request) {
        String utoken = getUtoken(request);
        if (!StringUtils.isBlank(utoken)) {
            try {
                MomiaHttpResponse resp = get("/user?utoken=" + utoken);
                return new ModelAndView("my", "user", resp.getData());
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

        MomiaHttpResponse resp = get("/user?utoken=" + utoken);
        return new ModelAndView("user/profile", "user", resp.getData());
    }

    @RequestMapping(value = "/user/share", method = RequestMethod.GET)
    public ModelAndView share(HttpServletRequest request) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(request.getRequestURL().toString()) + "&back=" + request.getHeader("Referer"));

        MomiaHttpResponse resp = get("/user?utoken=" + utoken);
        String shareUrl = Configuration.getString("Share.Url") + "?invite=" + ((JSONObject) resp.getData()).getString("inviteCode");

        Map<String, Object> share = new HashMap<String, Object>();
        share.put("title", "50元松果亲子课程红包等你拿！");
        share.put("abstracts", "最有同理心的课堂，最有性价比的价格。和孩子一起成长，不错过他给你带来的每一次惊喜！");
        share.put("url", shareUrl);
        share.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), request.getRequestURL() + "?" + request.getQueryString()));

        return new ModelAndView("user/share", "share", share);
    }
}
