package cn.momia.wap.web.ctrl.entryform;

import cn.momia.api.user.SmsServiceApi;
import cn.momia.common.core.http.MomiaHttpResponse;
import cn.momia.common.core.util.MobileUtil;
import cn.momia.wap.web.ctrl.AbstractController;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/entryform")
public class EntryFormController extends AbstractController {
    @Autowired private JdbcTemplate jdbcTemplate;
    @Autowired private SmsServiceApi smsServiceApi;

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public MomiaHttpResponse submit(@RequestParam String childname, @RequestParam String mobile) {
        if (StringUtils.isBlank(childname)) return MomiaHttpResponse.FAILED("孩子姓名不能为空");
        if (MobileUtil.isInvalid(mobile)) return MomiaHttpResponse.FAILED("无效的手机号码");

        String sql = "SELECT COUNT(1) FROM SG_EntryForm WHERE ChildName=? AND Mobile=? AND Status<>0";
        if (jdbcTemplate.queryForList(sql, new Object[]{childname, mobile}, Long.class).get(0) > 0) return MomiaHttpResponse.SUCCESS;

        sql = "INSERT INTO SG_EntryForm (ChildName, Mobile, AddTime) VALUES (?, ?, NOW())";
        if (jdbcTemplate.update(sql, new Object[] { childname, mobile }) > 0) {
            smsServiceApi.notify(mobile, "您已报名成功");
            return MomiaHttpResponse.SUCCESS;
        }
        return MomiaHttpResponse.FAILED;
    }
}
