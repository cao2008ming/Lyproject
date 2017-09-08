<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:33:"./themes/default/index\index.html";i:1500623948;s:26:"./themes/default/base.html";i:1503065559;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>
        
        <?php echo \think\Config::get('website_name'); ?> - Powered By Juzhonghui.Cn
    </title>
    
    <meta name="keywords" content="">
    
    
    <meta name="description" content="">
    
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="author" content="贵阳网站建设 -www.juzhonghui.cn">
    <link rel="stylesheet" href="__CSS__/row.css">
    <link rel="stylesheet" href="__JS__/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="__CSS__/font-awesome.min.css">
    <link rel="stylesheet" href="__CSS__/home/common.css?<?php echo \think\Config::get('update_version'); ?>">
    <!--CSS引用-->
    
<link rel="stylesheet" href="__CSS__/home/banner.css?<?php echo \think\Config::get('update_version'); ?>">
<link rel="stylesheet" href="__CSS__/home/index.css?<?php echo \think\Config::get('update_version'); ?>">

    <!--[if lt IE 9]>
    <script src="__CSS__/html5shiv.min.js"></script>
    <script src="__CSS__/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="layui-layout">
        <!--头部-->
        <div class="layui-header header">
            <div class="layui-main">
                <ul class="layui-nav">
                    <a href=""><img class="logo" src="__IMAGES__/home/logo.png" alt=""></a>
                    <?php if(is_array($nav) || $nav instanceof \think\Collection || $nav instanceof \think\Paginator): if( count($nav)==0 ) : echo "" ;else: foreach($nav as $key=>$vo): ?>
                    <li class="layui-nav-item">
                        <a href="<?php echo url($vo['link']); ?>"><i class="<?php echo $vo['icon']; ?>"></i><?php echo $vo['name']; ?></a>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; if($user_id): ?>
                    <li class="layui-nav-item user_info">
                        <a href="javascript:;">欢迎您：<span class="layui-themes-color"><?php echo session('user_name'); ?></span> </a>
                        <dl class="layui-nav-child"> <!-- 二级菜单 -->
                            <dd><a href="<?php echo url('user/profile'); ?>">个人中心</a></dd>
                            <dd><a href="<?php echo url('change_password/index'); ?>">修改密码</a></dd>
                            <dd><a href="<?php echo url('user/logout'); ?>">退出登录</a></dd>
                        </dl>
                    </li>
                    <?php else: ?>
                    <li class="login">
                        <a href="<?php echo url('user/register'); ?>" class="layui-btn layui-btn-normal">注册</a>
                        <a id="login" class="layui-btn layui-btn-default">登录</a>
                    </li>
                    <?php endif; ?>
                </ul>

            </div>
        </div>
        <!--主体-->
        
<div id="slideBox" class="slideBox">
    <div class="hd">
        <ul>
            <li></li>
            <li></li>
            <li></li>
        </ul>
    </div>
    <div class="bd">
        <ul>
            <?php if(is_array($slide) || $slide instanceof \think\Collection || $slide instanceof \think\Paginator): $i = 0; $__LIST__ = $slide;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
            <li style="background: url(<?php echo $vo['image']; ?>) 50% 0px no-repeat;">
                <a href="<?php echo $vo['link']; ?>" target="<?php echo $vo['target']; ?>" title="<?php echo $vo['name']; ?>"></a>
            </li>
            <?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div>
