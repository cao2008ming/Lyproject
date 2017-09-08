/**
 * Created by torans on 17/6/30.
 */

//搜索监听
layui.use('form', function(){
    var form = layui.form();

    //监听提交
    form.on('submit(submit)', function(data){
        layer.msg('页面跳转中...')
        // layer.msg(JSON.stringify(data.field));
        // window.location="http://lvyou.juzhonghui.cn/home/hotel/search"
    });
});
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

    document.getElementById('LAY_days_s').onclick = function(){
        start.elem = this;
        laydate(start);
    }
    document.getElementById('LAY_days_e').onclick = function(){
        end.elem = this
        laydate(end);
    }

});
//全部酒店
layui.use('flow', function(){
    var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
    var flow = layui.flow;
    flow.load({
        elem: '#hotel-all' //指定列表容器
        ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
            var lis = [];
            //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
            $.get('/api/hotel/lists?page='+page, function(res){
                //假设你的列表返回在data集合中
                layui.each(res.data, function(index, item){
                    var address_icon = '/public/static/images/home/icon/Address.png';
                    var list_item = '<li class="row">'
                        +'<div class="thumb col-md-3">'
                        +'<img src="'+item.thumb+'" alt="'+item.name+'">'
                        +'</div>'
                        +'<div class="info col-md-7">'
                        +'<p class="title">' +
                        '<a href="info/id/'+item.id+'" alt="'+item.name+'">'+item.name+'</a>' +
                        '</p>'
                        +'<p class="comment">'
                        +'<a href="#">'
                        +' <span class="layui-themes-color" style="padding-right: 6px;">'+item.comments+' </span>'
                        +' 条评价'
                        +'</a>|'
                        +'<a href="#">'
                        +'用户评分:'
                        +' <span class="layui-themes-color">'+item.score+'</span>'
                        +'  分'
                        +' </a>'
                        +'</p>'
                        +'<p class="about">'+item.info+'...</p>'
                        +' <p class="address">'
                        +'<img src="'+address_icon+'"> 位于: '+item.address+'</p>'
                        +'</div>'
                        +'<div class="info col-md-2 price-box">'
                        +' <div class="box">'
                        +' <p class="price">'
                        +'<dfn>¥</dfn> '
                        +'<b>'+item.price+'</b>'
                        +'起/晚'
                        +'</p>'
                        +'<a href="info/id/'+item.id+'" alt="'+item.name+'" class="layui-btn layui-btn-warm">查看详情</a>'
                        +'</div>'
                        +'</div>'
                        +'</li>'

                    lis.push(list_item);
                });

                //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                next(lis.join(''), page < res.total);
            });
        }
    });
});

// 某城市酒店列表
function get_list(city,box) {
    layui.use('flow', function(){
        var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
        var flow = layui.flow;
        flow.load({
            elem: '#'+box //指定列表容器
            ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
                var lis = [];
                //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
                $.get('/api/hotel/lists?page='+page+'&city='+city, function(res){
                    //假设你的列表返回在data集合中
                    layui.each(res.data, function(index, item){
                        var address_icon = '/public/static/images/home/icon/Address.png';
                        var list_item = '<li class="row">'
                            +'<div class="thumb col-md-3">'
                            +'<img src="'+item.thumb+'" alt="'+item.name+'">'
                            +'</div>'
                            +'<div class="info col-md-7">'
                            +'<p class="title">' +
                            '<a href="info/id/'+item.id+'" alt="'+item.name+'">'+city+item.name+'</a>' +
                            '</p>'
                            +'<p class="comment">'
                            +'<a href="#">'
                            +' <span class="layui-themes-color"  style="padding-right: 6px;">'+item.comments+'</span>'
                            +'条评价'
                            +'</a>|'
                            +'<a href="#">'
                            +'用户评分:'
                            +' <span class="layui-themes-color">'+item.score+'</span>'
                            +'  分'
                            +' </a>'
                            +'</p>'
                            +'<p class="about">'+item.info+'...</p>'
                            +' <p class="address">'
                            +'<img src="'+address_icon+'"> 位于: '+item.address+'</p>'
                            +'</div>'
                            +'<div class="info col-md-2 price-box">'
                            +' <div class="box">'
                            +' <p class="price">'
                            +'<dfn>¥</dfn> '
                            +'<b>'+item.price+'</b>'
                            +'起/晚'
                            +'</p>'
                            +'<a href="info/id/'+item.id+'" alt="'+item.name+'" class="layui-btn layui-btn-warm">查看详情</a>'
                            +'</div>'
                            +'</div>'
                            +'</li>'

                        lis.push(list_item);
                    });

                    //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                    //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                    next(lis.join(''), page < res.total);
                });
            }
        });
    });
}
