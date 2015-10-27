package cn.momia.wap.web.ctrl.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
    @RequestMapping(value = "/my", method = RequestMethod.GET)
    public ModelAndView my() {
        return new ModelAndView("my");
    }

    @RequestMapping(value = "/feedback", method = RequestMethod.GET)
    public ModelAndView feedback() {
        return new ModelAndView("feedback");
    }

    @RequestMapping(value = "/user/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        return new ModelAndView("user/profile");
    }

    @RequestMapping(value = "/user/booked", method = RequestMethod.GET)
    public ModelAndView booked() {
        return new ModelAndView("user/booked");
    }

    @RequestMapping(value = "/user/bookable", method = RequestMethod.GET)
    public ModelAndView bookable() {
        return new ModelAndView("user/bookable");
    }

    @RequestMapping(value = "/user/order", method = RequestMethod.GET)
    public ModelAndView order() {
        return new ModelAndView("user/order");
    }
}
