/**
 * Created by torans on 17/6/30.
 */

var id = $('#hotel_id').val();
// 固定
$(window).scroll(function(event){
    var height = $(document).scrollTop();
    if (height>=700){
        $('#tab-box').addClass('fixed')
        $('#map').addClass('map-fixed')
    } else {
        $('#tab-box').removeClass('fixed')
        $('#map').removeClass('map-fixed')
    }
});



//获取评论列表
layui.use('flow', function(){
    var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
    var flow = layui.flow;
    flow.load({
        elem: '.box' //指定列表容器
        ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
            var lis = [];
            var isNull = null;
            //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
            $.get('/api/hotel/get_hotel_comments?page='+page+'&id='+id, function(res){
                //假设你的列表返回在data集合中
                layui.each(res.data, function(index, item){
                    var list_item1 =''+
                        '<li class="comment-list-box-item">' +
                            '<p>' +
                                '<span style="padding-right: 20px;">'+item.user_name+'</span>' +
                                '<span>'+item.create_time+'</span>' +
                            '</p>' +
                            '<div class="row">' +
                                '<div class="col-md-2" style="text-align: center;margin-top:16px;">' +
                                   '<img class="avatar" lay-src="'+item.avatar+'" alt="">' +
                                    '<p class="score-level">'+item.score_level+'</p>' +
                                '</div>' +
                                '<div class="col-md-10">' +
                                    '<p>'+item.content+'</p>';

                      var list_item3 = '</div>' +
                            '</div>' +
                        '</li>';

                    if (item.photo !==isNull){
                        var list_item2_A ='<ul class="comments-photos" id="layer-photos-comment">';
                        var list_item2_box =[];
                        layui.each(item.photo, function(fo, vo){
                            var list_item2_li = '<img layer-src="/public/static/images/default_avatar.png"  layer-pid="" src= "/public/static/images/default_avatar.png" alt="点击放大" layer-index="'+fo+'">'
                            list_item2_box.push(list_item2_li);
                        });
                        var list_item2_B = '</ul>';
                        var list_item2= list_item2_A + list_item2_box +list_item2_B;
                        var list_item = list_item1 + list_item2 + list_item3;
                    } else{
                        var list_item = list_item1 + list_item3;
                    };
                    lis.push(list_item);
                });

                //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
                //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
                next(lis.join(''), page < res.total);
            });
        }
    });
});

//获取大床房型
$.get('/api/hotel/get_rooms_by_bedType?hotel_id='+id+'&bed_type=1', function(res){
    layui.each(res, function(index, item){
        var rooms =
            '<tr>'
            +'<td></td>'
            +'<td>['+item.cate_id+'] '+item.name+'</td>'
            +'<td>'+item.bed_type+'</td>'
            +'<td>'+item.breakfast+'</td>'
            +'<td>'+item.window+'</td>'
            +'<td class="layui-themes-color">￥'+item.price+'</td>'
            +'<td><a class="layui-btn layui-btn-danger" href="/home/hotel/checkin/?hotel_id='+id+'&room_id='+item.id+'">预订</a></td>'
            +'</tr>'
        $('#rooms').append(rooms);
    });
});

function get_rooms(bed_type) {
    $.get('/api/hotel/get_rooms_by_bedType?hotel_id='+id+'&bed_type='+bed_type, function(res){

        console.log(bed_type)
      if(res.length!==0){
          $('#rooms').empty();
          layui.each(res, function(index, vo){
              var rooms =
                  '<tr>'
                  +'<td></td>'
                  +'<td>['+vo.cate_id+'] '+vo.name+'</td>'
                  +'<td>'+vo.bed_type+'</td>'
                  +'<td>'+vo.breakfast+'</td>'
                  +'<td>'+vo.window+'</td>'
                  +'<td class="layui-themes-color">￥'+vo.price+'</td>'
                  +'<td><a class="layui-btn layui-btn-danger" href="#">预订</a></td>'
                  +'</tr>'
              $('#rooms').append(rooms);
          });
      } else {
         layer.msg('抱歉，该酒店暂无此类房间');
      }
    });
}