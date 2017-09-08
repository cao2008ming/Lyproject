/**
 * Created by torans on 17/7/21.
 */

var phone = $('#phone').text();
var name = $('#name').text();
// 固定
$(window).scroll(function (event) {
    var height = $(document).scrollTop();
    if (height >= 592) {
        $('#tab').addClass('fixed')
    } else {
        $('#tab').removeClass('fixed')
    }
});
function tel() {
    //示范一个公告层
    layer.open({
        type: 1,
        title: false, //不显示标题栏,
        closeBtn: false,
        area: '350px;',
        shade: 0.8,
        id: 'LAY_layuipro', //设定一个id，防止重复弹出
        btn: ['朕知道了']
        ,
        moveType: 1 //拖拽模式，0或者1
        ,
        content: '<div style="padding: 50px; line-height: 22px; background-color: #1A5187; color: #fff; font-weight: 300;">' +
        '<span style="text-align: center;font-size: 20px;">' + phone + '(' + name + ')</span>' +
        '<p>联系时请说明来自贵州驴友天下官网^_^</p>' +
        '</div>'
        ,
        success: function (layero) {
            var btn = layero.find('.layui-layer-btn');
            btn.css('text-align', 'center');
        }
    });
}