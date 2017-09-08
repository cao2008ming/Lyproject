/**
 * Created by torans on 17/7/8.
 */

// 用户注册页面
layui.use('form', function () {
    var form = layui.form();
    //监听提交
    form.on('submit(submit)', function (data) {
        // layer.msg(JSON.stringify(data.field));
        if($('mobile').val() ==null){
            $('#mobile_error').text('手机号码不能为空')
        }
    });

});


//密码强度认证
$('#password').keyup(function () {
    var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
    var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
    var enoughRegex = new RegExp("(?=.{6,}).*", "g");

    if (false == enoughRegex.test($(this).val())) {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass(' pw-defule');
        //密码小于六位的时候，密码强度图片都为灰色
    }
    else if (strongRegex.test($(this).val())) {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass(' pw-strong');
        //密码为八位及以上并且字母数字特殊字符三项都包括,强度最强
    }
    else if (mediumRegex.test($(this).val())) {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass(' pw-medium');
        //密码为七位及以上并且字母、数字、特殊字符三项中有两项，强度是中等
    }
    else {
        $('#level').removeClass('pw-weak');
        $('#level').removeClass('pw-medium');
        $('#level').removeClass('pw-strong');
        $('#level').addClass('pw-weak');
        //如果密码为6为及以下，就算字母、数字、特殊字符三项都包括，强度也是弱的
    }
    return true;
});

//判断密码是否相等
$('password1').change(function () {
    if ($('password') != $(this).val()) {
        layer.msg('两次密码不一致')
    }
});

//判断手机号码格式是否正确
$('#mobile').change(function () {
    var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
    if (!myreg.test($(this).val())) {
        layer.msg('手机号码格式不正确')
    } else {
        // 检查手机号
        $.ajax({
            type: 'GET',
            data: {mobile: $('#mobile').val()},
            url: '/api/checkuser/mobile',
            success: function (res) {
                console.log(res)
                if (res.code == 1) {
                    $('#mobile_success').show();
                    $('#mobile_error').hide();

                } else {
                    $('#mobile_success').hide();
                    $('#mobile_error').show();
                    $('#send_code').addClass('layui-btn-disabled');
                }
            }
        });
        $('#send_code').removeClass('layui-btn-disabled');
    }
})

//检查账号是否可用
$('#username').change(function () {
    $.ajax({
        type: 'GET',
        data: {username: $('#username').val()},
        url: '/api/checkuser/username',
        success: function (res) {
            console.log(res)
            if (res.code == 1) {
                $('#username_success').show();
                $('#username_error').hide();

            } else {
                $('#mobile_success').hide();
                $('#mobile_error').show();
            }
        }
    });
});
//判断验证码
$('#yzm').change(function () {
    var sms_id = $('#sms_id').val();
    if ($(this).val().length != 4) {
        layer.msg('验证码只能是4位纯数字');
        $('#yzm').val('');
    } else {
        $.ajax({
            type: 'GET',
            data: {sms_id: sms_id},
            url: '/api/sms/checkSms',
            success: function (res) {
                if (res == $('#yzm').val()) {
                    layer.msg('验证成功')
                } else {
                    layer.msg('验证码不正确')
                }
            }
        });
    }
});
var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数当前剩余秒数

var handler = function (captchaObj) {
    captchaObj.onReady(function () {
        $("#wait").hide();
    }).onSuccess(function () {
        var result = captchaObj.getValidate();
        if (!result) {
            return alert('请完成人机验证');
        }
        var mobile = $('#mobile').val();

        curCount = count;
        $.ajax({
            type: 'POST',
            data: {mobile: mobile, token: 'd7e8475f799e82ca', type: 1},
            url: '/api/sms/send_code/',
            success: function (res) {
                if (res.code) {
                    layer.msg('验证码发送成功');
                    resetCode();
                    $('#sms_id').val(res.sms_id);
                } else {
                    layer.msg('验证码发送失败');
                }
            }
        });
    });
    $('#send_code').click(function () {
        // 调用之前先通过前端表单校验
        captchaObj.verify();
    });
    // 更多接口说明请参见：http://docs.geetest.com/install/client/web-front/
};


$.ajax({
    // 获取id，challenge，success（是否启用failback）
    url: "/api/captcha/index?t=" + (new Date()).getTime(), // 加随机数防止缓存
    type: "get",
    dataType: "json",
    success: function (data) {
        // 使用initGeetest接口
        // 参数1：配置参数
        // 参数2：回调，回调的第一个参数验证码对象，之后可以使用它做appendTo之类的事件
        initGeetest({
            gt: data.gt,
            width: '80px',
            challenge: data.challenge,
            new_captcha: data.new_captcha,
            product: "bind", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
            offline: !data.success // 表示用户后台检测极验服务器是否宕机，一般不需要关注
            // 更多配置参数请参见：http://www.geetest.com/install/sections/idx-client-sdk.html#config
        }, handler);
    }
});


//倒计时
function resetCode() {
    var second = 30;
    var timer = null;
    timer = setInterval(function () {
        second -= 1;
        if (second > 0) {
            $("#send_code").text("请在" + second + "秒内输入验证码");
        } else {
            clearInterval(timer);
            $('#send_code').removeClass('layui-btn-disabled');
            $("#send_code").text("重新发送验证码");
        }
    }, 1000);
};


