package cn.momia.wap.web.ctrl.teacher;

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
@RequestMapping({"/teacher"})
public class TeacherController extends AbstractController {
    @RequestMapping(value = "/material", method = RequestMethod.GET)
    public ModelAndView material(HttpServletRequest request, @RequestParam int id) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) {
            String referer = request.getHeader("Referer");
            StringBuffer url = request.getRequestURL().append("?").append(request.getQueryString());
            return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(url.toString()) + "&back=" + URLEncoder.encode(referer));
        }

        MomiaHttpResponse resp = get("/teacher/material?utoken=" + utoken + "&mid=" + id);
        JSONObject material = (JSONObject) resp.getData();

        return new ModelAndView("teacher/material", "material", material);
    }
}
