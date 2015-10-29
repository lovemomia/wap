package cn.momia.wap.web.ctrl.payment;

import cn.momia.common.api.http.MomiaHttpResponse;
import cn.momia.wap.web.ctrl.AbstractController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public ModelAndView success(HttpServletRequest request, @RequestParam(value = "oid") long orderId) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) return new ModelAndView("forward:/auth/login");

        Map<String, String> params = new HashMap<String, String>();
        params.put("utoken", utoken);
        params.put("oid", String.valueOf(orderId));

        MomiaHttpResponse resp = post("/payment/check", params);

        return new ModelAndView("payment/result", "result", resp.getData());
    }
}