</div>
<div class="layui-main">
    <div class="a-index-1">
        <a href="<?php echo $ad['link']; ?>" target="<?php echo $ad['target']; ?>">
            <img src="<?php echo $ad['image']; ?>" alt="<?php echo $ad['name']; ?>" title="<?php echo $ad['name']; ?>">
        </a>
    </div>
    <div class="row">
        <!--tab 框-->
        <div class="col-md-8">
            <div class="layui-tab layui-tab-card">
                <ul class="layui-tab-title tab-ul">
                    <li class="layui-this">酒店</li>
                    <li>导游</li>
                    <li>车辆</li>
                    <li>线路</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="row">
                            <div class="col-md-9">
                                <div class="layui-tab layui-tab-brief">
                                    <ul class="layui-tab-title">
                                        <li class="layui-this">酒店预订</li>
                                    </ul>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">目的地</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="title" required lay-verify="required"
                                               placeholder="如:贵阳" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">入住日期</label>
                                        <div class="layui-input-inline">
                                            <input name="title" required lay-verify="required" placeholder="yyyy-mm-dd"
                                                   class="layui-input" id="LAY_demorange_s">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">退房日期</label>
                                        <div class="layui-input-inline">
                                            <input name="title" required lay-verify="required" placeholder="yyyy-mm-dd"
                                                   class="layui-input" id="LAY_demorange_e">
                                        </div>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">酒店星级</label>
                                    <div class="layui-input-inline">
                                        <select name="quiz1">
                                            <option value="">请选择省</option>
                                            <option value="浙江" selected="">浙江省</option>
                                            <option value="你的工号">江西省</option>
                                            <option value="你最喜欢的老师">福建省</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">关键词</label>
                                    <div class="layui-input-block">
                                        <input type="text" name="title" required lay-verify="required"
                                               placeholder="如酒店名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <center style="margin-top: 110px;">
                                    <button class="layui-btn layui-btn-danger layui-btn-radius"
                                            style="height: 70px;font-size: 18px;">搜索
                                    </button>
                                </center>
                            </div>
                        </div>

                    </div>
                    <div class="layui-tab-item">2</div>
                    <div class="layui-tab-item">3</div>
                    <div class="layui-tab-item">4</div>
                </div>
            </div>
        </div>
        <!--视频-->
        <div class="col-md-4">
            <div class="news">
                <div class="news-title">热点资讯
                    <span class="more"><a href="<?php echo url('/home/news'); ?>">更多>></a></span>
                </div>
                <ul class="newsa">
                    <?php if(is_array($news) || $news instanceof \think\Collection || $news instanceof \think\Paginator): $i = 0; $__LIST__ = $news;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <li>❈ <a href="<?php echo url('/home/news/detail',['id'=>$vo['id']]); ?>"><?php echo $vo['title']; ?></a></li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="grids">
    <div class="layui-main">
        <fieldset class="layui-elem-field layui-field-title">
            <legend>选择我们就是一种标准</legend>
            <div class="layui-field-box">
                你在<span class="layui-themes-color">度假</span> ，一个私信、一条短信，他们和他们的<span
                    class="layui-themes-color">伙伴都在</span>，随时<span class="layui-themes-color">呼应</span>你。
            </div>
        </fieldset>
        <!--九宫格-->
        <div class="row layui-grids">
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/index.png" title="">
                    <span class="title">首页</span>
                </a>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/routes.png" title="">
                    <span class="title">旅游线路</span>
                </a>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/guide.png" title="">
                    <span class="title">导游</span>
                </a>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/bus.png" title="">
                    <span class="title">车辆</span>
                </a>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/techan.png" title="">
                    <span class="title">特产</span>
                </a>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/hotel.png" title="">
                    <span class="title">酒店</span>
                </a>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/tejia.png" title="">
                    <span class="title">特价</span>
                </a>
            </div>
            <div class="col-md-3">
                <a href="#">
                    <img src="__IMAGES__/home/icon/about.png" title="">
                    <span class="title">关于我们</span>
                </a>
            </div>
        </div>
    </div>
