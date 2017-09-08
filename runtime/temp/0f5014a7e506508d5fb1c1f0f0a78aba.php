<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:30:"./themes/admin/techan\add.html";i:1502109474;s:24:"./themes/admin/base.html";i:1499446551;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>驴友天下后台管理系统 - Powered By Juzhonghui.Cn</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="__JS__/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="__CSS__/font-awesome.min.css">
    <!--CSS引用-->
    
<style>
    #id_photo_a_view,#id_photo_b_view,#zizhi_view{width: 392px;height: 232px;border: 1px solid #009688;}
    #thumb_view{width: 240px;height: 180px;}
    .thumb_upbar{position: absolute;top: 60%;left: 17%;margin: -18px 0 0 -56px;}
    .photo_upbar .layui-upload-button {color: rgba(255,255,255,1);color: #009688}
</style>

    <link rel="stylesheet" href="__CSS__/admin.css">
    <!--[if lt IE 9]>
    <script src="__CSS__/html5shiv.min.js"></script>
    <script src="__CSS__/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <!--头部-->
    <div class="layui-header header">
        <a href=""><img class="logo" src="__STATIC__/images/admin_logo.png" alt=""></a>
        <ul class="layui-nav" style="position: absolute;top: 0;right: 20px;background: none;">
            <li class="layui-nav-item"><a href="<?php echo url('/'); ?>" target="_blank">前台首页</a></li>
            <li class="layui-nav-item"><a href="" data-url="<?php echo url('admin/system/clear'); ?>" id="clear-cache">清除缓存</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;"><?php echo session('admin_name'); ?></a>
                <dl class="layui-nav-child"> <!-- 二级菜单 -->
                    <dd><a href="<?php echo url('admin/change_password/index'); ?>">修改密码</a></dd>
                    <dd><a href="<?php echo url('admin/login/logout'); ?>">退出登录</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <!--侧边栏-->
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree">
                <li class="layui-nav-item layui-nav-title"><a>管理菜单</a></li>
                <li class="layui-nav-item">
                    <a href="<?php echo url('admin/index/index'); ?>"><i class="fa fa-home"></i> 网站信息</a>
                </li>
                <?php if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): if( count($menu)==0 ) : echo "" ;else: foreach($menu as $key=>$vo): if(isset($vo['children'])): ?>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a>
                    <dl class="layui-nav-child">
                        <?php if(is_array($vo['children']) || $vo['children'] instanceof \think\Collection || $vo['children'] instanceof \think\Paginator): if( count($vo['children'])==0 ) : echo "" ;else: foreach($vo['children'] as $key=>$v): ?>
                        <dd><a href="<?php echo url($v['name']); ?>"> <?php echo $v['title']; ?></a></dd>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </dl>
                </li>
                <?php else: ?>
                <li class="layui-nav-item">
                    <a href="<?php echo url($vo['name']); ?>"><i class="<?php echo $vo['icon']; ?>"></i> <?php echo $vo['title']; ?></a>
                </li>
                <?php endif; endforeach; endif; else: echo "" ;endif; ?>

                <li class="layui-nav-item" style="height: 30px; text-align: center"></li>
            </ul>
        </div>
    </div>

    <!--主体-->
    
