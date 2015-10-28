package cn.momia.wap.web.ctrl.payment;

import cn.momia.wap.web.ctrl.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/payment")
public class PaymentController extends AbstractController {
    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public ModelAndView pay() {
        return new ModelAndView("payment/pay");
    }

    @RequestMapping(value = "/result/success", method = RequestMethod.GET)
    public ModelAndView success(@RequestParam(value = "oid") long orderId) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("payed", true);
        params.put("orderId", orderId);

        return new ModelAndView("payment/result", "params", params);
    }

    @RequestMapping(value = "/result/fail", method = RequestMethod.GET)
    public ModelAndView fail() {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("payed", false);

        return new ModelAndView("payment/result", "params", params);
    }
}
