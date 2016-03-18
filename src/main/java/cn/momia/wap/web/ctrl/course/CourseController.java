package cn.momia.wap.web.ctrl.course;

import cn.momia.common.core.util.TimeUtil;
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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/course")
public class CourseController extends AbstractController {
    private static final DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public static final int SKU_PLACE_STATUS_WEEK = 1;
    public static final int SKU_PLACE_STATUS_CURRENT_MONTH = 2;
    public static final int SKU_PLACE_STATUS_NEXT_MONTH = 3;

    public static final String[] MONTHS = { "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月" };

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView course(@RequestParam long id) {
        JSONObject courseJson = (JSONObject) get("/v3/course?id=" + id);
        courseJson.put("buyable", false);

        return new ModelAndView("course/course", "course", courseJson);
    }

    @RequestMapping(value = "/trial", method = RequestMethod.GET)
    public ModelAndView trial(@RequestParam long id) {
        JSONObject courseJson = (JSONObject) get("/v3/course?id=" + id);
        courseJson.put("buyable", true);
        courseJson.put("trial", true);

        return new ModelAndView("course/course", "course", courseJson);
    }

    @RequestMapping(value = "/buyable", method = RequestMethod.GET)
    public ModelAndView buyable(@RequestParam long id) {
        JSONObject courseJson = (JSONObject) get("/v3/course?id=" + id);
        courseJson.put("buyable", true);

        return new ModelAndView("course/course", "course", courseJson);
    }

    @RequestMapping(value = "/cancelable", method = RequestMethod.GET)
    public ModelAndView cancelable(HttpServletRequest request, @RequestParam long id, @RequestParam(value = "bid") long bookingId) {
        String utoken = getUtoken(request);

        JSONObject courseJson = (JSONObject) get("/v3/course?id=" + id);
        courseJson.put("cancelable", true);

        JSONObject skuJson = (JSONObject) get("/user/booked/sku?utoken=" + utoken + "&bid=" + bookingId);
        JSONObject placeJson = skuJson.getJSONObject("place");
        courseJson.put("address", placeJson == null ? "" : placeJson.getString("address"));
        courseJson.put("scheduler", skuJson.getString("scheduler"));

        return new ModelAndView("course/course", "course", courseJson);
    }

    @RequestMapping(value = "/skuplace", method = RequestMethod.GET)
    public ModelAndView skuplace(@RequestParam long id,
                                 @RequestParam(required = false, defaultValue = "2") int status,
                                 @RequestParam(required = false, defaultValue = "0") long pid) {
        JSONArray datesJson;
        Calendar calendar = Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH) + 1;
        int nextMonth = month + 1;
        if (nextMonth > 12) nextMonth = 1;
        switch (status) {
            case SKU_PLACE_STATUS_CURRENT_MONTH:
                datesJson = (JSONArray) get("/course/sku/month" + (pid > 0 ? "/bookable" : "/notend") + "?id=" + id + "&month=" + month);
                break;
            case SKU_PLACE_STATUS_NEXT_MONTH:
                datesJson = (JSONArray) get("/course/sku/month" + (pid > 0 ? "/bookable" : "/notend") + "?id=" + id + "&month=" + nextMonth);
                break;
            default:
                datesJson = (JSONArray) get("/course/sku/week" + (pid > 0 ? "/bookable" : "/notend") + "?id=" + id);
        }

        List<JSONObject> dates = new ArrayList<JSONObject>();
        for (int i = 0; i < datesJson.size(); i++) {
            JSONObject dateJson = datesJson.getJSONObject(i);
            String dateStr = dateJson.getString("date");
            try {
                Date date = DATE_FORMAT.parse(dateStr);
                calendar.setTime(date);
                dateJson.put("month", calendar.get(Calendar.MONTH) + 1);
                dateJson.put("day", calendar.get(Calendar.DATE));
                dateJson.put("weekday", "星期" + TimeUtil.getWeekDay(date).substring(1));
                dates.add(dateJson);
            } catch (ParseException e) {
                // do nothing
            }
        }

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("dates", dates);
        params.put("id", id);
        params.put("pid", pid);
        params.put("cur_month", MONTHS[month - 1]);
        params.put("next_month", MONTHS[nextMonth - 1]);

        return new ModelAndView("course/skuplace", "params", params);
    }

    @RequestMapping(value = "/material", method = RequestMethod.GET)
    public ModelAndView material(HttpServletRequest request, @RequestParam int id) {
        String utoken = getUtoken(request);
        if (StringUtils.isBlank(utoken)) {
            String referer = request.getHeader("Referer");
            StringBuffer url = request.getRequestURL().append("?").append(request.getQueryString());
            return new ModelAndView("redirect:/auth/login?ref=" + URLEncoder.encode(url.toString()) + "&back=" + URLEncoder.encode(referer));
        }

        JSONObject material = (JSONObject) get("/teacher/material?utoken=" + utoken + "&mid=" + id);

        return new ModelAndView("course/material", "material", material);
    }
}
