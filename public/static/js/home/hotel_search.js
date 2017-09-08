/**
 * Created by torans on 17/7/13.
 */

var city = getUrlParameter('city');
var input_city = $("select[name='city']").val();

var keywords = getUrlParameter('keywords');
var input_keywords = $('#keywords').val();

var start_s = getUrlParameter('start_s');
var input_start_s = $('start_s').val();

var start_e = getUrlParameter('start_e');
var input_start_e = $('start_e').val();

if($.trim(input_keywords)!=''||$.trim(keywords)!= '')
{
    $('#keywords').val(keywords)
}

if ($.trim(input_city) =='' ||$.trim(city) !=''){
    $("select[name='city']").val('贵阳');
    $('#option_'+city).attr('selected',true);
    form.render('select');
}

if($.trim(start_s) !=''){
    $('#start_s').val(start_s);
}
if($.trim(start_e) !=''){
    $('#start_e').val(start_e);
}

$('#num').change(function () {
    if( parseInt($(this).val()) <=0){
        layer.msg('房间数必须为整数');
        $('#num').val('');
    }
})
// 起始如期选择
layui.use('laydate', function(){
    var laydate = layui.laydate;
    var start = {
        min: laydate.now()
        ,max: '2099-06-16 23:59:59'
        ,istoday: false
        ,choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };
    var end = {
        min: laydate.now()
        ,max: '2099-06-16 23:59:59'
        ,istoday: false
        ,choose: function(datas){
            start.max = datas; //结束日选好后，重置开始日的最大日期
        }
    };

    document.getElementById('start_s').onclick = function(){
        start.elem = this;
        laydate(start);
    }
    document.getElementById('start_e').onclick = function(){
        end.elem = this
        laydate(end);
    }

});


//地图层固定
$(window).scroll(function(event){
    var height = $(document).scrollTop();
    if (height>=474){
        $('#map').addClass('map-fixed')
        $('#sort-box').addClass('fixed')
    } else {
        $('#map').removeClass('map-fixed')
        $('#sort-box').removeClass('fixed')
    }
});

//价格、销量排序
/*layui.use('flow', function(){
    var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
    var flow = layui.flow;
    flow.load({
        elem: '#hotel-list' //指定列表容器
        ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
            var lis = [];
            $.get('/api/hotel/lists?page='+page, function(res){
                //假设你的列表返回在data集合中
                layui.each(res.data, function(index, item){
                    var list_item ='<li>' +
                        ' <div class="row">' +
                        '<div class="col-md-3 thumb">' +
                        '<a href="/home/hotel/info/id/'+item.id+'.html">' +
                        '<img lay-src= "'+item.thumb+'" src="" alt="">' +
                        '</a>' +
                        '</div>' +
                        '<div class="col-md-6 info">' +
                        '<h3 class="hotel-name">' +
                        '<a href="/home/hotel/info/id/'+item.id+'.html">'+item.name+'</a>' +
                        '</h3>' +
                        '<div class="star star-4"></div>' +
                        ' <div class="hotel-info">'+item.info+'</div>' +
                        '<div class="hotel-score-comment">' +
                        '<span class="score">用户评分：'+item.score+' /5分</span>' +
                        '<span class="comment">来自'+item.comments+' 条客户点评</span>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-md-3 price">' +
                        '<div class="price-box">' +
                        '<p>' +
                        '<span class="rmb"><sup>RMB</sup></span>' +
                        '<span class="money">'+item.price+' </span>' +
                        '<span class="qi">起</span>' +
                        '</p>' +
                        '<p class="newst-checkin">' +
                        '五分钟前' +
                        '</p>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</li>'

                    lis.push(list_item);
                });

                //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                next(lis.join(''), page < res.total);
            });
        }
    });
});*/
//结果排序
$('#sortByPriceDown').click(function(e){

    if($(this).data('by') ==1){
        $(this).data('by',2)
    }else{
        $(this).data('by',1)
    }
    // url = url+
    layer.msg($(this).data('by'))
})
//筛选排序
function SelectTag(t) {
    this.child = t.child || ".sx_child", this.over = t.over || "on", this.all = t.all || ".all", this.init()
}

//筛选
$.extend(SelectTag.prototype, {
    init: function() {
        var t = this;
        t._bindEvent(), t._select()
    },
    _bindEvent: function() {
        var t = this;
        $(t.child).click(function(e) {
            e.preventDefault();
            var i = window.location.href,
                n = $(this).attr("rel"),
                r = $(this).attr("name");
            $(this).hasClass(t.over) || (window.location.href = t._changeURLPar(i, r, n))
        }), $(t.all).click(function(e) {
            e.preventDefault();
            var i = window.location.href,
                n = $(this).attr("name");
            $("[name=" + n + "]").removeClass(t.over), $(this).addClass(t.over), window.location.href = t._delUrlPar(i, n)
        })
    },
    _delUrlPar: function(t, e) {
        var n = "";
        if (t.indexOf("?") == -1) return t;
        n = t.substr(t.indexOf("?") + 1);
        var r = "",
            a = "";
        if (n.indexOf("&") != -1) {
            r = n.split("&");
            for (i in r) r[i].split("=")[0] != e && (a = a + r[i].split("=")[0] + "=" + r[i].split("=")[1] + "&");
            return t.substr(0, t.indexOf("?")) + "?" + a.substr(0, a.length - 1)
        }
        return r = n.split("="), r[0] == e ? t.substr(0, t.indexOf("?")) : t
    },
    _changeURLPar: function(t, e, i) {
        var n = this,
            r = e + "=([^&]*)",
            a = e + "=" + i,
            s = encodeURI(n._getQueryString(e));
        return t.match(r) ? t = t.replace(s, i) : t.match("[?]") ? t + "&" + a : t + "?" + a
    },
    _getQueryString: function(t) {
        var e = new RegExp("(^|&)" + t + "=([^&]*)(&|$)", "i"),
            i = window.location.search.substr(1).match(e);
        return null != i ? decodeURI(i[2]) : null
    },
    _select: function() {
        var t = this,
            e = window.location.href;
        $(t.child).each(function() {
            var i = $(this).attr("name") + "=" + $(this).attr("rel"),
                n = new RegExp(encodeURI(i), "g");
            if (n.test(e)) {
                $(this).addClass(t.over);
                var r = $(this).attr("name");
                $("[name=" + r + "]").eq(0).removeClass(t.over)
            } else $(this).removeClass(t.over)
        })
    }
});

//分页带参数
var url = window.location.href;  //当前url
var pages = $('.pagination>li>a').attr('href');//当前分页url
var search = window.location.search;//获取参数
var page = pages.split('?'); //当前分页url的参数部分
var page_param = page['1'].split('&'); //
var current_page = page_param['0'];//获取分页的page参数
var pathname = window.location.pathname; //获取当前url的相对地址
var s = search.split('&');//将当前url参数转为数组，以便去掉page=X
s.shift();//从数组中删除第一个，即page=x
search_param = s.join('&');//数组转字符串
var real_url = pathname+'?'+current_page; //组成新的相对地址+分页中的page参数
$('.pagination>li>a').attr('href',real_url+'&'+search_param); //替换原来分页的url


