/**
 * Created by torans on 17/6/26.
 */

// 轮播
$(".slideBox").slide({mainCell:".bd ul",effect:"leftLoop",autoPlay:true,
    startFun:function(i,c){
        del();
        switch(i){
            case 0:
                $("#a3").addClass('animation3');
                $("#a4").addClass('animation4');
                $("#a5").addClass('animation5');
                break;
            case 1:
                $("#a11").addClass('animation8');
                $("#a12").addClass('animation9');

                break;
            // case 2:
            // $("#a8").addClass('animation6');
            // $("#a9").addClass('animation7');
            // $("#a10").addClass('animation7');
            // break;
            case 2:

                $(".content1 #a20").addClass('animation20');
                $(".b2_word #a21").addClass('animation21');
                $(".b2_word #a22").addClass('animation21');
                $(".b2_word #a23").addClass('animation20');
                $(".content1 #a24").addClass('animation22');
                break;
            default:break;
        }
    }
});