<div class="layui-body">
    <!--tab标签-->
    <div class="layui-tab layui-tab-brief">
        <ul class="layui-tab-title">
            <li class=""><a href="<?php echo url('admin/techan/index'); ?>">特产管理</a></li>
            <li class="layui-this">发布特产</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="layui-form form-container" action="<?php echo url('admin/techan/save'); ?>" method="post">
                    <div class="layui-form-item">
                        <label class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" name="techan_name" value="" required  lay-verify="required"  class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">产地</label>
                        <div class="layui-input-inline">
                            <select name="chandi" lay-verify="required">
                                <option value="">选择产地</option>
                                <?php if(is_array($chandi_list) || $chandi_list instanceof \think\Collection || $chandi_list instanceof \think\Paginator): if( count($chandi_list)==0 ) : echo "" ;else: foreach($chandi_list as $key=>$vo): ?>
                                <option value="<?php echo $vo['id']; ?>"><?php echo $vo['name']; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">成本价格</label>
                        <div class="layui-input-inline">
                            <input type="number" name="techan_price" value="" required  lay-verify="required"  class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">元</div>
                        <label class="layui-form-label">经销提成</label>
                        <div class="layui-input-inline">
                            <input type="number" name="techan_price" value="" required  lay-verify="required"  class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">元</div>
                        <label class="layui-form-label">导游提成</label>
                        <div class="layui-input-inline">
                            <input type="number" name="techan_price" value="" required  lay-verify="required"  class="layui-input">
                        </div>
                        <div class="layui-form-mid layui-word-aux">元</div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">租车须知</label>
                        <div class="layui-input-block">
                            <textarea name="about" placeholder="" class="layui-textarea" id="about"></textarea>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <label class="layui-form-label">缩略图</label>
                        <div class="layui-input-block">
                            <img id="thumb_view" src="__IMAGES__/upload_image.png">
                            <input type="hidden" name="techan_thumb" value="" class="layui-input layui-input-inline" id="thumb">
                            <div class="thumb_upbar">
                                <input type="file" name="file" class="layui-upload-file thumb">
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">图集</label>
                        <div class="layui-input-block">
                            <button type="button" id="upload-photo-btn" class="layui-btn">上传图集</button>
                            <div id="photo-container"></div>
                        </div>
                    </div>
                    <?php if($admin_id == 1): ?>
                    <div class="layui-form-item">
                        <label class="layui-form-label">推荐</label>
                        <div class="layui-input-block">
                            <input type="radio" name="is_recommend" value="1" title="推荐">
                            <input type="radio" name="is_recommend" value="0" title="未推荐" checked="checked">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">状态</label>
                        <div class="layui-input-block">
                            <input type="radio" name="status" value="1" title="直接上线">
                            <input type="radio" name="status" value="0"  checked="checked" title="等待审核">
                        </div>
                    </div>
                    <?php endif; ?>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="*">保存</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


    <!--底部-->
    <div class="layui-footer footer">
        <div class="layui-main">
            <p>2016-2017 &copy; 由<a href="http://www.juzhonghui.cn" target="_blank" style="color: #0055aa">贵州聚众汇科技有限公司</a>承建（技术支持：0851-88621870）</p>
        </div>
    </div>
</div>

<script>
    // 定义全局JS变量
    var GV = {
        current_controller: "admin/<?php echo (isset($controller) && ($controller !== '')?$controller:''); ?>/",
        base_url: "__STATIC__"
    };
</script>
<!--JS引用-->
<script src="__JS__/layui/lay/dest/layui.all.js"></script>
<script src="__JS__/admin.js"></script>

<script src="__JS__/ueditor/ueditor.config.js"></script>
<script src="__JS__/ueditor/ueditor.all.min.js"></script>
<script src="__JS__/jquery-1.11.0.js"></script>
<script type="text/javascript" src="__JS__/citys.js"></script>


<script src="__JS__/jquery.min.js"></script>

<!--页面JS脚本-->

<script>
    $(function() {
        var ue = UE.getEditor('content'),
            uploadEditor = UE.getEditor('upload-photo-btn'),
            photoListItem,
            uploadImage;

        uploadEditor.ready(function () {
            uploadEditor.setDisabled();
            uploadEditor.hide();
            uploadEditor.addListener('beforeInsertImage', function (t, arg) {
                $.each(arg, function (index, item) {
                    photoListItem = '<div class="photo-list"><input type="text" name="photo[]" value="' + item.src + '" class="layui-input layui-input-inline">';
                    photoListItem += '<button type="button" class="layui-btn layui-btn-danger remove-photo-btn">移除</button></div>';

                    $('#photo-container').append(photoListItem).on('click', '.remove-photo-btn', function () {
                        $(this).parent('.photo-list').remove();
                    });
                });
            });
        });

        $('#upload-photo-btn').on('click', function () {
            uploadImage = uploadEditor.getDialog("insertimage");
            uploadImage.open();
        });
    });

    //图片上传
    layui.upload({
        url: "/api/upload/upload",
        type: 'image',
        elem:'.thumb',
        title:'上传缩略图',
        ext: 'jpeg|jpg|png|gif|bmp',
        success: function (data) {
            if (data.error === 0) {
                layer.msg('上传成功');
                document.getElementById('thumb').value = data.url;
                document.getElementById('thumb_view').src = data.url;
            } else {
                layer.msg(data.message);
            }
        }
    });

    layui.use('layedit', function(){
        var layedit = layui.layedit;
        layedit.build('about', {
            height: 200 //设置编辑器高度
        });
    });

</script>

</body>
</html>