/**
 * Created by torans on 17/6/26.
 */

var element = layui.element();
var web_url='http://lvyou.juzhonghui.cn';

// 定义全局JS变量
var GV = {
    current_controller: "home/{$controller|default=''}/",
    base_url: "__STATIC__",
    image_url: "__IMAGES__",
};

var layer = layui.layer,
    element = layui.element(),
    laydate = layui.laydate,
    form = layui.form();

// URL参数获取方法
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : sParameterName[1];
        }
    }
};
//图片懒加载
layui.use('flow', function(){
    var flow = layui.flow;
    //当你执行这样一个方法时，即对页面中的全部带有lay-src的img元素开启了懒加载（当然你也可以指定相关img）
    flow.lazyimg();
});
//登录弹窗
$('#login').on('click', function(){
    layer.open({
        type: 1,
        title:['会员登录','font-size:18px;'],
        area: ['400px', '270px'],
        // btn: ['马上注册', '立即登录'],
        content: $('#login-box'),
        // shadeClose:true,
        anim:3,
        yes: function(index, layero){
            layer.msg('不开心。。', {icon: 5});
        },
        btn2: function(index, layero) {
            layer.alert('只想简单的提示');
        }
    });
});

/**
 * 通用表单提交(AJAX方式)
 */
form.on('submit(*)', function (data) {
    $.ajax({
        url: data.form.action,
        type: data.form.method,
        data: $(data.form).serialize(),
        success: function (info) {
            if (info.code === 1) {
                setTimeout(function () {
                    location.href = info.url;
                }, 1000);
            }
            layer.msg(info.msg);
        }
    });

    return false;
});

// 登录提交
form.on('submit(login)', function (data) {
    $.ajax({
        url: data.form.action,
        type: data.form.method,
        data: $(data.form).serialize(),
        success: function (info) {
            layer.msg(info.msg);
            if (info.code === 1) {
                setTimeout(function () {
                    location.href = info.url;
                }, 1000);

            }

        }
    });

    return false;
});


