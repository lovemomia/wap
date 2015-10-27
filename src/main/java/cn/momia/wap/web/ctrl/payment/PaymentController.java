package cn.momia.wap.web.ctrl.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/payment")
public class PaymentController {
    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public ModelAndView pay() {
        return new ModelAndView("payment/pay");
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public ModelAndView result() {
        return new ModelAndView("payment/result");
    }
}
