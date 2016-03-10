package cn.momia.wap.web.ctrl.discuss;

import cn.momia.wap.web.ctrl.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/discuss")
public class DiscussController extends AbstractController {
    @RequestMapping(value = "/topic", method = RequestMethod.GET)
    public ModelAndView topic(HttpServletRequest request, @RequestParam long id) {
        String utoken = getUtoken(request);
        return new ModelAndView("discuss/topic", "topic", get("/discuss/topic?utoken=" + utoken + "&id=" + id + "&start=0"));
    }
}
