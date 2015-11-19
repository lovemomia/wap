package cn.momia.wap.web.ctrl.test;

import cn.momia.wap.web.ctrl.AbstractController;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/test/1")
public class Test1 extends AbstractController {
    private static final Map<Integer, JSONObject> results = new HashMap<Integer, JSONObject>();
    static {
        JSONObject chi = new JSONObject();
        JSONObject cheng = new JSONObject();
        JSONObject huang = new JSONObject();
        JSONObject lv = new JSONObject();
        JSONObject qin = new JSONObject();
        JSONObject lan = new JSONObject();
        JSONObject zi = new JSONObject();
        JSONObject hui = new JSONObject();

        results.put(0, chi);
        results.put(1, cheng);
        results.put(2, huang);
        results.put(3, lv);
        results.put(4, qin);
        results.put(5, lan);
        results.put(6, zi);
        results.put(7, hui);

        chi.put("color", "#f91b1b");
        chi.put("title", "赤: 语言智能");
        chi.put("desc", "这类小朋友对语言和文字很敏感，听说读写能力突出；在作家、演说家、记者、编辑、节目主持人、播音员、律师等职业上会有喜人的表现。");
        chi.put("people", "马丁·路德·金、丘吉尔");
        chi.put("img", "http://s.sogokids.com/2015-11-19/7f922eab9c8d58822535a802a9e93883.jpg");

        cheng.put("color", "#ff5b02");
        cheng.put("title", "橙：逻辑数理智能");
        cheng.put("desc", "这类小朋友擅长逻辑思考、推理和发现规律，喜欢提出问题并通过实验寻找答案，对科学的新发展有着浓厚的兴趣。和数字有关的工作十分需要他们。");
        cheng.put("people", "爱因斯坦");
        cheng.put("img", "http://s.sogokids.com/2015-11-19/8f0ad085cb7df8500ad3bb151ffc8059.jpg");

        huang.put("color", "#ffc302");
        huang.put("title", "黄：空间视觉智能");
        huang.put("desc", "对拥有这类智能的小朋友来说，通过色彩、线条、形状所呈现出来的世界是他们的天堂，他们善于通过利用线条、图形、色彩和空间及它们之间的关系来表达思想和感情。他们常常在建筑师、画家、摄影师、几何学家这些职业上得心应手。");
        huang.put("people", "贝聿铭");
        huang.put("img", "http://s.sogokids.com/2015-11-19/b1aa83bc9fe8d8e00f6739239c288e6c.jpg");

        lv.put("color", "#4ad047");
        lv.put("title", "绿：身体运动智能");
        lv.put("desc", "我们不能要求拥有这类智能的小朋友长时间坐着不动哦，因为用身体说话是他们的天性，他们喜爱户外活动，热衷动手改造事物。运动员、舞蹈家、外科医生、手艺人都有这种智能优势。");
        lv.put("people", "乔丹");
        lv.put("img", "http://s.sogokids.com/2015-11-19/a5524a89c143a576f447bb57d6c96154.jpg");

        qin.put("color", "#0fd3ba");
        qin.put("title", "青：音乐智能");
        qin.put("desc", "在音调、旋律、节奏等方面出色的感知是这类智能小朋友的天赋。这种智能在作曲家、指挥家、歌唱家、乐师、乐器制作者、音乐评论家等人员那里都有出色的表现。");
        qin.put("people", "贝多芬、巴赫、莫扎特");
        qin.put("img", "http://s.sogokids.com/2015-11-19/72cef070e2b4ba5c1b4eba2d82628f51.jpg");

        lan.put("color", "#129afa");
        lan.put("title", "蓝：人际智能");
        lan.put("desc", "拥有这类智能的小朋友有很强的组织能力；擅长解决纷争；对别人的情绪和想法有敏锐的观察力，很容易和他人建立密切的关系；同时也是一个善解人意的小朋友，很适应团队合作。");
        lan.put("people", "奥普拉");
        lan.put("img", "http://s.sogokids.com/2015-11-19/d8958e2c69da499e67acffe3f919053f.jpg");

        zi.put("color", "#a902ff");
        zi.put("title", "紫：内省智能");
        zi.put("desc", "准确的自我定位、理性的情绪控制、合理的人生规划和深入的自我反省是这类智能人群的特点。他们更喜欢独立工作，拥有自我空间。非常适合政治家、哲学家、心理学家、教师等职业的需求。");
        zi.put("people", "柏拉图");
        zi.put("img", "http://s.sogokids.com/2015-11-19/16b9b54d00918d5e270efab8a7a9e5ef.jpg");

        hui.put("color", "#838084");
        hui.put("title", "灰：自然探索智能");
        hui.put("desc", "在对自然和社会的探索上，这类智能小朋友有着天然的兴趣，他们愿意和植物、动物、石头和云彩交朋友，在生物界的乐园里探索、冒险。");
        hui.put("people", "达尔文");
        hui.put("img", "http://s.sogokids.com/2015-11-19/c07f3a164e197a9c1ca6f284e98aa39f.jpg");
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public ModelAndView result(@RequestParam String scores) {
        List<Pair> scoresList = new ArrayList<Pair>();
        String[] strs = StringUtils.split(scores, ",");
        if (strs.length != 8) return new ModelAndView("error", "msg", "服务器内部错误");
        for (int i = 0; i < strs.length; i++) {
            scoresList.add(new Pair(i, Integer.valueOf(strs[i])));
        }

        Collections.sort(scoresList, new Comparator<Pair>() {
            @Override
            public int compare(Pair o1, Pair o2) {
                return o2.getScore() - o1.getScore();
            }
        });

        JSONArray resultJson = new JSONArray();
        for (int i = 0; i < 3; i++) {
            Pair score = scoresList.get(i);
            if (score.getScore() <= 0) break;
            resultJson.add(results.get(score.getId()));
        }

        return new ModelAndView("test/1/result", "results", resultJson);
    }
}

class Pair {
    private int id;
    private int score;

    public Pair(int id, int score) {
        this.id = id;
        this.score = score;
    }

    public int getId() {
        return id;
    }

    public int getScore() {
        return score;
    }
}
