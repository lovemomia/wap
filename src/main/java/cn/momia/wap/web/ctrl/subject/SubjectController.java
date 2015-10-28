package cn.momia.wap.web.ctrl.subject;

import cn.momia.common.api.http.MomiaHttpResponse;
import cn.momia.wap.web.ctrl.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SubjectController extends AbstractController {
    @RequestMapping(value = "/subjectdetail", method = RequestMethod.GET)
    public ModelAndView subject(@RequestParam long id) {
        MomiaHttpResponse resp = get("/subject?id=" + id);
        return new ModelAndView("subject/subject", "subject", resp.getData());
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
