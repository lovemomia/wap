package cn.momia.wap.web.ctrl.institution;

import cn.momia.wap.web.ctrl.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/institution")
public class InstitutionController extends AbstractController {
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail() {
        return new ModelAndView("institution/detail");
    }

    @RequestMapping(value = "/detail/app", method = RequestMethod.GET)
    public ModelAndView detailApp() {
        return new ModelAndView("institution/detail_app");
    }
}
