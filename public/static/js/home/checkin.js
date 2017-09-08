/**
 * Created by torans on 17/7/4.
 */

$('#checkin_e').change(function () {
   alert(111)
});
var obj = document.getElementById("checkin_num");
var checkin_end = document.getElementById("checkin_e");
var unit = $('#unit').val();

//notice
$('#notice').mouseover(function () {
    layer.msg('中文填写如：王小花')
});
obj.onkeyup = function () {
    var start = document.getElementById("checkin_s").value;//获取起始日期
    var end   = document.getElementById("checkin_e").value;//获取结束日期
    var days  = getDays(start, end);
    if (obj.value > 20) {
        layer.msg('最大入住房间不能大于20间')
        $('#checkin_num').val(" ");
        $('#ids').empty();
    }
    else {
    if(isNaN(obj.value)){
            layer.msg('入住房间只能填写数字')
        $('#checkin_num').val(" ");
        return false;
        }
        $('#amount').text(obj.value * unit * days);
        $('#notice-box').show();
        $('#ids').empty();
        for (var i = 1; i < obj.value; i++) {
            var p = i + 1;
            var item ='<div class="layui-inline">'
                + '<label class="layui-form-label">客户姓名</label>'
                + '<div class="layui-input-inline">'
                + '<input type="text" name="checkin_info[]" required lay-verify="required"  autocomplete="off" class="layui-input name-input">'
                + '</div>'

            $('#ids').append(item)
        }
    }
}

layui.use('form', function () {
    var form = layui.form();

    //监听提交
    form.on('submit(checkin)', function (data) {
        if ($('#xieyi').prop('checked') === false) {
            layer.msg('必须同意《客户入住协议》')
            return false;
        }
    });
});
function openxieyi() {
    layer.open({
        type: 2,
        area: ['600px', '580px'],
        title: '《客户入住协议书》',
        content: '/home/agreement/index?type=chekin' //这里content是一个普通的String
        , btn: ['同意本协议']
        , btn1: function (index, layero) {
            layer.close(index)
            $("#xieyi").prop("checked", true);
            $('.layui-form-checkbox').addClass('layui-form-checked');
            layer.msg('你已同意《客户入住协议》')
        }
    });
}

//时间选择
layui.use('laydate', function(){
    var laydate = layui.laydate;
    var start = {
        min: laydate.now()
        ,max: laydate.now(+20)
        ,istoday: false
        ,choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        min: laydate.now(+1)
        ,max: laydate.now(+27)
        ,istoday: false
        ,choose: function(datas){
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };

    document.getElementById('checkin_s').onclick = function(){
        start.elem = this;
        laydate(start);
    }
    document.getElementById('checkin_e').onclick = function(){

        end.elem = this
        laydate(end);
    }
});
function check(){
    var start=document.getElementById("checkin_s").value;//获取起始日期
    var end=document.getElementById("checkin_e").value;//获取结束日期
    var amount = $('#amount').text();//获取价格
    if(start==""){
        alert("请输入开始日期！");
        return;
    }
    else if(end==""){
        alert("请输入结束日期！");
    }
    $('#days').text(getDays(start, end));
    $('#amount').text(getDays(start, end) * unit * obj.value);//重新计算价格
    layer.msg('您将入住 '+ getDays(start, end) +'天')
}
function getDays(startDate,endDate) {
    var date1Str = startDate.split("-");//将日期字符串分隔为数组，数组元素分别为年、月、日
    //根据年、月、日的值创建Date对象
    var date1Obj = new Date(date1Str[0], (date1Str[1] - 1), date1Str[2]);
    var date2Str = endDate.split("-");
    var date2Obj = new Date(date2Str[0], (date2Str[1] - 1), date2Str[2]);
    var t1 = date1Obj.getTime();//返回从1970-1-1开始计算到Date对象中的时间之间的毫秒数
    var t2 = date2Obj.getTime();//返回从1970-1-1开始计算到Date对象中的时间之间的毫秒数
    var datetime = 1000 * 60 * 60 * 24; //一天时间的毫秒值
    var minusDays = Math.floor(((t2 - t1) / datetime));//计算出两个日期天数差
    var days = Math.abs(minusDays);//如果结果为负数，取绝对值
    return days;
}