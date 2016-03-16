package cn.momia.wap.web.ctrl.subject;

import cn.momia.wap.web.ctrl.AbstractController;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;

@Controller
public class SubjectController extends AbstractController {
    @RequestMapping(value = "/subjectdetail", method = RequestMethod.GET)
    public ModelAndView subject(@RequestParam long id) {
        return new ModelAndView("subject/subject", "subject", get("/v2/subject?id=" + id));
    }

    @RequestMapping(value = "/subject/placeorder", method = RequestMethod.GET)
    public ModelAndView placeorder(HttpServletRequest request,
                                   @RequestParam long id,
                                   @RequestParam(required = false, value = "coid", defaultValue = "0") long courseId,
                                   @RequestParam(required = false, value = "sid", defaultValue = "0") long skuId,
                                   @RequestParam(required = false, value = "ccode", defaultValue = "") String code) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) {
            String referer = request.getHeader("Referer");
            StringBuffer url = request.getRequestURL().append("?").append(request.getQueryString());
            return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(url.toString()) + "&back=" + URLEncoder.encode(referer));
        }

        JSONObject params = (JSONObject) get("/v2/subject/sku?utoken=" + utoken + "&id=" + id + (courseId > 0 ? "&coid=" + courseId : ""));
        if (courseId > 0) params.put("courseOrder", true);

        if (skuId > 0) {
            JSONArray filteredSkusJson = new JSONArray();
            JSONArray skusJson = params.getJSONArray("skus");
            for (int i = 0; i < skusJson.size(); i++) {
                JSONObject skuJson = skusJson.getJSONObject(i);
                if (skuJson.getLong("id") == skuId) {
                    filteredSkusJson.add(skuJson);
                    break;
                }
            }
            params.put("skus", filteredSkusJson);
        }

        params.put("discount", "");
        if (!StringUtils.isBlank(code)) {
            JSONObject couponCode = (JSONObject) get("/coupon/code?code=" + code);
            int couponCodeId = couponCode.getInteger("id");
            if (couponCodeId > 0) params.put("discount", couponCode.get("discount"));
        }

        return new ModelAndView("subject/placeorder", "params", params);
    }
}
