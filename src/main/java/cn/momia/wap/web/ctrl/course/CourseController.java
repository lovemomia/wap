package cn.momia.wap.web.ctrl.course;

import cn.momia.common.api.http.MomiaHttpResponse;
import cn.momia.wap.web.ctrl.AbstractController;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/course")
public class CourseController extends AbstractController {
    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView course(@RequestParam long id) {
        MomiaHttpResponse resp = get("/course?id=" + id);
        return new ModelAndView("course/course", "course", resp.getData());
    }

    @RequestMapping(value = "/skuplace", method = RequestMethod.GET)
    public ModelAndView skuplace() {
        return new ModelAndView("course/skuplace");
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail(@RequestParam long id) {
        return new ModelAndView("course/detail", "detail", getDetail(id));
    }

    private JSONObject getDetail(long id) {
        MomiaHttpResponse resp = get("/course/detail?id=" + id);
        return (JSONObject) resp.getData();
    }

    @RequestMapping(value = "/detail/app", method = RequestMethod.GET)
    public ModelAndView detailApp(@RequestParam long id) {
        return new ModelAndView("course/detail_app", "detail", getDetail(id));
    }
}
