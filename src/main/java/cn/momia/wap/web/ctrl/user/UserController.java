package cn.momia.wap.web.ctrl.user;

import cn.momia.common.api.http.MomiaHttpResponse;
import cn.momia.wap.web.ctrl.AbstractController;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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
        // TODO
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) return new ModelAndView("forward:/auth/login");

        MomiaHttpResponse resp = get("/user?utoken=" + utoken);
        return new ModelAndView("user/profile", "user", resp.getData());
    }
}
