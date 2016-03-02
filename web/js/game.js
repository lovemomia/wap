    /**
     * Created by hoze 16/01/29.
     */

    var content_array = new Array();
    var key_array = new Array();
    var daan = 0;
    var audio;

    function createObject(title,content,answer,img){
        var obj = new Object();
        obj.title= title;
        obj.content = content;
        obj.answer = answer;
        obj.img = img;

        return obj;
    }

    function createIntegral(key,start,name,img,end,x_end,f_d_text,f_x_text){
        var obj = new Object();
        obj.key = key;
        obj.start = start;
        obj.name = name;
        obj.img = img;
        obj.end = end;
        obj.x_end = x_end;
        obj.key = key;
        obj.f_d_text = f_d_text;
        obj.f_x_text = f_x_text;

        return obj;
    }

    (function(){
       
        initData();
        sleep(3000);
        var ksdt_html = "<div class='div_answer'><img src='images/home.png' width='100%'></div>";
        ksdt_html += "<div class='warper' ><p class='mtb20 div_button'><a class='postrlt' id='start_answer' name='start_answer'>开始答题</a></p></div>";
        var divshow = $("#warper");
        divshow.text("");
        divshow.append(ksdt_html);

        $('#start_answer').click(function(){
            next(0);
        });

        $("#audioPlay").click(function(){
            if(audio.paused){
                audio.play();
                this.style.backgroundImage="url(images/ad_on.png)";
            }else{
                audio.pause();
                this.style.backgroundImage="url(images/ad_off.png)";
            }
        });

    })();

    function next_answer(index_id,daan_id){
        var obj = content_array[index_id];
        var answer = obj.answer;
        var strHtml = "";
        var id = index_id+1;
        if(index_id < 9){
            if(answer == daan_id) {
                daan = daan + 10;
            }
            var obj_d = obj.content;
            strHtml += "<div class='warper'>";
            strHtml += "<p class='tc mtb20'><img src='"+obj_d[daan_id].pic+"' width='100%' ></p>";
            strHtml += "<p class='fff'><span class='ft24'>"+obj_d[daan_id].a_text+"</span></p>";
            strHtml += "<p class='tc mtb20'></p>";
            strHtml += "<p class='mtb20 fbb'><a class='postrltx' href='javascript:void(0)' onclick='next("+id+")' >下一题</a></p>";
            strHtml += "</div>";
            var divshow = $("#warper");
            divshow.text("");
            divshow.append(strHtml);
        }else{
            if(answer == daan_id){
                daan = daan + 10;
            }
            window.location.href = "/gameresult?score="+daan;
        }
    }

    function next(index_id){

        var obj = content_array[index_id];
        var strHtml = "";

        strHtml += "<div class='warper'><div class='warper_x'>";
        strHtml += "<p class='tc fbb' style='margin-top: 20%;margin-left: 0%;text-align: left;'><span class='ft16'>"+obj.title+"</span></p>";
        strHtml += "<p><img src='"+obj.img+"' width='100%'></p>";
        strHtml += "</div><p class='tc mtb20'></p>";
        var obj_d = obj.content;
        strHtml += "<p class='mtb20'><a class='postrlta ft18' href='javascript:void(0)' onclick='next_answer(" + index_id + ",0)'>&numsp;&numsp;&numsp;&numsp;"+obj_d[0].text+"</a></p>";
        strHtml += "<p class='mtb20'><a class='postrltb ft18' href='javascript:void(0)' onclick='next_answer(" + index_id + ",1)'>&numsp;&numsp;&numsp;&numsp;"+obj_d[1].text+"</a></p>";
        strHtml += "<p class='mtb20'><a class='postrltc ft18' href='javascript:void(0)' onclick='next_answer(" + index_id + ",2)'>&numsp;&numsp;&numsp;&numsp;"+obj_d[2].text+"</a></p>";
        strHtml += "</div>";

        var divshow = $("#warper");
        divshow.text("");
        divshow.append(strHtml);
    }

    /**判断是不是微信打开**/
    function is_weixn(){
        return false;
        var ua = navigator.userAgent.toLowerCase();
        if(ua.match(/MicroMessenger/i)=="micromessenger") {
            return true;
        } else {
            return false;
        }
    }

    function initData(){
        $('#home_img').attr("src","/images/home.png");
        $('#myaudio').attr("src","/audio/xiyou.mp3");
        audio =  document.getElementById("myaudio");
        audio.play();

        $.getJSON("/json/default.json",function(data){
            $.each(data,function(infoIndex,info){
                var detail = new createObject(info["title"],info["content"],info["answer"],info["img"]);
                content_array.push(detail);
            });
        });

        $.getJSON("/json/integral.json",function(data){
            $.each(data,function(infoIndex,info){
                var key_desc = new createIntegral(info["key"],info["start"],info["name"],info["img"],info["end"],info["x_end"],info["f_d_text"],info["f_x_text"]);
                key_array.push(key_desc);
            });
        });

    }

    function sleep(numberMillis) {
        var now = new Date();
        var exitTime = now.getTime() + numberMillis;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime)
                return;
        }
    }