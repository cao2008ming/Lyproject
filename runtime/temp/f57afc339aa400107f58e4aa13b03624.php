<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:32:"./themes/admin/techan\index.html";i:1502108000;s:24:"./themes/admin/base.html";i:1499446551;}*/ ?>
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
            <li class="layui-this">特产管理</li>
            <li class=""><a href="<?php echo url('admin/techan/add'); ?>">发布特产</a></li>
        </ul>
        <div class="layui-tab-content">

            <form class="layui-form layui-form-pane" action="<?php echo url('admin/techan/index'); ?>" method="get">
                <div class="layui-inline">
                    <label class="layui-form-label">分类</label>
                    <div class="layui-input-inline">
                        <select name="cid">
                            <option value="0">全部</option>
                            <?php if(is_array($chandi_list) || $chandi_list instanceof \think\Collection || $chandi_list instanceof \think\Paginator): if( count($chandi_list)==0 ) : echo "" ;else: foreach($chandi_list as $key=>$vo): ?>
                            <option value="<?php echo $vo['id']; ?>"><?php echo $vo['name']; ?></option>
                            <?php endforeach; endif; else: echo "" ;endif; ?>
                        </select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">关键词</label>
                    <div class="layui-input-inline">
                        <input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="请输入关键词" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <button class="layui-btn">搜索</button>
                </div>
            </form>
            <hr>

            <form action="" method="post" class="ajax-form">
                <button type="button" class="layui-btn layui-btn-small ajax-action" data-action="<?php echo url('admin/techan/toggle',['type'=>'audit']); ?>">审核</button>
                <button type="button" class="layui-btn layui-btn-warm layui-btn-small ajax-action" data-action="<?php echo url('admin/techan/toggle',['type'=>'cancel_audit']); ?>">取消审核</button>
                <button type="button" class="layui-btn layui-btn-danger layui-btn-small ajax-action" data-action="<?php echo url('admin/techan/delete'); ?>">删除</button>
                <div class="layui-tab-item layui-show">
                    <table class="layui-table">
                        <thead>
                        <tr>
                            <th style="width: 15px;"><input type="checkbox" class="check-all"></th>
                            <th style="width: 30px;">ID</th>
                            <th style="width: 30px;">排序</th>
                            <th>标题</th>
                            <th>产地</th>
                            <th>作者</th>
                            <th>阅读量</th>
                            <th>状态</th>
                            <th>发布时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if(is_array($techan_list) || $techan_list instanceof \think\Collection || $techan_list instanceof \think\Paginator): if( count($techan_list)==0 ) : echo "" ;else: foreach($techan_list as $key=>$vo): ?>
                        <tr>
                            <td><input type="checkbox" name="ids[]" value="<?php echo $vo['id']; ?>"></td>
                            <td><?php echo $vo['id']; ?></td>
                            <td><?php echo $vo['name']; ?></td>
                            <td><?php echo $vo['chandi']; ?></td>
                            <td><?php echo $vo['user_id']; ?></td>
                            <td><?php echo $vo['unit']; ?></td>
                            <td><?php echo $vo['status']==1 ? '已审核' : '未审核'; ?></td>
                            <td><?php echo $vo['create_time']; ?></td>
                            <td>
                                <a href="<?php echo url('admin/techan/edit',['id'=>$vo['id']]); ?>" class="layui-btn layui-btn-normal layui-btn-mini">编辑</a>
                                <a href="<?php echo url('admin/techan/delete',['id'=>$vo['id']]); ?>" class="layui-btn layui-btn-danger layui-btn-mini ajax-delete">删除</a>
                            </td>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                    <!--分页-->
                    <?php echo $techan_list->render(); ?>
                </div>
            </form>
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

<script src="__JS__/jquery.min.js"></script>


<script src="__JS__/jquery.min.js"></script>

<!--页面JS脚本-->

</body>
</html>