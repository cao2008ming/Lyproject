/**
 * Created by torans on 17/7/11.
 */

//获取导游列表
layui.use('flow', function () {
    var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
    var flow = layui.flow;
    flow.load({
        elem: '#guide-all' //指定列表容器
        , done: function (page, next) { //到达临界点（默认滚动触发），触发下一页
            // layer.msg('更多加载中...')
            var lis = [];
            //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
            $.get('/api/guide/getlist?page=' + page, function (res) {
                //假设你的列表返回在data集合中
                layui.each(res.data, function (index, item) {
                    var list_item ='<li class="row list-item">' +
                        '<div class="col-md-3 thumb-box">' +
                        '<a href="/home/guide/info/id/'+item.id+'">' +
                        '<img src="'+item.thumb+'" alt="'+item.name+'">' +
                        '</a>' +
                        '</div>' +
                        '<div class="col-md-6 info-box">' +
                        '<p class="name-box">' +
                        '<a href="/home/guide/info/id/'+item.id+'" class="name">'+item.name+'</a>' +
                        '<span class="level">中级导游</span>' +
                        '<span class="price">' +
                        '￥<i>500</i>/起' +
                        '</span>' +
                        '</p>' +
                        '<p class="shanchang">' +
                        '<span>擅长业务:</span>' +
                        ''+item.shanchang+'' +
                        '</p>' +
                        '<div class="about row">' +
                        '<div class="col-md-3 t1">自我推荐:</div>' +
                        '<div class="col-md-9 t2">'+item.introduction+'</div>' +
                        '</div>' +
                        '</div>' +
                        '<div class="col-md-3 price-box">' +
                        '<div class="box Absolute-Center">' +
                        '<p class="num">'+item.servered+'</p>' +
                        '<span>服务人数</span><hr>' +
                        '<span>游客评价</span>' +
                        '<p class="score">'+item.score+'</p>' +
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
});