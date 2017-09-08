<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:33:"./themes/default/guide\index.html";i:1499916226;s:26:"./themes/default/base.html";i:1503065559;}*/ ?>
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
    
<link rel="stylesheet" href="__CSS__/home/guide.css?<?php echo \think\Config::get('update_version'); ?>">

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
        
<div class="head">
    <div class="layui-main">
        <div class="search">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline city">
                        <div class="layui-input-inline">
                            <select name="quiz1">
                                <option value="">选择城市</option>
                                <?php if(is_array($citys) || $citys instanceof \think\Collection || $citys instanceof \think\Paginator): $i = 0; $__LIST__ = $citys;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$fo): $mod = ($i % 2 );++$i;?>
                                <option value="<?php echo $fo['id']; ?>"><?php echo $fo['name']; ?></option>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline input">
                        <div class="layui-input-inline">
                            <input type="text" name="title" lay-verify="title" autocomplete="off"
                                   placeholder="输入您想去的城市、景点" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <div class="layui-input-inline submit">
                            <button class="layui-btn layui-btn-big layui-btn-warm shadow" lay-submit=""
                                    lay-filter="demo1">立即搜索
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
       <!-- <div class="citys">
            <ul>
                <li><a href="#">贵阳</a></li>
                <li><a href="#">贵阳</a></li>
                <li><a href="#">贵阳</a></li>
            </ul>
        </div>-->
    </div>
</div>
<div class="layui-main">
    <!--热门主题-->
    <div class="hot">
        <span class="hot-label">热门推荐</span>
        <div class="row">
            <div class="col-md-3 hot-item">
                <a href="#">
                    <p class="item-thumbnail">
                        <img src="http://dimg04.c-ctrip.com/images/fd/hotel/g1/M00/30/A1/CghzfVS96M6AYyl2AAXynlGypLA758_R_156_156.jpg" alt="">
                    </p>
                    <div class="item-overlay">
                        <p class="item-name">亲子家庭</p>
                    </div>
                </a>
            </div>
            <div class="col-md-3 hot-item">
                <a href="#">
                    <p class="item-thumbnail">
                        <img src="http://dimg04.c-ctrip.com/images/fd/hotel/g1/M00/30/A1/CghzfVS96M6AYyl2AAXynlGypLA758_R_156_156.jpg" alt="">
                    </p>
                    <div class="item-overlay">
                        <p class="item-name">亲子家庭</p>
                    </div>
                </a>
            </div>
            <div class="col-md-3 hot-item">
                <a href="#">
                    <p class="item-thumbnail">
                        <img src="http://dimg04.c-ctrip.com/images/fd/hotel/g1/M00/30/A1/CghzfVS96M6AYyl2AAXynlGypLA758_R_156_156.jpg" alt="">
                    </p>
                    <div class="item-overlay">
                        <p class="item-name">亲子家庭</p>
                    </div>
                </a>
            </div>
            <div class="col-md-3 hot-item">
                <a href="#">
                    <p class="item-thumbnail">
                        <img src="http://dimg04.c-ctrip.com/images/fd/hotel/g1/M00/30/A1/CghzfVS96M6AYyl2AAXynlGypLA758_R_156_156.jpg" alt="">
                    </p>
                    <div class="item-overlay">
                        <p class="item-name">亲子家庭</p>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <!--列表和右边栏-->
    <div class="row">
        <!--导游列表-->
        <div class="col-md-8 guide-list">
            <blockquote class="layui-elem-quote">
                <span>导游</span> 共有 <span class="layui-themes-color"><?php echo $count; ?></span> 个导游准备为您服务
            </blockquote>
            <ul id="guide-all"></ul>
        </div>
        <div class="col-md-4 right-side">
            <div class="side-box">
                <h1>如何选择自己满意的导游?</h1>
                <div class="info">
                    <p>搜索您想去的地方</p>
                    <span>寻找最熟悉的旅行行家</span>
                    <p>看擅长的业务</p>
                    <span>找到旅行业务相匹配的导游</span>
                    <p>看游客评价</p>
                    <span>通过以往顾客评价看接待能力</span>
                    <p>客户直接联系</p>
                    <span>通过口语沟通，从言语判断</span>
                </div>
            </div>
            <div class="side-box">
                <h1>联系我们为您定制更快捷</h1>
                <div class="contact">
                    <p>7x24小时服务热线</p>
                    <span>0851-0000 0000</span>
                    <span>0851-0000 0000</span>
                    <span>0851-0000 0000</span>
                </div>
            </div>
        </div>
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
        
<script src="__JS__/home/common.js"></script>
<script src="__JS__/home/guide.js?<?php echo \think\Config::get('update_version'); ?>"></script>

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