package cn.momia.wap.web.ctrl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class GeneralController extends AbstractController {
    @RequestMapping(value = "/**", method = RequestMethod.GET)
    public ModelAndView processRequest(HttpServletRequest request) {
        String uri = request.getRequestURI();
        int indexOfDot = uri.indexOf(".");
        if (indexOfDot > 0) uri = uri.substring(0, indexOfDot);

        return new ModelAndView(uri);
    }
}
