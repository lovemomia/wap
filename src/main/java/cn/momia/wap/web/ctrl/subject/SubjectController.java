package cn.momia.wap.web.ctrl.subject;

import cn.momia.common.api.http.MomiaHttpResponse;
import cn.momia.wap.web.ctrl.AbstractController;
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
        MomiaHttpResponse resp = get("/v2/subject?id=" + id);
        return new ModelAndView("subject/subject", "subject", resp.getData());
    }

    @RequestMapping(value = "/subject/placeorder", method = RequestMethod.GET)
    public ModelAndView placeorder(HttpServletRequest request, @RequestParam long id, @RequestParam(required = false, value = "coid", defaultValue = "0") long courseId) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) {
            String referer = request.getHeader("Referer");
            StringBuffer url = request.getRequestURL().append("?id=").append(id);
            return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(url.toString()) + "&back=" + URLEncoder.encode(referer));
        }

        MomiaHttpResponse resp = get("/v2/subject/sku?utoken=" + utoken + "&id=" + id + (courseId > 0 ? "&coid=" + courseId : ""));
        JSONObject params = (JSONObject) resp.getData();
        if (courseId > 0) params.put("courseOrder", true);
        return new ModelAndView("subject/placeorder", "params", params);
    }
}
