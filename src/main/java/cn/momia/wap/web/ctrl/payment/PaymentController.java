package cn.momia.wap.web.ctrl.payment;

import cn.momia.wap.web.ctrl.AbstractController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/payment")
public class PaymentController extends AbstractController {
    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public ModelAndView pay(@RequestParam long oid, @RequestParam int count, @RequestParam BigDecimal fee) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("oid", oid);
        params.put("count", count);
        params.put("fee", fee);

        return new ModelAndView("payment/pay", "params", params);
    }
}
