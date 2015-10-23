package cn.momia.wap.web.ctrl.subject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SubjectController {
    @RequestMapping(value = "subjectdetail", method = RequestMethod.GET)
    public ModelAndView subject() {
        return new ModelAndView("subject/subject");
    }
}
