package cn.momia.wap.web.ctrl.test;

import cn.momia.image.api.ImageFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    JdbcTemplate jdbcTemplate;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public ModelAndView list() {
        List<Test> tests = getTests();
        return new ModelAndView("test/list", "tests", tests);
    }

    private List<Test> getTests() {
        String sql = "SELECT A.Id, A.Title, A.Cover, COUNT(DISTINCT B.UserId) AS Joined FROM SG_Test A LEFT JOIN SG_TestResult B ON A.Id=B.TestId WHERE A.Status=1 GROUP BY A.Id";
        final List<Test> tests = new ArrayList<Test>();
        jdbcTemplate.query(sql, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet rs) throws SQLException {
                Test test = new Test();
                test.setId(rs.getInt("Id"));
                test.setTitle(rs.getString("Title"));
                test.setCover(ImageFile.largeUrl(rs.getString("Cover")));
                test.setJoined(rs.getLong("Joined"));

                tests.add(test);
            }
        });

        return tests;
    }
}