</div>
<!--快速搜索2-->
<div class="layui-main">
    <div class="search row">
        <form class="layui-form col-md-offset-9 form" action="">
            <div class="slogan">
                <div class="h1">旅游</div>
                <div class="title">一群人嗨翻天<br>Travel Plan</div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    目的地
                    <br>
                    Distination
                </label>
                <div class="layui-input-block">
                    <input type="text" name="place" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    出发时间
                    <br>
                    Departure
                </label>
                <div class="layui-input-block">
                    <input type="text" name="day" required onclick="layui.laydate({elem: this, festival: true})"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    出游天数
                    <br>
                    Days
                </label>
                <div class="layui-input-block">
                    <input type="number" name="title" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    出游人数
                    <br>
                    Number
                </label>
                <div class="layui-input-block">
                    <input type="number" name="title" required lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn layui-btn-mini layui-btn-radius layui-btn-danger layui-float-right"
                            lay-submit lay-filter="formDemo">&nbsp;下一步&nbsp;
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>

        <div class="layui-footer footer footer-doc">
            <div class="layui-main">
                <div class="row">
                    <div class="col-md-2">
                        <img class="footer-logo" src="http://www.kutx.cn/xiaotupian/icons/png/200711/20071126152041660.png">
                    </div>
                    <div class="col-md-4">
                        <h4>服务联系</h4>
                        <hr>
                        <ul>
                            <li>客户热线：0851-00000000</li>
                            <li>电子邮箱：admin@admin.com</li>
                            <li>办公地址：贵州省贵阳市观山湖区中天会展城</li>
                        </ul>
                    </div>
                    <div class="col-md-4 row">
                        <div class="col-md-6">
                            <h4>企业介绍</h4>
                            <hr>
                            <ul>
                                <li><a href="<?php echo url('home/about/AboutUs'); ?>">关于我们</a></li>
                                <li>新闻咨询</li>
                                <li>联系我们</li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h4>发现我们</h4>
                            <hr>
                            <ul>
                                <li>加入我们</li>
                                <li>免责申明</li>
                                <li>安全保障</li>
                            </ul>
                        </div>

                    </div>
                    <div class="col-md-2">
                        <img class="footer-ewm" src="http://www.twword.com/uploads/wiki/93/87/50698_0.jpg">
                    </div>
                </div>
            </div>
            <div class="copyright">技术支持:<a href="<?php echo \think\Config::get('copyright_web'); ?>"><?php echo \think\Config::get('copyright_name'); ?></a></div>
        </div>
        <!--JS引用-->
        <script src="__JS__/layui/lay/dest/layui.all.js"></script>
        <script src="__JS__/jquery.min.js"></script>
        <script src="__JS__/home/common.js?<?php echo \think\Config::get('update_version'); ?>"></script>
        
        
        <!--页面JS脚本-->
        

<script src="__JS__/home/jquery.SuperSlide.2.1.1.js"></script>
<script src="__JS__/home/switch.js"></script>
<script src="__JS__/home/common.js"></script>
<script src="__JS__/home/banner.js"></script>
<script>
    layui.use('layer', function () {
        var layer = layui.layer;
        layer.open({
            type: 1,
            title: false,
            offset: 'rb',
            shade: 0,
            area: ['240px', '140px'],
            content: '<div><a onclick="openVideo()"><img src="__IMAGES__/home/video.jpg" width="240px"></a></div>',
            cancel: function () {
                layer.msg('成功关闭，该窗口将永不显示')
            }
        });
    });
    function openVideo() {
        var layer = layui.layer;
        layer.open({
            type: 1,
            title: false,
            shade: [0.8, '#000000'],
            area: ['576px', '326px'],
            content: '<video width="570" height="321" controls>' +
            '<source src="http://www.runoob.com/try/demo_source/movie.mp4" type="video/mp4">' +
            '<source src="http://www.runoob.com/try/demo_source/movie.ogg" type="video/ogg">' +
            '您的浏览器不支持 HTML5 video 标签。' +
            '</video>',
            cancel: function () {
                layer.msg('感谢您的观看')
            }
        });
    }
</script>

    </div>
</body>
<div id="login-box" style="display: none">
    <form class="layui-form" action="<?php echo url('user/login'); ?>" style="padding: 16px;" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">登录账号</label>
            <div class="layui-input-block">
                <input type="text" name="username" required lay-verify="required" placeholder="手机号/用户名"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">登录口令</label>
            <div class="layui-input-block">
                <input type="password" name="password" required lay-verify="required" placeholder="密码"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <a href="<?php echo url('user/register'); ?>" class="layui-btn layui-btn-primary">马上注册</a>
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">立即登录</button>
            </div>
        </div>
    </form>
</div>
</html>