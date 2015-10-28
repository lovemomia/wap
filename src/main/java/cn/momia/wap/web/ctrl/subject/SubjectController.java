package cn.momia.wap.web.ctrl.subject;

import cn.momia.wap.web.ctrl.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SubjectController extends AbstractController {
    @RequestMapping(value = "/subjectdetail", method = RequestMethod.GET)
    public ModelAndView subject() {
        return new ModelAndView("subject/subject");
    }

    @RequestMapping(value = "/subject/courses", method = RequestMethod.GET)
    public ModelAndView courses() {
        return new ModelAndView("subject/courselist");
    }

    @RequestMapping(value = "/subject/placeorder", method = RequestMethod.GET)
    public ModelAndView placeorder() {
        return new ModelAndView("subject/placeorder");
    }
}
