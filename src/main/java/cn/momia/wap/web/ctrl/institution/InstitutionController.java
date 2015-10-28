package cn.momia.wap.web.ctrl.institution;

import cn.momia.common.api.http.MomiaHttpResponse;
import cn.momia.wap.web.ctrl.AbstractController;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/institution")
public class InstitutionController extends AbstractController {
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail(@RequestParam long id) {
        return new ModelAndView("institution/detail", "detail", getDetail(id));
    }

    private JSONObject getDetail(long id) {
        MomiaHttpResponse resp = get("/course/institution?id=" + id);
        return (JSONObject) resp.getData();
    }

    @RequestMapping(value = "/detail/app", method = RequestMethod.GET)
    public ModelAndView detailApp(@RequestParam long id) {
        return new ModelAndView("institution/detail_app", "detail", getDetail(id));
    }
}
