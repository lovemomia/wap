package cn.momia.wap.web.ctrl.course;

import cn.momia.common.webapp.ctrl.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/course")
public class CourseController extends BaseController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView course() {
        return new ModelAndView("course/course");
    }

    @RequestMapping(value = "/skuplace", method = RequestMethod.GET)
    public ModelAndView skuplace() {
        return new ModelAndView("course/skuplace");
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail() {
        return new ModelAndView("course/detail");
    }

    @RequestMapping(value = "/detail/app", method = RequestMethod.GET)
    public ModelAndView detailApp() {
        return new ModelAndView("course/detail_app");
    }

    @RequestMapping(value = "/teacher", method = RequestMethod.GET)
    public ModelAndView teacher() {
        return new ModelAndView("course/teacher");
    }
}
