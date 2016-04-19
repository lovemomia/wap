package cn.momia.wap.web.ctrl.activity;

import cn.momia.common.webapp.config.Configuration;
import cn.momia.wap.web.ctrl.AbstractController;
import cn.momia.wap.web.ctrl.user.WxConfig;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/activity")
public class ActivityController extends AbstractController {
    @RequestMapping(value = "/coupon/{id}", method = RequestMethod.GET)
    public ModelAndView activityCoupon(@PathVariable String id) {
        return new ModelAndView("activity/coupon", "coupon", get("/coupon?id=" + id));
    }

    @RequestMapping(value = "/detail/{aid}", method = RequestMethod.GET)
    public ModelAndView activity(HttpServletRequest request, @PathVariable int aid) {
        JSONObject activityJson = (JSONObject) get("/activity?id=" + aid);
        String queryString = request.getQueryString();
        activityJson.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), request.getRequestURL() + (StringUtils.isBlank(queryString) ? "" : ("?" + queryString))));

        return new ModelAndView("activity/" + aid, "activity", activityJson);
    }

    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public ModelAndView pay(@RequestParam int aid, @RequestParam long eid) {
        JSONObject activityJson = (JSONObject) get("/activity?id=" + aid);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("fee", activityJson.getBigDecimal("price"));

        return new ModelAndView("activity/pay", "params", params);
    }
}
