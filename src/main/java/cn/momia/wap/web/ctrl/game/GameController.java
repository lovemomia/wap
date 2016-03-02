package cn.momia.wap.web.ctrl.game;

import cn.momia.common.webapp.config.Configuration;
import cn.momia.wap.web.ctrl.AbstractController;
import cn.momia.wap.web.ctrl.user.WxConfig;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by hoze on 16/2/4.
 */
@Controller
public class GameController extends AbstractController {

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public ModelAndView game(HttpServletRequest request) {

        JSONObject share = new JSONObject();
        String url = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        share.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), url + (StringUtils.isBlank(queryString) ? "" : ("?" + queryString))));

        return new ModelAndView("game", "share", share);
    }

    @RequestMapping(value = "/gameresult",method = RequestMethod.GET)
    public ModelAndView gameresult(HttpServletRequest request,@RequestParam int score) {

        String result = "[\n" +
                "    {\"key\":\"0\",\"start\":\"你的道行只能打败\",\"name\":\"霸波儿奔\",\"img\":\"/images/img2/bbeb.jpg\",\"end\":\"道行太弱,师父要被妖怪吃啦!快去搬救兵吧!\",\"x_end\":\"快来领取技能包,升级你的道行吧!\",\"f_d_text\":\"我在西游记里只能打败霸波儿奔和奔波儿灞,快来帮帮我!\",\"f_x_text\":\"只有缕直舌头的人,才能帮得了我!\"},\n" +
                "    {\"key\":\"10\",\"start\":\"你的道行只能打败\",\"name\":\"小钻风\",\"img\":\"/images/img2/xzf.jpg\",\"end\":\"道行太弱,师父要被妖怪吃啦!快去搬救兵吧!\",\"x_end\":\"快来领取技能包,升级你的道行吧!\",\"f_d_text\":\"我在西游记里只能打败小钻风,快来帮帮我!\",\"f_x_text\":\"师父被妖怪抓进狮驼洞了,各位大神快来帮我救师父!\"},\n" +
                "    {\"key\":\"20\",\"start\":\"你的道行只能打败\",\"name\":\"有来有去\",\"img\":\"/images/img2/ylyq.jpg\",\"end\":\"道行太弱,师父要被妖怪吃啦!快去搬救兵吧!\",\"x_end\":\"快来领取技能包,升级你的道行吧!\",\"f_d_text\":\"我在西游记里只能打败有来有去,快来帮帮我!\",\"f_x_text\":\"嘤嘤嘤,谁来帮我去偷赛太岁的铃铛呀?\"},\n" +
                "    {\"key\":\"30\",\"start\":\"你的道行只能打败\",\"name\":\"蜘蛛精\",\"img\":\"/images/img2/zzj.jpg\",\"end\":\"道行太弱,师父要被妖怪吃啦!快去搬救兵吧!\",\"x_end\":\"快来领取技能包,升级你的道行吧!\",\"f_d_text\":\"我在西游记里只能打败蜘蛛精,快来帮帮我!\",\"f_x_text\":\"蜘蛛精在前,蜈蚣精在后,我需要帮手!\"},\n" +
                "    {\"key\":\"40\",\"start\":\"你的道行只能打败\",\"name\":\"黑熊怪\",\"img\":\"/images/img2/hxg.jpg\",\"end\":\"道行太弱,师父要被妖怪吃啦!快去搬救兵吧!\",\"x_end\":\"快来领取技能包,升级你的道行吧!\",\"f_d_text\":\"我在西游记里勉强应付黑熊怪,快来帮帮我!\",\"f_x_text\":\"这年头,熊孩子都不好对付啊……\"},\n" +
                "    {\"key\":\"50\",\"start\":\"你的道行只能打败\",\"name\":\"白骨精\",\"img\":\"/images/img2/bgj.jpg\",\"end\":\"道行太弱,师父要被妖怪吃啦!快去搬救兵吧!\",\"x_end\":\"快来领取技能包,升级你的道行吧!\",\"f_d_text\":\"我在西游记里勉强应付白骨精,快来帮帮我!\",\"f_x_text\":\"女人都不是省油的灯,我选择狗带……\"},\n" +
                "    {\"key\":\"60\",\"start\":\"你的道行只能打败\",\"name\":\"金银角大王\",\"img\":\"/images/img2/yjdw.jpg\",\"end\":\"道行太弱,师父要被妖怪吃啦!快去搬救兵吧!\",\"x_end\":\"快来领取技能包,升级你的道行吧!\",\"f_d_text\":\"我在西游记里勉强应付金银角大王,快来帮帮我!\",\"f_x_text\":\"左手一个金角大王,右手一个银角大王,动作太慢打不过啊!\"},\n" +
                "\n" +
                "    {\"key\":\"70\",\"start\":\"你的道行竟然可以打败\",\"name\":\"九头蛇\",\"img\":\"/images/img2/jts.jpg\",\"end\":\"太厉害了,成功营救师父!快去炫耀战果吧!\",\"x_end\":\"获得技能包一个,快去看看有什么宝贝吧!\",\"f_d_text\":\"我在西游记里打败了九头蛇,不服来战!\",\"f_x_text\":\"天王盖地虎,宝塔镇河妖!猴塞雷!\"},\n" +
                "    {\"key\":\"80\",\"start\":\"你的道行竟然可以打败\",\"name\":\"牛魔王\",\"img\":\"/images/img2/nmw.jpg\",\"end\":\"太厉害了,成功营救师父!快去炫耀战果吧!\",\"x_end\":\"获得技能包一个,快去看看有什么宝贝吧!\",\"f_d_text\":\"我在西游记里打败了牛魔王,不服来战!\",\"f_x_text\":\"咱们牛着呐!\"},\n" +
                "    {\"key\":\"90\",\"start\":\"你的道行竟然可以打败\",\"name\":\"大鹏怪\",\"img\":\"/images/img2/dpg.jpg\",\"end\":\"太厉害了,成功营救师父!快去炫耀战果吧!\",\"x_end\":\"获得技能包一个,快去看看有什么宝贝吧!\",\"f_d_text\":\"我在西游记里可以制服大鹏怪,不服来战!\",\"f_x_text\":\"哦呦,你咋不上天呐?\"},\n" +
                "    {\"key\":\"100\",\"start\":\"你的道行竟然可以打败\",\"name\":\"六耳猕猴\",\"img\":\"/images/img2/jhw.jpg\",\"end\":\"太厉害了,成功营救师父!快去炫耀战果吧!\",\"x_end\":\"获得技能包一个,快去看看有什么宝贝吧!\",\"f_d_text\":\"我在西游记里竟然战胜了六耳猕猴,不服来战!\",\"f_x_text\":\"居然比大圣还厉害,给你100分不怕你骄傲!\"}\n" +
                "\n" +
                "]";
        JSONObject share = new JSONObject();
        String url = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        share.put("config", new WxConfig(Configuration.getString("Weixin.JsApiAppId"), url + (StringUtils.isBlank(queryString) ? "" : ("?" + queryString))));
        JSONArray result_ls = JSON.parseArray(result);
        for (int i = 0; i < result_ls.size(); i++) {
            if (result_ls.getJSONObject(i).getInteger("key") == score){
                share.put("res",result_ls.getJSONObject(i));
                break;
            }
        }
        return new ModelAndView("gameresult", "share", share);
    }

}
