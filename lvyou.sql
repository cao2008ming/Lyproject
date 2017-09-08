/*
Navicat MySQL Data Transfer

Source Server         : 本地服务器
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : lvyou

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-09-07 20:06:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for os_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `os_admin_user`;
CREATE TABLE `os_admin_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员用户名',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员密码',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 启用 0 禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(20) DEFAULT NULL COMMENT '最后登录IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) COMMENT '(null)'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
-- Records of os_admin_user
-- ----------------------------
INSERT INTO `os_admin_user` VALUES ('1', 'admin', '0dfc7612f607db6c17fd99388e9e5f9c', '1', '2016-10-18 15:28:37', '2017-09-05 22:46:57', '127.0.0.1');
INSERT INTO `os_admin_user` VALUES ('2', 'ran', '7b79e788e94c1c41b6d4e1b1280c4bdb', '1', '2017-05-17 11:44:23', '2017-06-13 15:12:05', '127.0.0.1');

-- ----------------------------
-- Table structure for os_article
-- ----------------------------
DROP TABLE IF EXISTS `os_article`;
CREATE TABLE `os_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `cid` smallint(5) unsigned NOT NULL COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `introduction` varchar(255) DEFAULT '' COMMENT '简介',
  `content` longtext COMMENT '内容',
  `author` varchar(20) DEFAULT '' COMMENT '作者',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0 待审核  1 审核',
  `reading` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '阅读量',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `is_top` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶  0 不置顶  1 置顶',
  `is_recommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐  0 不推荐  1 推荐',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `publish_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文章表';

-- ----------------------------
-- Records of os_article
-- ----------------------------
INSERT INTO `os_article` VALUES ('1', '1', '热烈庆祝贵州驴友天下网站正式上线', '', '<p>测试内容</p>', 'admin', '1', '0', '', null, '0', '0', '0', '2017-04-11 14:10:10', '2017-04-11 14:09:45');
INSERT INTO `os_article` VALUES ('2', '1', '贵州旅游业发展已上一个新的台阶', '', '<p>qqqqq</p>', 'admin', '1', '0', '', 'a:3:{i:0;s:52:\"/public/uploads/images/20170524/1495609431903083.png\";i:1;s:52:\"/public/uploads/images/20170524/1495609431550041.png\";i:2;s:52:\"/public/uploads/images/20170524/1495609431725122.png\";}', '0', '0', '0', '2017-05-24 15:03:54', '2017-05-24 15:03:06');
INSERT INTO `os_article` VALUES ('3', '1', '黔东南牯藏节将在6月10日举行', '', '<p>testwwww</p>', 'admin', '1', '0', '', 'a:3:{i:0;s:52:\"/public/uploads/images/20170701/1498846853911068.jpg\";i:1;s:52:\"/public/uploads/images/20170701/1498846853751808.jpg\";i:2;s:52:\"/public/uploads/images/20170701/1498846853154547.jpg\";}', '0', '0', '0', '2017-07-01 02:27:49', '2017-07-01 02:27:24');
INSERT INTO `os_article` VALUES ('4', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('5', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('6', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('7', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('8', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('9', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('10', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('11', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('12', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('13', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');
INSERT INTO `os_article` VALUES ('14', '1', '贵马组委会决定增开迷你马拉松绿色通道', '为充分贯彻全民健身战略部署及贵阳建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对2017贵阳国际马拉...', '<p style=\"font-family: \"><span style=\"font-size: 14px;\"><span style=\"font-family: 仿宋;\">&nbsp; &nbsp; &nbsp; &nbsp;为充分贯彻全民健身战略部署及贵阳</span><span style=\"font-family: 仿宋; color: rgb(43, 43, 43);\">建设健康城市整体规划，让更多人参与、体验马拉松的独特魅力，经组委会研究决定，对</span><span style=\"font-family: 仿宋;\">2017贵阳国际马拉松赛增开迷你马拉松绿色通道，在增加参赛名额的同时，将报名时间延长至7月6日18:00。</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">同时，为方便迷你马拉松参赛者（特别是亲子组与贵阳本地参赛者）报名，组委会在原有报名通道的基础上，增设微信公众号“数动体育”与“黔学帮”两个报名通道，通过这两个微信公众号报名将可享受报名费9折优惠，敬请广大跑友相互转告。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-family: 仿宋;\">迷你马拉松</span></strong></span></p><p style=\"font-family: \"><span style=\"font-size: 16px;\"><strong><span style=\"font-size: 19px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">比赛日期：2017年7月15日(星期六)上午6:30</span></strong><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\">。</span></strong></span><span style=\"font-size: 14px;\"><strong><span style=\"font-size: 13px; font-family: 宋体; color: rgb(51, 51, 51); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span></strong><span style=\"font-size: 16px; line-height: 1.5em;\">&nbsp;</span></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp; &nbsp; 1.迷你马拉松是</span><a href=\"https://www.baidu.com/s?wd=%E9%A9%AC%E6%8B%89%E6%9D%BE&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YdmW99uHDsPWRsmvcduWwW0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnWDkP1n1PjR1rjnLP10vPjR3Ps\" target=\"https://zhidao.baidu.com/question/_blank\" style=\"text-align: center; margin: 0px; padding: 0px; text-decoration: underline; font-family: 仿宋; color: rgb(0, 0, 0); font-size: 14px;\"><span style=\"font-size: 14px;\">马拉松</span></a><span style=\"font-family: 仿宋; font-size: 14px;\">赛事为了扩大赛事的参与度和降低参赛门槛，而设立的短距离的体验赛。在马拉松赛事当天，迷你马拉松参赛者将与全程和半程马拉松选手一起出发，途径较短路线到达终点。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次2017贵阳国际马拉松赛赛程的全长为3.5公里，赛事定位更偏重于体验感，对参赛年龄没有限制（未成年人需法定监护人陪同参赛），参赛者可根据自身的体能条件以合适的速度完成即可。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">此次迷你马拉松的线路为：以贵阳奥体中心广场为起点，途经云潭南路、石林东路、金阳南路、最终到达翠柳路与奥兴路交叉路口，即完成全部赛程。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">2.绿色通道报名方法</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（1）关注微信公众号“黔学帮”或“数动体育”，选择“贵马报名”子菜单，<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">在线填写报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">（2）关注微信公众号“黔学帮”或“数动体育”回复关键词“贵马”后将弹出报名页面，按提示填写<strong><span style=\"font-family: 仿宋; font-size: 16px; font-weight: normal;\">报名信息并在线支付报名费确认成功后，请耐心等待报名截止后分配参赛号码，分配到参赛号码后即报名成功。</span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px;\"><strong><span style=\"font-family: 仿宋;\">3.</span></strong><strong><span style=\"font-family: 仿宋;\">报名费用</span></strong><strong><span style=\"font-family: 仿宋;\"></span></strong></span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">在本绿色通道报名可享受九折优惠，即45元报名费。</span></p><p style=\"font-family: \"><span style=\"font-family: 仿宋; font-size: 14px;\">&nbsp;</span></p><p style=\"font-family: \"><span style=\"font-size: 14px; font-family: 仿宋;\">4.物资领取<br/>&nbsp;&nbsp;&nbsp;&nbsp;2017年7月12至14日，参赛运动员在贵阳奥体中心报到时，即可领取相关物品。</span></p><div><span style=\"font-family: 仿宋; font-size: 14px;\"><br/></span></div><p><br/></p>', 'admin', '1', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '0', '0', '0', '2017-07-11 11:00:56', '2017-07-11 10:57:19');

-- ----------------------------
-- Table structure for os_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `os_auth_group`;
CREATE TABLE `os_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL COMMENT '权限规则ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='权限组表';

-- ----------------------------
-- Records of os_auth_group
-- ----------------------------
INSERT INTO `os_auth_group` VALUES ('1', '超级管理组', '1', '1,2,3,73,74,5,6,7,8,9,10,11,12,39,40,41,42,43,14,13,20,21,22,23,24,15,25,26,27,28,29,30,16,17,44,45,46,47,48,18,49,50,51,52,53,19,31,32,33,34,35,36,37,54,55,58,59,60,61,62,56,63,64,65,66,67,57,68,69,70,71,72');
INSERT INTO `os_auth_group` VALUES ('2', '酒店用户组', '1', '75,82,83,84,85,86,87');
INSERT INTO `os_auth_group` VALUES ('3', '车辆用户组', '1', '76');
INSERT INTO `os_auth_group` VALUES ('4', '导游用户组', '1', '78,89,90,91,92,93,95');

-- ----------------------------
-- Table structure for os_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `os_auth_group_access`;
CREATE TABLE `os_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) COMMENT '(null)',
  KEY `uid` (`uid`) COMMENT '(null)',
  KEY `group_id` (`group_id`) COMMENT '(null)'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='权限组规则表';

-- ----------------------------
-- Records of os_auth_group_access
-- ----------------------------
INSERT INTO `os_auth_group_access` VALUES ('1', '1');
INSERT INTO `os_auth_group_access` VALUES ('2', '4');

-- ----------------------------
-- Table structure for os_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `os_auth_rule`;
CREATE TABLE `os_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) COMMENT '(null)'
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='规则表';

-- ----------------------------
-- Records of os_auth_rule
-- ----------------------------
INSERT INTO `os_auth_rule` VALUES ('1', 'admin/System/default', '系统配置', '1', '1', '0', 'fa fa-gears', '0', '');
INSERT INTO `os_auth_rule` VALUES ('2', 'admin/System/siteConfig', '站点配置', '1', '1', '1', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('3', 'admin/System/updateSiteConfig', '更新配置', '1', '0', '1', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('5', 'admin/Menu/default', '菜单管理', '1', '1', '0', 'fa fa-bars', '0', '');
INSERT INTO `os_auth_rule` VALUES ('6', 'admin/Menu/index', '后台菜单', '1', '1', '5', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('7', 'admin/Menu/add', '添加菜单', '1', '0', '6', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('8', 'admin/Menu/save', '保存菜单', '1', '0', '6', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('9', 'admin/Menu/edit', '编辑菜单', '1', '0', '6', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('10', 'admin/Menu/update', '更新菜单', '1', '0', '6', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('11', 'admin/Menu/delete', '删除菜单', '1', '0', '6', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('12', 'admin/Nav/index', '导航管理', '1', '1', '5', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('13', 'admin/Category/index', '栏目管理', '1', '1', '14', 'fa fa-sitemap', '0', '');
INSERT INTO `os_auth_rule` VALUES ('14', 'admin/Content/default', '内容管理', '1', '1', '0', 'fa fa-file-text', '0', '');
INSERT INTO `os_auth_rule` VALUES ('15', 'admin/Article/index', '文章管理', '1', '1', '14', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('16', 'admin/User/default', '用户管理', '1', '1', '0', 'fa fa-users', '0', '');
INSERT INTO `os_auth_rule` VALUES ('17', 'admin/User/index', '普通用户', '1', '1', '16', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('18', 'admin/AdminUser/index', '管理员', '1', '1', '16', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('19', 'admin/AuthGroup/index', '权限组', '1', '1', '16', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('20', 'admin/Category/add', '添加栏目', '1', '0', '13', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('21', 'admin/Category/save', '保存栏目', '1', '0', '13', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('22', 'admin/Category/edit', '编辑栏目', '1', '0', '13', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('23', 'admin/Category/update', '更新栏目', '1', '0', '13', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('24', 'admin/Category/delete', '删除栏目', '1', '0', '13', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('25', 'admin/Article/add', '添加文章', '1', '0', '15', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('26', 'admin/Article/save', '保存文章', '1', '0', '15', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('27', 'admin/Article/edit', '编辑文章', '1', '0', '15', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('28', 'admin/Article/update', '更新文章', '1', '0', '15', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('29', 'admin/Article/delete', '删除文章', '1', '0', '15', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('30', 'admin/Article/toggle', '文章审核', '1', '0', '15', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('31', 'admin/AuthGroup/add', '添加权限组', '1', '0', '19', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('32', 'admin/AuthGroup/save', '保存权限组', '1', '0', '19', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('33', 'admin/AuthGroup/edit', '编辑权限组', '1', '0', '19', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('34', 'admin/AuthGroup/update', '更新权限组', '1', '0', '19', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('35', 'admin/AuthGroup/delete', '删除权限组', '1', '0', '19', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('36', 'admin/AuthGroup/auth', '授权', '1', '0', '19', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('37', 'admin/AuthGroup/updateAuthGroupRule', '更新权限组规则', '1', '0', '19', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('39', 'admin/Nav/add', '添加导航', '1', '0', '12', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('40', 'admin/Nav/save', '保存导航', '1', '0', '12', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('41', 'admin/Nav/edit', '编辑导航', '1', '0', '12', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('42', 'admin/Nav/update', '更新导航', '1', '0', '12', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('43', 'admin/Nav/delete', '删除导航', '1', '0', '12', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('44', 'admin/User/add', '添加用户', '1', '0', '17', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('45', 'admin/User/save', '保存用户', '1', '0', '17', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('46', 'admin/User/edit', '编辑用户', '1', '0', '17', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('47', 'admin/User/update', '更新用户', '1', '0', '17', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('48', 'admin/User/delete', '删除用户', '1', '0', '17', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('49', 'admin/AdminUser/add', '添加管理员', '1', '0', '18', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('50', 'admin/AdminUser/save', '保存管理员', '1', '0', '18', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('51', 'admin/AdminUser/edit', '编辑管理员', '1', '0', '18', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('52', 'admin/AdminUser/update', '更新管理员', '1', '0', '18', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('53', 'admin/AdminUser/delete', '删除管理员', '1', '0', '18', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('54', 'admin/Slide/default', '扩展管理', '1', '1', '0', 'fa fa-wrench', '0', '');
INSERT INTO `os_auth_rule` VALUES ('55', 'admin/SlideCategory/index', '轮播分类', '1', '1', '54', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('56', 'admin/Slide/index', '轮播图管理', '1', '1', '54', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('57', 'admin/Link/index', '友情链接', '1', '1', '54', 'fa fa-link', '0', '');
INSERT INTO `os_auth_rule` VALUES ('58', 'admin/SlideCategory/add', '添加分类', '1', '0', '55', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('59', 'admin/SlideCategory/save', '保存分类', '1', '0', '55', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('60', 'admin/SlideCategory/edit', '编辑分类', '1', '0', '55', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('61', 'admin/SlideCategory/update', '更新分类', '1', '0', '55', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('62', 'admin/SlideCategory/delete', '删除分类', '1', '0', '55', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('63', 'admin/Slide/add', '添加轮播', '1', '0', '56', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('64', 'admin/Slide/save', '保存轮播', '1', '0', '56', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('65', 'admin/Slide/edit', '编辑轮播', '1', '0', '56', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('66', 'admin/Slide/update', '更新轮播', '1', '0', '56', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('67', 'admin/Slide/delete', '删除轮播', '1', '0', '56', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('68', 'admin/Link/add', '添加链接', '1', '0', '57', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('69', 'admin/Link/save', '保存链接', '1', '0', '57', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('70', 'admin/Link/edit', '编辑链接', '1', '0', '57', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('71', 'admin/Link/update', '更新链接', '1', '0', '57', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('72', 'admin/Link/delete', '删除链接', '1', '0', '57', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('73', 'admin/ChangePassword/index', '修改密码', '1', '1', '1', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('74', 'admin/ChangePassword/updatePassword', '更新密码', '1', '0', '1', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('75', 'admin/hotel/index1', '酒店管理', '1', '1', '0', 'fa fa-hotel', '0', '');
INSERT INTO `os_auth_rule` VALUES ('76', 'admin/car/default', '车辆管理', '1', '1', '0', 'fa fa-car', '0', '');
INSERT INTO `os_auth_rule` VALUES ('77', 'admin/routes/default', '线路管理', '1', '1', '0', 'fa fa-flag', '0', '');
INSERT INTO `os_auth_rule` VALUES ('78', 'admin/guidebook/default', '导游管理', '1', '1', '0', 'fa fa-bullseye', '0', '');
INSERT INTO `os_auth_rule` VALUES ('79', 'admin/gifts/index', '特价活动', '1', '1', '0', 'fa fa-gift', '0', '');
INSERT INTO `os_auth_rule` VALUES ('80', 'admin/cate/index', '分类管理', '1', '1', '0', 'fa fa-folder-open', '0', '');
INSERT INTO `os_auth_rule` VALUES ('81', 'admin/model/index', '模型管理', '1', '1', '0', 'fa fa-tasks', '0', '');
INSERT INTO `os_auth_rule` VALUES ('82', 'admin/hotel/add', '添加酒店', '1', '0', '75', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('83', 'admin/hotel/save', '保存酒店信息', '1', '0', '75', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('84', 'admin/hotel_rooms/index', '客房管理', '1', '1', '75', 'fa fa-room', '0', '');
INSERT INTO `os_auth_rule` VALUES ('85', 'admin/hotel/index', '酒店管理', '1', '1', '75', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('86', 'admin/hotel/edit', '修改酒店信息', '1', '0', '75', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('87', 'admin/hotel/update', '保存修改酒店信息', '1', '0', '75', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('88', 'admin/hotel_cate/index', '房型管理', '1', '1', '75', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('89', 'admin/guidebook/index', '导游管理', '1', '1', '78', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('90', 'admin/guidebook/add', '用户信息', '1', '0', '78', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('91', 'admin/guidebook/save', '保存用户信息', '1', '0', '78', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('92', 'admin/guidebook/edit', '修改用户信息', '1', '0', '78', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('93', 'admin/guidebook/update', '保存修改信息', '1', '0', '78', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('94', 'admin/guidebook/plan', '周期排表', '1', '0', '78', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('96', 'admin/car/index', '用户管理', '1', '1', '76', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('97', 'admin/bus/index', '车辆列表', '1', '1', '76', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('98', 'admin/routesUser/index', '用户管理', '1', '1', '77', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('99', 'admin/pages/default', '单页管理', '1', '1', '0', 'fa fa-folder-open', '0', '');
INSERT INTO `os_auth_rule` VALUES ('100', 'admin/pages/index', '所有单页', '1', '1', '99', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('101', 'admin/pages/add', '添加单页', '1', '1', '99', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('102', 'admin/techan/default', '特产管理', '1', '1', '0', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('103', 'admin/techan/index', '特产列表', '1', '1', '102', '', '0', '');
INSERT INTO `os_auth_rule` VALUES ('104', 'admin/techan/add', '发布特产', '1', '0', '103', '', '0', '');

-- ----------------------------
-- Table structure for os_bus
-- ----------------------------
DROP TABLE IF EXISTS `os_bus`;
CREATE TABLE `os_bus` (
  `bus_id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_name` varchar(255) DEFAULT NULL COMMENT '车辆名称',
  `bus_price` int(4) DEFAULT NULL COMMENT '租车费',
  `bus_dangwei` tinyint(1) NOT NULL COMMENT '档位，1：手动挡，2：自动挡',
  `bus_zuowei` int(2) NOT NULL COMMENT '座位数',
  `bus_address` varchar(255) NOT NULL COMMENT '取车地址',
  `bus_shuoming1` text NOT NULL COMMENT '费用和违章须知',
  `bus_shuoming2` text NOT NULL COMMENT '订单须知',
  `bus_shuoming3` text NOT NULL COMMENT '保险说明',
  `bus_shuoming4` text NOT NULL COMMENT '取/还车说明',
  `bus_shuoming5` text NOT NULL COMMENT '多退少补',
  `bus_thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_bus
-- ----------------------------
INSERT INTO `os_bus` VALUES ('2', '梅德赛斯奔驰', '1000', '2', '39', '贵阳市观山湖区中天会展城101大厦', '<p>  由于我处理的是ascii定长文件,不是分隔符文件，故采用列表操作实现数据分割。本来没在意，结果处理20w条\n数据，时间急剧上升到12s。本以为是byte.decode增加了时间。遂去除decode全程bytes处理。发觉仍旧效率堪忧。\n最后用最简单方式测试，首次运行，最简单方式也要7.5秒100w次。</p>', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;订单须知1&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;取还车说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                 &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '/public/uploads/20170713/29951e08bf6fd256f0c655f2dc46cc1d.jpg', '1497850714', '1499917633', '0', '1', null);
INSERT INTO `os_bus` VALUES ('3', '梅德赛斯奔驰', '2000', '2', '39', '贵阳市观山湖区中天会展城101大厦', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;租车须知&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;订单须知1&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;取还车说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                 &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '/public/uploads/20170713/29951e08bf6fd256f0c655f2dc46cc1d.jpg', '1497850714', '1499917633', '0', '1', null);
INSERT INTO `os_bus` VALUES ('4', '梅德赛斯奔驰', '3000', '2', '39', '贵阳市观山湖区中天会展城101大厦', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;租车须知&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;订单须知1&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;取还车说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                 &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '/public/uploads/20170713/29951e08bf6fd256f0c655f2dc46cc1d.jpg', '1497850714', '1499917633', '0', '1', null);
INSERT INTO `os_bus` VALUES ('5', '梅德赛斯奔驰', '4000', '2', '39', '贵阳市观山湖区中天会展城101大厦', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;租车须知&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;订单须知1&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;取还车说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                 &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '/public/uploads/20170713/29951e08bf6fd256f0c655f2dc46cc1d.jpg', '1497850714', '1499917633', '0', '1', null);
INSERT INTO `os_bus` VALUES ('6', '梅德赛斯奔驰', '5000', '2', '39', '贵阳市观山湖区中天会展城101大厦', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;租车须知&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;订单须知1&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                  &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;取还车说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '                                                                 &lt;p&gt;&lt;span style=&quot;text-align: right;&quot;&gt;保险说明&lt;/span&gt;&lt;/p&gt;                                                        ', '/public/uploads/20170713/29951e08bf6fd256f0c655f2dc46cc1d.jpg', '1497850714', '1499917633', '0', '1', null);
INSERT INTO `os_bus` VALUES ('7', '梅德赛斯奔驰', '6000', '2', '39', '贵阳市观山湖区中天会展城101大厦', '                                                                                                &lt;p&gt;&lt;span&gt;春天来临了，值此一年季节交替时节，也不可避免地出现了一些挑战。由于漫长的冬季，每个人或多或少得了幽闭症，但户外仍然过于潮湿而无法玩耍，孩子们可能正在上房揭瓦！您已经尝试遍了日常活动：在厨房制作饼干整得一塌糊涂，然后又进行清理；百无聊赖地翻着书；试图让孩子玩“洗衣游戏”（失败！），而现在您只需拨打一个电话即可解决这些烦恼。真的，只需一个电话，然后付款......让孩子们坐下，然后安静地什么都不做 10 分钟，这个要求高吗？&lt;/span&gt;&lt;/p&gt;                                                                                    ', '                                                                                                   &lt;p&gt;父母们都知道，在屏幕前的时间（包括电视）要适度，但是肯定存在一天或一周中的某个时刻，您只希望需要安静一会儿，玩玩智能设备，吸引孩子们的注意。&lt;/p&gt;&lt;p&gt;确保时间用得其所的一种方法是引入具有一定教育意义的游戏。游戏取得了如此巨大的飞跃，同时科学也取得了巨大的进步。正因为如此，最新的游戏已经融入了各种有关人类发展的研究，将娱乐和学习相结合。&lt;/p&gt;                                                                                    ', '                                                                                                   &lt;p&gt;「每天一款新玩意」是一个在小众软件微信公众号（appinncom）上的特别内容，介绍了青小蛙每天发现的新鲜玩意，但由于各种原因导致不能正常使用，比如地图偏移，比如无法访问，比如过于小众等等，但青小蛙还是觉得就这样放弃太可惜了。&lt;/p&gt;&lt;p&gt;于是就有了这个「每天一款新玩意」，这里介绍的内容不在乎受众，不在乎使用难度，不在乎是否有用，但只要有趣，够新鲜，就行。&lt;br&gt;近期我们会慢慢将之前发布的新玩意搬到网站里来，让新玩意不至于变成旧东西。&lt;/p&gt;                                                                                    ', '                                                                                                &lt;div id=&quot;stopbox&quot; class=&quot;topbox&quot;&gt;&lt;div class=&quot;blognav&quot;&gt;&lt;a href=&quot;http://www.appinn.com/&quot; title=&quot;小众软件&quot; rel=&quot;bookmark&quot;&gt;&lt;br class=&quot;Apple-interchange-newline&quot;&gt;首页&lt;/a&gt;&amp;nbsp;»&amp;nbsp;&lt;a href=&quot;http://www.appinn.com/category/mac/&quot; rel=&quot;category tag&quot;&gt;Mac OS X&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://www.appinn.com/category/windows/&quot; rel=&quot;category tag&quot;&gt;Windows&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://www.appinn.com/category/office/&quot; rel=&quot;category tag&quot;&gt;办公软件&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;http://www.appinn.com/category/online-tools/&quot; rel=&quot;category tag&quot;&gt;在线应用&lt;/a&gt;&amp;nbsp;»&lt;/div&gt;&lt;/div&gt;&lt;div id=&quot;container&quot;&gt;&lt;div id=&quot;content&quot;&gt;&lt;div id=&quot;post-23868&quot; class=&quot;spost post&quot;&gt;&lt;h2 class=&quot;entry-title&quot;&gt;Notion – 火爆的「你到底是什么」工具，病毒式营销又一案例&lt;/h2&gt;&lt;div class=&quot;wpfp-addlink&quot;&gt;&lt;span class=&quot;wpfp-span&quot;&gt;&lt;img src=&quot;http://img3.appinn.com/static/wp-content/plugins/wp-favorite-posts/img/heart.png&quot; alt=&quot;Favorite&quot; title=&quot;Favorite&quot; class=&quot;wpfp-img&quot;&gt;&lt;a class=&quot;wpfp-link&quot; href=&quot;http://www.appinn.com/notion/?wpfpaction=add&amp;amp;postid=23868&quot; title=&quot;收藏&quot; rel=&quot;nofollow&quot;&gt;收藏&lt;/a&gt;&lt;/span&gt;&lt;/div&gt;&lt;a class=&quot;comments-link&quot; href=&quot;http://www.appinn.com/notion/#comments&quot; title=&quot;post a comment&quot; style=&quot;text-align: center;&quot;&gt;128&lt;/a&gt;&lt;div class=&quot;ratings&quot;&gt;&lt;div id=&quot;post-ratings-23868&quot; class=&quot;post-ratings&quot; itemscope=&quot;&quot; itemtype=&quot;http://schema.org/Article&quot; data-nonce=&quot;6823872390&quot;&gt;&lt;img id=&quot;rating_23868_1&quot; src=&quot;http://img3.appinn.com/static/wp-content/plugins/wp-postratings/images/stars/rating_on.gif&quot; alt=&quot;1 Star&quot; title=&quot;1 Star&quot;&gt;&lt;img id=&quot;rating_23868_2&quot; src=&quot;http://img3.appinn.com/static/wp-content/plugins/wp-postratings/images/stars/rating_on.gif&quot; alt=&quot;2 Stars&quot; title=&quot;2 Stars&quot;&gt;&lt;img id=&quot;rating_23868_3&quot; src=&quot;http://img3.appinn.com/static/wp-content/plugins/wp-postratings/images/stars/rating_on.gif&quot; alt=&quot;3 Stars&quot; title=&quot;3 Stars&quot;&gt;&lt;img id=&quot;rating_23868_4&quot; src=&quot;http://img3.appinn.com/static/wp-content/plugins/wp-postratings/images/stars/rating_on.gif&quot; alt=&quot;4 Stars&quot; title=&quot;4 Stars&quot;&gt;&lt;img id=&quot;rating_23868_5&quot; src=&quot;http://img3.appinn.com/static/wp-content/plugins/wp-postratings/images/stars/rating_off.gif&quot; alt=&quot;5 Stars&quot; title=&quot;5 Stars&quot;&gt;&amp;nbsp;(&lt;strong&gt;1&lt;/strong&gt;&amp;nbsp;votes)&lt;/div&gt;&lt;/div&gt;&lt;div class=&quot;entry-meta&quot;&gt;&lt;strong&gt;&lt;a href=&quot;http://www.appinn.com/author/zxt/&quot; title=&quot;由青小蛙发布&quot; rel=&quot;author&quot;&gt;青小蛙&lt;/a&gt;&lt;/strong&gt;&amp;nbsp;on&amp;nbsp;&lt;cite&gt;2017.07.03&lt;/cite&gt;.&lt;/div&gt;&lt;div class=&quot;entry-content&quot; data-tag=&quot;1&quot;&gt;&lt;p&gt;&lt;a href=&quot;http://www.appinn.com/notion/&quot; rel=&quot;inlinks&quot;&gt;Notion&lt;/a&gt;&amp;nbsp;认为，对于&lt;strong&gt;程序员、产品经理、设计师&lt;/strong&gt;，每次都要打开的在线工具太多了，要不，我们来整合一款新的工具，Google Drive、Quip、Dropbox Paper、Confluence、GitHubWiki、Wordpress、Trello、Basecamp、Asana 这些服务，都用 Notion 来实现。@Appinn&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;size-medium aligncenter&quot; src=&quot;https://img3.appinn.com/images/201707/2017-07-03-12-31-43.jpg!o&quot; width=&quot;512&quot; height=&quot;445&quot; title=&quot;&quot; alt=&quot;&quot;&gt;&lt;/p&gt;&lt;p&gt;从界面看来，&lt;strong&gt;Notion&lt;/strong&gt;&amp;nbsp;是一款集大成的个人信息处理工具，主要用来处理大三类内容：文档、知识 和 任务，官方口号是&amp;nbsp;&lt;strong&gt;一个统一的笔记、知识、任务管理，并且能够多人协作的工作空间。&lt;/strong&gt;&lt;/p&gt;&lt;div style=&quot;text-align: center;&quot;&gt;&lt;/div&gt;&lt;p&gt;你可以当它是「云笔记」、「小型 Trello」、「个人任务管理」、「团队任务管理」、「阅读列表」、「信息收集」、「todolist」、「维基页面」，总之，想要你将所有的文字、图片、任务、链接都放进去整理的一款在线应用（拥有 Windows 与 macOS 客户端）。&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;                                                                                    ', '                                                                                                 &lt;p&gt;&lt;span&gt;进京证，是指在北京市六环路（不含）以内，以及六环外个别路段，非北京牌照的外埠机动车进入的临时通行证，有效期为7天。（到期前一天，到期当天及到期后一天）可以到当地交警支队办理延期5天。12天过后若仍需用进京证只能去进京的综合检查站重新办理7天的证件。在北京市各条高速公路即将进入市区处设有进京证办理点及检查站。&lt;/span&gt;&lt;/p&gt;                                                                                    ', '/public/uploads/20170713/29951e08bf6fd256f0c655f2dc46cc1d.jpg', '1497850714', '1499932240', '0', '1', null);

-- ----------------------------
-- Table structure for os_car
-- ----------------------------
DROP TABLE IF EXISTS `os_car`;
CREATE TABLE `os_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '机构名称',
  `create_time` int(11) NOT NULL COMMENT '提交时间',
  `user_id` tinyint(4) NOT NULL COMMENT '关联用户\n',
  `thumb` varchar(255) DEFAULT NULL COMMENT '头像\n',
  `zizhi` varchar(255) DEFAULT NULL COMMENT '资质证书',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，',
  `tel` varchar(12) DEFAULT NULL COMMENT '联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `update_time` int(11) DEFAULT NULL,
  `is_recommend` tinyint(4) DEFAULT NULL,
  `about` text,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_car
-- ----------------------------
INSERT INTO `os_car` VALUES ('1', 'XXX 租车行', '1497408755', '1', '/public/uploads/20170614/0a0464c53ee44650f886641f736d8380.jpg', '/public/uploads/20170614/1f1b05b05e59888d073f3a88b8f49f6d.jpg', '1', '15519076193', '贵阳市观山湖区中天会展城101大厦', '1497408755', '1', null, null);

-- ----------------------------
-- Table structure for os_cate
-- ----------------------------
DROP TABLE IF EXISTS `os_cate`;
CREATE TABLE `os_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `model_id` mediumint(8) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_cate
-- ----------------------------
INSERT INTO `os_cate` VALUES ('1', '经济型', '1', '1');
INSERT INTO `os_cate` VALUES ('3', '三星级', '1', '1');
INSERT INTO `os_cate` VALUES ('4', '四星级', '1', '1');
INSERT INTO `os_cate` VALUES ('5', '凯斯鲍尔', '2', '1');
INSERT INTO `os_cate` VALUES ('6', '五星级', '1', '1');

-- ----------------------------
-- Table structure for os_category
-- ----------------------------
DROP TABLE IF EXISTS `os_category`;
CREATE TABLE `os_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `alias` varchar(50) DEFAULT '' COMMENT '导航别名',
  `content` longtext COMMENT '分类内容',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `icon` varchar(20) DEFAULT '' COMMENT '分类图标',
  `list_template` varchar(50) DEFAULT '' COMMENT '分类列表模板',
  `detail_template` varchar(50) DEFAULT '' COMMENT '分类详情模板',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '分类类型  1  列表  2 单页',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `path` varchar(255) DEFAULT '' COMMENT '路径',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of os_category
-- ----------------------------
INSERT INTO `os_category` VALUES ('1', '公司新闻', '', '', '', '', '', '', '1', '0', '0', '0,', '2016-12-22 18:22:24');

-- ----------------------------
-- Table structure for os_city
-- ----------------------------
DROP TABLE IF EXISTS `os_city`;
CREATE TABLE `os_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `cid` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `code` int(11) NOT NULL COMMENT '城市编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_city
-- ----------------------------
INSERT INTO `os_city` VALUES ('1009', '贵阳', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1010', '遵义', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1011', '六盘水', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1012', '安顺', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1013', '毕节', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1014', '铜仁', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1015', '黔西南州', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1016', '黔东南州', '1', '1', '0');
INSERT INTO `os_city` VALUES ('1017', '黔南州', '1', '1', '0');

-- ----------------------------
-- Table structure for os_guide
-- ----------------------------
DROP TABLE IF EXISTS `os_guide`;
CREATE TABLE `os_guide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `tel` varchar(12) DEFAULT '' COMMENT '联系电话',
  `uid` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `id_photo_a` text COMMENT '身份证正面',
  `id_photo_b` text COMMENT '身份证反面',
  `zizhi` text NOT NULL COMMENT '资质证书',
  `about` text NOT NULL COMMENT '自我介绍',
  `shanchang` text NOT NULL COMMENT '优势擅长',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `introduction` varchar(255) DEFAULT NULL COMMENT '自我推荐',
  `case` text COMMENT '成功案例',
  `birthday` varchar(10) NOT NULL COMMENT '生日',
  `user_id` tinyint(4) DEFAULT NULL,
  `years` int(11) NOT NULL COMMENT '带团年龄',
  `is_recommend` tinyint(4) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `sexy` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_guide
-- ----------------------------
INSERT INTO `os_guide` VALUES ('1', '冉俊', '15519076193', '522228199001020304', '/public/uploads/20170607/5fd92c9a88fe796c6e13669b54012ec1.jpg', '/public/uploads/20170607/5fd92c9a88fe796c6e13669b54012ec1.jpg', '/public/uploads/20170607/5fd92c9a88fe796c6e13669b54012ec1.jpg', '<p>这里是个人介绍展示地方</p>', '放到', '/public/uploads/20170607/5fd92c9a88fe796c6e13669b54012ec1.jpg', '本人已从事导游工作20年，精心为本人已从事导游工作20年，精心为您设计贵州最好的旅游线路本人已从事导游工作20年，精心为您设计贵州最好的旅游线路您设计贵州最好的旅游线路，带给您最好的旅游体检带给您最好的旅游体检带给您最好的旅游体检本人已从事导游工作20年，精心为您设计贵州最好的旅游线路本人已从事导游工作20年，精心为您设计贵州最好的旅游线路本人已从事导游工作20年，精心为您设计贵州最好的旅游线路本人已从事导游工作20年，精心为您设计贵州最好的旅游线路', '放到', '1999-06-07', '2', '2', '0', '0', '0', '0', '0');
INSERT INTO `os_guide` VALUES ('2', '测试导游', '15519076193', '522228199001020304', '/public/uploads/20170608/77c9d6d2f760ccc74c89d49ea7644272.jpg', '/public/uploads/20170608/e22af5e4796a56bc9056ae8fa76f339c.jpg', '/public/uploads/20170608/d663aad90e4ef611a6d33b8d9c19d60a.jpg', '<p style=\"margin-top: 10px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; line-height: 30px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp;本人性格开朗、稳重、有活力，待人热情、真诚。工作认真负责，积极主动，能吃苦耐劳;喜欢思考，虚心与人交流,以取长补短。有较强的组织能力、实际动手能力和团体协作精神，能迅速的适应各种环境，并融合其中。在实习期间善于把检验结果与病人具体病情结合分析;社会责任感强,踏实肯干,主动争取锻炼机会。</p><p style=\"margin-top: 10px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; line-height: 30px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　我不断地完善自己，提高自身素质。我在学好专业课与公共课的基础上，还阅读了大量的课外书籍，不断地增加新知识，陶冶情操、开拓视野。不仅如此，我还积极参加<a href=\"http://www.liuxue86.com/shehuishijian/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(102, 102, 102);\">社会实践</a>活动，和各种文体活动，培养了我一定的组织与社交能力。本人热爱篮球、羽毛球、跑步、下棋、唱歌。</p><p style=\"margin-top: 10px; margin-bottom: 0px; padding: 0px; font-family: &quot;microsoft yahei&quot;; line-height: 30px; color: rgb(51, 51, 51); white-space: normal; background-color: rgb(255, 255, 255);\">　　我是一个认真工作，认真钻研，勇于创新的人。能熟练运用电脑，掌握一定的office办公软件，与老师与同学保持着紧密的关系，乐于帮助同学解决学习与生活上的麻烦，善于<a href=\"http://www.liuxue86.com/fanwen/zongjie/\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(102, 102, 102);\">总结</a>归纳，善于沟通，有良好的敬业作风和团队合作精神。已熟悉与掌握本专业的相关知识，在大学4年间学会刻苦耐劳，努力钻研，学以致用，这就是我们所追寻的宝藏。</p><p><br/></p>', '擅长英语交际，多年接待外宾经验', '/public/uploads/20170608/1fbd983104896137578d3810c1c9b282.jpg', '本人已从事导游工作20年，精心为您设计贵州最好的旅游线路', '这个懒得写', '1990-06-08', '1', '3', '0', '0', '1496892486', '1496892486', '0');

-- ----------------------------
-- Table structure for os_guide_comments
-- ----------------------------
DROP TABLE IF EXISTS `os_guide_comments`;
CREATE TABLE `os_guide_comments` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guide_id` int(11) NOT NULL COMMENT '关联导游',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `content` text NOT NULL COMMENT '评论内容',
  `photo` text COMMENT '图集',
  `user_id` int(11) NOT NULL COMMENT '评论用户',
  `score` int(1) DEFAULT NULL COMMENT '评分',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_guide_comments
-- ----------------------------

-- ----------------------------
-- Table structure for os_guide_plan
-- ----------------------------
DROP TABLE IF EXISTS `os_guide_plan`;
CREATE TABLE `os_guide_plan` (
  `guide_plan_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `guide_id` tinyint(4) NOT NULL COMMENT '导游 ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `date` varchar(10) NOT NULL DEFAULT '' COMMENT '日期',
  `update_time` int(11) DEFAULT NULL COMMENT '最后更新',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  PRIMARY KEY (`guide_plan_id`)
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of os_guide_plan
-- ----------------------------
INSERT INTO `os_guide_plan` VALUES ('95', '1', '1497329636', '2017-05-31', '1497329636', '1');
INSERT INTO `os_guide_plan` VALUES ('96', '1', '1497329648', '2017-06-01', '1497329648', '1');
INSERT INTO `os_guide_plan` VALUES ('97', '1', '1497329658', '2017-06-03', '1497329658', '2');
INSERT INTO `os_guide_plan` VALUES ('98', '1', '1497329925', '2017-06-22', '1497329925', '2');
INSERT INTO `os_guide_plan` VALUES ('99', '1', '1497329930', '2017-06-29', '1497329930', '1');
INSERT INTO `os_guide_plan` VALUES ('100', '1', '1497329931', '2017-06-21', '1497329931', '2');
INSERT INTO `os_guide_plan` VALUES ('101', '1', '1497329933', '2017-06-20', '1497329933', '1');
INSERT INTO `os_guide_plan` VALUES ('102', '1', '1497329934', '2017-06-15', '1497329934', '1');
INSERT INTO `os_guide_plan` VALUES ('103', '1', '1497329936', '2017-06-14', '1497329936', '2');
INSERT INTO `os_guide_plan` VALUES ('104', '1', '1497330003', '2017-06-10', '1497330003', '1');
INSERT INTO `os_guide_plan` VALUES ('105', '1', '1497330005', '2017-06-08', '1497330005', '2');
INSERT INTO `os_guide_plan` VALUES ('106', '1', '1497330006', '2017-06-07', '1497330006', '1');
INSERT INTO `os_guide_plan` VALUES ('107', '1', '1497330020', '2017-06-28', '1497330020', '2');
INSERT INTO `os_guide_plan` VALUES ('108', '1', '1497330030', '2017-05-29', '1497330030', '2');
INSERT INTO `os_guide_plan` VALUES ('109', '1', '1497334260', '2017-05-30', '1497334260', '2');
INSERT INTO `os_guide_plan` VALUES ('110', '1', '1497334569', '2017-07-06', '1497334569', '1');
INSERT INTO `os_guide_plan` VALUES ('111', '1', '1497334721', '2017-06-02', '1497334721', '1');
INSERT INTO `os_guide_plan` VALUES ('112', '1', '1497334724', '2017-07-07', '1497334724', '2');
INSERT INTO `os_guide_plan` VALUES ('113', '1', '1497334725', '2017-06-30', '1497334725', '1');
INSERT INTO `os_guide_plan` VALUES ('114', '1', '1497334726', '2017-06-23', '1497334726', '2');
INSERT INTO `os_guide_plan` VALUES ('115', '1', '1497334727', '2017-06-16', '1497334727', '2');
INSERT INTO `os_guide_plan` VALUES ('116', '1', '1497334727', '2017-06-09', '1497334727', '1');
INSERT INTO `os_guide_plan` VALUES ('117', '1', '1497334814', '2017-06-17', '1497334814', '1');
INSERT INTO `os_guide_plan` VALUES ('118', '1', '1497334815', '2017-06-24', '1497334815', '2');
INSERT INTO `os_guide_plan` VALUES ('119', '1', '1497334818', '2017-07-01', '1497334818', '2');
INSERT INTO `os_guide_plan` VALUES ('120', '1', '1497334820', '2017-07-08', '1497334820', '1');
INSERT INTO `os_guide_plan` VALUES ('121', '1', '1497334821', '2017-07-02', '1497334821', '1');
INSERT INTO `os_guide_plan` VALUES ('122', '1', '1497334822', '2017-06-25', '1497334822', '1');
INSERT INTO `os_guide_plan` VALUES ('123', '1', '1497334822', '2017-06-18', '1497334822', '2');
INSERT INTO `os_guide_plan` VALUES ('124', '1', '1497334823', '2017-06-11', '1497334823', '1');
INSERT INTO `os_guide_plan` VALUES ('125', '1', '1497335400', '2017-07-09', '1497335400', '1');
INSERT INTO `os_guide_plan` VALUES ('126', '1', '1497335418', '2017-07-19', '1497335418', '2');
INSERT INTO `os_guide_plan` VALUES ('127', '1', '1497335432', '2017-06-13', '1497335432', '1');
INSERT INTO `os_guide_plan` VALUES ('128', '1', '1497335857', '2017-07-04', '1497335857', '1');
INSERT INTO `os_guide_plan` VALUES ('129', '1', '1497336680', '2017-07-05', '1497336680', '2');

-- ----------------------------
-- Table structure for os_hotel
-- ----------------------------
DROP TABLE IF EXISTS `os_hotel`;
CREATE TABLE `os_hotel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT '' COMMENT '名称',
  `user_id` mediumint(8) DEFAULT NULL COMMENT '发布者',
  `cate_id` mediumint(4) DEFAULT NULL COMMENT '酒店类型',
  `city_id` varchar(50) DEFAULT NULL COMMENT '城市',
  `province_id` varchar(50) DEFAULT NULL COMMENT '省份',
  `area_id` varchar(50) DEFAULT NULL COMMENT '县市',
  `address` varchar(255) DEFAULT '' COMMENT '地址',
  `tel` varchar(12) DEFAULT '' COMMENT '电话',
  `price` float DEFAULT NULL COMMENT '均价',
  `is_wifi` tinyint(1) DEFAULT NULL COMMENT 'Wifi',
  `is_jicun` int(11) DEFAULT NULL COMMENT '寄存',
  `is_park` tinyint(1) DEFAULT NULL COMMENT '停车场',
  `is_tel` tinyint(1) DEFAULT NULL COMMENT '提供电话',
  `is_recommend` tinyint(1) DEFAULT '0' COMMENT '推荐',
  `is_jiaoxing` tinyint(1) DEFAULT NULL COMMENT '叫醒服务',
  `thumb` varchar(255) DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `info` varchar(255) DEFAULT '' COMMENT '酒店信息',
  `content` text COMMENT '酒店说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（-1，待审核，1正常，2下架）',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_hotel
-- ----------------------------
INSERT INTO `os_hotel` VALUES ('2', '测试酒店', '1', '4', '贵阳', '贵州', '南明区', '贵阳市观山湖区中天会展城101大厦', '15519076193', '158', '1', '1', '1', '1', '1', '1', '/public/uploads/images/20170630/1498806793554782.jpg', 'a:3:{i:0;s:52:\"/public/uploads/images/20170701/1498848386671522.jpg\";i:1;s:53:\"/public/uploads/images/20170701/1498848386571921.jpeg\";i:2;s:52:\"/public/uploads/images/20170701/1498848386255683.jpg\";}', '                                                                                                                                                                                                                                备注说明备注说明备注说明备注说明 备注说明备注说明', '<p style=\"text-align: center;\"><span style=\"color: rgb(51, 51, 51); font-family: Tahoma, Simsun, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">&nbsp; </span><img src=\"/public/uploads/images/20170701/1498848386255683.jpg\" width=\"665\" height=\"434\"/></p><p><span style=\"color: rgb(51, 51, 51); font-family: Tahoma, Simsun, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\"></span><br/></p><p><span style=\"color: rgb(51, 51, 51); font-family: Tahoma, Simsun, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">&nbsp; &nbsp; &nbsp; 上海宝安大酒店位居浦东新区陆家嘴金融中心的宝安大厦内，地处世纪大道与东方路交汇处，毗邻延安路、大连路、复兴路、人民路、新建路五条隧道，距离2、4、6、9号线世纪大道地铁站仅5分钟行程。周围有众多商务大厦和商业设施，地段繁华。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: Tahoma, Simsun, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">　　</span><br/><span style=\"color: rgb(51, 51, 51); font-family: Tahoma, Simsun, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">　　2012年12月31日，酒店正式归于UPSKY酒店管理集团名下，并作为UPSKY酒店管理集团中国总部所在地。酒店拥有228间客房，包括豪华商务房，高级标准房，特色套房和女士无烟楼层。同时，酒店拥有不同规格的会议室、商务中心、康乐娱乐设施和倡导生态美食的特色餐厅，优越的地理位置和现代化商务旅游住宿与办公环境，为您营造一个温馨、周到、便捷、个性的全新服务氛围。</span></p>', '1', null, '1498849236');
INSERT INTO `os_hotel` VALUES ('3', '黄金大酒店', '1', '3', '贵阳', '贵州', '南明区', '贵阳市观山湖区中天会展城101大厦', '15519076193', '100', '0', '0', '0', '0', '0', '0', '/public/uploads/images/20170630/1498806793554782.jpg', 'a:3:{i:0;s:52:\"/public/uploads/images/20170701/1498846853911068.jpg\";i:1;s:52:\"/public/uploads/images/20170701/1498846853751808.jpg\";i:2;s:52:\"/public/uploads/images/20170701/1498846853154547.jpg\";}', '                                                            ', '<p>发大水</p>', '1', null, '1498847685');
INSERT INTO `os_hotel` VALUES ('5', 'test', '1', '2', '贵阳', '贵州', '南明区', '贵阳市观山湖区中天会展城101大厦', '15519076193', '80', '0', '0', '0', '0', '0', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '                                                                qqq                                                        ', '&lt;p&gt;qqqq1&lt;/p&gt;', '1', '1495439255', '1495439931');
INSERT INTO `os_hotel` VALUES ('6', '锦江酒店', '2', '5', '贵阳', '贵州', '南明区', '贵阳市南明区花果园中央商务区', '111111', '120', '1', '1', '1', '1', '0', '0', '/public/uploads/images/20170630/1498806793554782.jpg', null, '                                                                                                测试酒店信息                                                                                    ', '<p>这里是酒店的详细介绍情况1</p>', '1', '1495450806', '1495527421');

-- ----------------------------
-- Table structure for os_hotel_cate
-- ----------------------------
DROP TABLE IF EXISTS `os_hotel_cate`;
CREATE TABLE `os_hotel_cate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_hotel_cate
-- ----------------------------
INSERT INTO `os_hotel_cate` VALUES ('1', '标准单人间', '1');
INSERT INTO `os_hotel_cate` VALUES ('2', '标准双人间', '1');
INSERT INTO `os_hotel_cate` VALUES ('3', '商务套房', '1');
INSERT INTO `os_hotel_cate` VALUES ('4', '商务豪华套房', '1');
INSERT INTO `os_hotel_cate` VALUES ('5', '行政套房', '1');
INSERT INTO `os_hotel_cate` VALUES ('6', '行政豪华套房', '1');
INSERT INTO `os_hotel_cate` VALUES ('7', '豪华标准房', '1');

-- ----------------------------
-- Table structure for os_hotel_comments
-- ----------------------------
DROP TABLE IF EXISTS `os_hotel_comments`;
CREATE TABLE `os_hotel_comments` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL COMMENT '关联酒店',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `content` text NOT NULL COMMENT '评论内容',
  `photo` text COMMENT '图集',
  `user_id` int(11) NOT NULL COMMENT '评论用户',
  `score` int(1) DEFAULT NULL COMMENT '评分',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_hotel_comments
-- ----------------------------
INSERT INTO `os_hotel_comments` VALUES ('1', '2', '1495616053', '1495616053', '很不错的酒店', 'a:3:{i:0;s:52:\"/public/uploads/images/20170701/1498848386671522.jpg\";i:1;s:53:\"/public/uploads/images/20170701/1498848386571921.jpeg\";i:2;s:52:\"/public/uploads/images/20170701/1498848386255683.jpg\";}', '1', '5', '1');
INSERT INTO `os_hotel_comments` VALUES ('2', '2', '1495616003', '1495616053', '环境为止都不错，交通方便，值得推荐。', null, '1', '2', '1');

-- ----------------------------
-- Table structure for os_hotel_rooms
-- ----------------------------
DROP TABLE IF EXISTS `os_hotel_rooms`;
CREATE TABLE `os_hotel_rooms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) DEFAULT NULL COMMENT '关联酒店',
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '名称',
  `num` int(11) DEFAULT '5' COMMENT '客房数量',
  `cate_id` mediumint(4) NOT NULL COMMENT '酒店类型',
  `price` float NOT NULL COMMENT '价格',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '酒店信息',
  `photo` text COMMENT '图集',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '室内面积',
  `addbed` varchar(255) DEFAULT '暂无信息' COMMENT '可加床',
  `bed_type` tinyint(1) NOT NULL COMMENT '床型',
  `breakfast` tinyint(1) NOT NULL COMMENT '早餐',
  `window` int(11) NOT NULL DEFAULT '1' COMMENT '窗户',
  `float` varchar(255) NOT NULL DEFAULT '' COMMENT '所在楼层',
  `persons` int(11) NOT NULL COMMENT '最多入驻人数',
  `blss` varchar(255) NOT NULL DEFAULT '' COMMENT '便利设施',
  `sphyp` varchar(255) NOT NULL DEFAULT '' COMMENT '食品/饮品',
  `mtkj` varchar(255) DEFAULT '0' COMMENT '媒体/科技',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL COMMENT '状态（-1，待审核，1正常，2下架）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_hotel_rooms
-- ----------------------------
INSERT INTO `os_hotel_rooms` VALUES ('3', '2', '2', '5', '1', '2', '/public/uploads/20170524/0bb4a5de57b17e7356fb877589546972.jpg', '', null, '2', '2', '2', '1', '1', '2', '2', '2', '2', '0', null, null, '1');
INSERT INTO `os_hotel_rooms` VALUES ('4', '2', '景观房', '5', '1', '1', '/public/uploads/20170524/6a03707cc91c03a3f9b4e9766f98a40b.png', '', 'a:3:{i:0;s:52:\"/public/uploads/images/20170524/1495613880868228.png\";i:1;s:52:\"/public/uploads/images/20170524/1495613880808328.png\";i:2;s:52:\"/public/uploads/images/20170524/1495613880798798.png\";}', '1', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, '1495616299', '1');
INSERT INTO `os_hotel_rooms` VALUES ('5', '2', '测试客房', '5', '1', '128', '/public/uploads/20170524/5c286c74d374c164eb7d6cce845fe837.jpg', '', null, '47', 'RMB 80/床/间/夜', '1', '1', '1', '18', '5', '客房WIFI覆盖', '客房可烧水', '液晶电视机', null, null, '1');
INSERT INTO `os_hotel_rooms` VALUES ('6', '2', '测试客房2', '5', '1', '1', '', '', null, '1', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1495616053', '1495616053', '1');

-- ----------------------------
-- Table structure for os_link
-- ----------------------------
DROP TABLE IF EXISTS `os_link`;
CREATE TABLE `os_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '链接名称',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `image` varchar(255) DEFAULT '' COMMENT '链接图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1 显示  2 隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='友情链接表';

-- ----------------------------
-- Records of os_link
-- ----------------------------

-- ----------------------------
-- Table structure for os_model
-- ----------------------------
DROP TABLE IF EXISTS `os_model`;
CREATE TABLE `os_model` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_model
-- ----------------------------
INSERT INTO `os_model` VALUES ('1', '酒店模型', '1', null);
INSERT INTO `os_model` VALUES ('2', '车辆模型', '1', null);
INSERT INTO `os_model` VALUES ('3', '线路模型', '1', null);
INSERT INTO `os_model` VALUES ('4', '导游模型', '1', null);

-- ----------------------------
-- Table structure for os_nav
-- ----------------------------
DROP TABLE IF EXISTS `os_nav`;
CREATE TABLE `os_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL COMMENT '父ID',
  `name` varchar(20) NOT NULL COMMENT '导航名称',
  `alias` varchar(20) DEFAULT '' COMMENT '导航别称',
  `link` varchar(255) DEFAULT '' COMMENT '导航链接',
  `icon` varchar(255) DEFAULT '' COMMENT '导航图标',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  0 隐藏  1 显示',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='导航表';

-- ----------------------------
-- Records of os_nav
-- ----------------------------
INSERT INTO `os_nav` VALUES ('1', '0', '首页', 'index', '/', '', '_self', '1', '0');
INSERT INTO `os_nav` VALUES ('2', '0', '酒店', 'hotel', 'hotel/index', '', '_self', '1', '0');
INSERT INTO `os_nav` VALUES ('3', '0', '导游', 'guide', 'guide/index', '', '_self', '1', '0');
INSERT INTO `os_nav` VALUES ('4', '0', '车辆', 'bus', 'bus/index', '', '_self', '1', '0');
INSERT INTO `os_nav` VALUES ('5', '0', '特产', 'techan', 'techan/index', '', '_self', '1', '0');
INSERT INTO `os_nav` VALUES ('6', '0', '线路', 'routes', 'routes/index', '', '_self', '1', '0');

-- ----------------------------
-- Table structure for os_order_bus
-- ----------------------------
DROP TABLE IF EXISTS `os_order_bus`;
CREATE TABLE `os_order_bus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of os_order_bus
-- ----------------------------

-- ----------------------------
-- Table structure for os_order_checkin
-- ----------------------------
DROP TABLE IF EXISTS `os_order_checkin`;
CREATE TABLE `os_order_checkin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `checkin_id` varchar(36) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `checkin_num` int(11) DEFAULT NULL,
  `checkin_start` varchar(11) DEFAULT NULL,
  `checkin_end` varchar(11) DEFAULT NULL,
  `checkin_days` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `checkin_info` text,
  `tel` varchar(12) DEFAULT '',
  `channel` varchar(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `status` tinyint(1) DEFAULT '0',
  `checkin_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_order_checkin
-- ----------------------------
INSERT INTO `os_order_checkin` VALUES ('38', 'HT20170707008828', '1', '2', '6', '2', '2017-07-07', '2017-07-19', '12', '1499417819', '1499417819', 'a:2:{i:0;s:6:\"马蓉\";i:1;s:6:\"宋喆\";}', '', 'alipay_wap', '24', '1499417891', '1', '');
INSERT INTO `os_order_checkin` VALUES ('39', 'DY20170708274801', '0', '5', '5', '1', '2017-07-08', '2017-07-09', '1', '1502980000', '1499446766', 'a:1:{i:0;s:3:\"ran\";}', '', null, '128', null, '0', '');
INSERT INTO `os_order_checkin` VALUES ('40', 'DY20170708504527', '0', '6', '5', '1', '2017-07-08', '2017-07-09', '1', '1502900000', '1499481350', 'a:1:{i:0;s:8:\"ranjun11\";}', '', null, '128', null, '0', '');
INSERT INTO `os_order_checkin` VALUES ('41', 'HT2017070845f503', '0', '3', '5', '1', '2017-07-08', '2017-07-19', '11', '1499483145', '1499483145', 'a:1:{i:0;s:9:\"王大锤\";}', '', 'alipay_wap', '1408', '1499483218', '1', '');
INSERT INTO `os_order_checkin` VALUES ('42', 'HT0712441fbc', '0', '2', '6', '2', '2017-07-12', '2017-07-21', '9', '1499843984', '1499843984', 'a:2:{i:0;s:6:\"冉俊\";i:1;s:7:\"冉俊1\";}', '', 'alipay_wap', '18', '1499843994', '1', '');
INSERT INTO `os_order_checkin` VALUES ('43', 'HT071451efe3', '0', '2', '5', '1', '2017-07-14', '2017-07-15', '1', '1499966391', '1499966391', 'a:1:{i:0;s:4:\"test\";}', '', 'alipay_wap', '128', '1499966410', '1', '');
INSERT INTO `os_order_checkin` VALUES ('44', 'HT0829368f66', '0', '2', '4', '1', '2017-08-29', '2017-08-30', '1', '1503987636', '1503987636', 'a:1:{i:0;s:6:\"申明\";}', '', null, '1', null, '0', '123123大事发生');
INSERT INTO `os_order_checkin` VALUES ('45', 'HT082919ee36', '0', '2', '4', '1', '2017-08-29', '2017-08-30', '1', '1503996379', '1503996379', 'a:1:{i:0;s:6:\"娃儿\";}', '', 'alipay_wap', '1', '1503996449', '1', '娃儿我v');

-- ----------------------------
-- Table structure for os_order_guide
-- ----------------------------
DROP TABLE IF EXISTS `os_order_guide`;
CREATE TABLE `os_order_guide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `server_id` varchar(36) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guide_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `checkin_num` int(11) DEFAULT NULL,
  `checkin_start` varchar(11) DEFAULT NULL,
  `checkin_end` varchar(11) DEFAULT NULL,
  `checkin_days` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `checkin_info` text,
  `tel` varchar(12) DEFAULT '',
  `channel` varchar(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `pay_time` int(11) DEFAULT NULL COMMENT '付款时间',
  `status` tinyint(1) DEFAULT '0',
  `checkin_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_order_guide
-- ----------------------------

-- ----------------------------
-- Table structure for os_pages
-- ----------------------------
DROP TABLE IF EXISTS `os_pages`;
CREATE TABLE `os_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '单页名称',
  `title` varchar(255) DEFAULT NULL COMMENT '单页标题',
  `content` text NOT NULL COMMENT '单页内容',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `disabled` int(1) DEFAULT '0' COMMENT '是否可删',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_pages
-- ----------------------------
INSERT INTO `os_pages` VALUES ('2', 'contactus', '联系我们', '<p><span>公司名称：星河经纬（北京）资讯有限责任公司</span><br><span>公司总机：010-61124611</span><br><span>传真:010-61124611-8002</span><br><span>客服电话：400-601-4000</span><br><span>联系地址：北京市海淀区人民大学南路大华天坛大厦六层</span><br><span>邮 编：100086&nbsp;</span><br><span>邮 箱：service@okcis.cn&nbsp;</span></p>', '1498013552', '1499766464', '0', '0');
INSERT INTO `os_pages` VALUES ('3', 'aboutus', '关于我们', '<p>值得自豪的是，我们是互联网上最原始的网站之一，我们有关于埃及历史和旅游资讯的16,000个网页，每年超过200多个国家的数以百万计的游客访问了我们的网页。我们所提供的历史性学术文章，以及当代问题，和我们一直在不断自我更新的服务，是为了不辜负我们数百万游客的期望。</p><p>值得自豪的是，我们是互联网上最原始的网站之一，我们有关于埃及历史和旅游资讯的16,000个网页，每年超过200多个国家的数以百万计的游客访问了我们的网页。我们所提供的历史性学术文章，以及当代问题，和我们一直在不断自我更新的服务，是为了不辜负我们数百万游客的期望。</p><p>值得自豪的是，我们是互联网上最原始的网站之一，我们有关于埃及历史和旅游资讯的16,000个网页，每年超过200多个国家的数以百万计的游客访问了我们的网页。我们所提供的历史性学术文章，以及当代问题，和我们一直在不断自我更新的服务，是为了不辜负我们数百万游客的期望。</p><p><img src=\"http://www.discoversimba.com/template/shizi/html/upfile/about/6546-3131-3131-3131.jpg\" alt=\"\"></p>', '1499765813', '1499765813', '0', '0');
INSERT INTO `os_pages` VALUES ('4', 'joinus', '加入我们', '<p><span>岗位职责 ：</span><br><span>1、广告协议的审核、录入工作：</span><br><span>2、 根据公司安排完善客户信息；</span><br><span>3、 及时反馈客户需求及投诉建议；</span><br><span>4、 按照公司规定做好用户业务的受理。</span><br><span>任职资格 ：</span><br><span>1、 大专及以上学历；</span><br><span>2、 熟练使用office办公软件，打字速度45字/分。</span><br><span>3、 具有较强的责任心，耐心，对工作热情，能承受一定压力，心理素质稳定。</span><br><span>4、 具备优秀的沟通技巧、表达技巧，普通话标准流利，热情乐观、有亲和力；</span><br><span>5、 富有开拓精神和良好的团队合作意识，有很强的学习和沟通能力，良好的协调能力。</span></p>', '1499766255', '1499766255', '0', '0');
INSERT INTO `os_pages` VALUES ('5', 'notices', '法律声明', '<p align=\"left\"><font color=\"#575757\"><span>&nbsp; 本网站由中国石油化工集团公司（以下简称“中国石化”）创设。任何人士使用本网站前，请仔细阅读下列条款：</span><span lang=\"EN-US\"></span></font></p><p align=\"center\" class=\"MsoNormal\"><span lang=\"EN-US\"><font color=\"#575757\"></font></span></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　　本网站的资料、信息及其他内容由中国石化提供，任何人进入本网站、阅读任何内容、从本网站下载任何材料或使用本网站提供的资料，即表示同意遵守这些条款。这些条款构成中国石化与您之间的协议。若不同意遵守这些条款，切勿使用本网站。中国石化保留未经通知随时更新下列条款的权利，这些更新将同样也约束您。</span><span></span></font></p><p align=\"center\" class=\"MsoNormal\"><span></span><font color=\"#575757\"><span></span><span lang=\"EN-US\"></span></font></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\"><span>&nbsp;&nbsp;&nbsp;</span></span><span><strong>权利声明</strong></span><span lang=\"EN-US\"></span></font></p><p align=\"center\" class=\"MsoNormal\"><span lang=\"EN-US\"><font color=\"#575757\"></font></span></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　　本网站的资料、信息、版面设计、图案、流程、声音、程序及其他内容的所有权、著作权及其他权利由中国石化所享有并予以保留，此种权利受到《中华人民共和国民法通则》、《中华人民共和国著作权法》、《中华人民共和国反不正当竞争法》及其他法律、法规、规范性法律文件及相关国际条约的保护，任何对上述权利的侵犯均有可能导致承担民事、行政或刑事责任。</span><span lang=\"EN-US\"></span></font></p><p align=\"center\" class=\"MsoNormal\"><span lang=\"EN-US\"><font color=\"#575757\"></font></span></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　　本网站中所包含的内容，尤其是关于可能的或预测的未来表现、成本、股利、收入、生产水平或效率、价格、储量、中国石化的发展、工业增长或其它趋势，以及涉及合并的协同效益或公司任何期待获得的收入的内容都是前瞻性的，从而有一定的风险和不确定性。由于各种因素，实际的结果和发展可能和上述说明所表达或暗示的有很大差异。</span><span lang=\"EN-US\">&nbsp;</span></font></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span lang=\"EN-US\"><span>&nbsp;&nbsp;&nbsp;<strong>&nbsp;</strong></span></span><span><strong>免责条款</strong></span><span lang=\"EN-US\"></span></font></p><p align=\"center\" class=\"MsoNormal\"><span lang=\"EN-US\"><font color=\"#575757\"></font></span></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　&nbsp;&nbsp;对本网站的内容，我们已尽最大努力的审核，但不提供任何形式的明示的或默示的关于内容的正确性、及时性、有效性、稳定性、可用性、不侵犯他人权利等方面的保证；不保证服务器的稳定性，不保证您任何时候均可浏览、阅读、复制、使用本网站；不保证网站内容所包含的文字、图形、材料、链接、说明、陈述或其它事项的准确性或完整性</span><span lang=\"EN-US\">,</span><span>也不保证本网站的内容不存在打印、复制及其他输入方面的错误。</span><span lang=\"EN-US\">\"</span><span>网站经营者</span><span lang=\"EN-US\">\"</span><span>可随时更改本网站内容，无须另作通知，但并不保证在内容变化时及时更新，也不保证在更新时通知您。</span><span lang=\"EN-US\"></span></font></p><p align=\"center\" class=\"MsoNormal\"><span lang=\"EN-US\"><font color=\"#575757\"></font></span></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　　在任何情况下，对于因使用本网站内容或无法进入本网站而导致的任何直接的、间接的、附带的、给第三人造成的损失</span><span lang=\"EN-US\">(</span><span>包括但不限于利润损失、信息数据丢失、财产毁坏等损失</span><span lang=\"EN-US\">)</span><span>，本网站均无须承担法律责任，不论是采用合同之诉、侵权之诉或其他诉讼理由。</span><span lang=\"EN-US\">&nbsp;</span></font></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　　通过本站点的链接是为用户提供方便，但链接的网站不在本站点的控制范围内，任何用户通过本站点的链接浏览其他网站被认为没有浏览本站点，因而对从链接的网站收到的网络传送或任何其他形式的传输不承担任何责任。</span><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\">&nbsp;</span></font></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span lang=\"EN-US\"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span><strong><span>保护用户隐私权</span><span lang=\"EN-US\"></span></strong></font></p><p align=\"left\" class=\"MsoNormal\"><span lang=\"EN-US\"><font color=\"#575757\"></font></span></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　　我们尊重广大用户的隐私，未经用户的同意，我们不搜集用户的资料。对于因服务的需要而掌握的用户的电子邮件、信息和地址我们承诺非经用户允许，不向任何第三方提供。</span><span lang=\"EN-US\"></span></font></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span><strong>终止条款</strong></span><span lang=\"EN-US\"></span></font></p><p align=\"left\" class=\"MsoNormal\"><span lang=\"EN-US\"><font color=\"#575757\"></font></span></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span>　　协议在有任意一方提出终止时即失效。无论是否在此协议所规定的条款下或其他情况下，只要你将所有的从本网站获得的软件、文件和一切相关材料销毁，即构成本协议的终止。</span><span lang=\"EN-US\"></span></font></p><p align=\"left\" class=\"MsoNormal\"><font color=\"#575757\"><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\"><span>&nbsp;&nbsp;&nbsp;&nbsp;</span></span><strong><span>其他</span><span lang=\"EN-US\">&nbsp;</span></strong></font><span><font color=\"#575757\">&nbsp;</font></span></p><p style=\"text-align: right;\"><font color=\"#575757\" style=\"text-align: start;\"></font></p><p align=\"left\" class=\"MsoNormal\"><span>　　由于本网站而引起的一切诉讼或争议均应适用中华人民共和国法律。如中华人民共和国法律的修改使上述任何条款成为非法，各方将同意由中国石化对上述条款做出修改。</span></p>', '1499766641', '1499766641', '0', '0');

-- ----------------------------
-- Table structure for os_routes
-- ----------------------------
DROP TABLE IF EXISTS `os_routes`;
CREATE TABLE `os_routes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_routes
-- ----------------------------

-- ----------------------------
-- Table structure for os_routes_user
-- ----------------------------
DROP TABLE IF EXISTS `os_routes_user`;
CREATE TABLE `os_routes_user` (
  `routes_user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(12) NOT NULL DEFAULT '' COMMENT '机构名称',
  `user_id` int(11) NOT NULL COMMENT '关联用户',
  `tel` varchar(12) NOT NULL DEFAULT '' COMMENT '联系电话',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT 'LOGO',
  `zizhi` varchar(255) DEFAULT '' COMMENT '资质证书',
  `about` text NOT NULL COMMENT '机构介绍',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系地址',
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否推荐',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`routes_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_routes_user
-- ----------------------------
INSERT INTO `os_routes_user` VALUES ('1', 'XX旅游公司', '1', '15519076193', '/public/uploads/20170620/bf34a3ff78cb8c4f998518c868d81e0a.jpg', '/public/uploads/20170620/0464e3411f3f9e2c0b7ad9db43b2af63.jpg', '&lt;p&gt;content&lt;/p&gt;', '贵阳市观山湖区中天会展城101大厦', '0', '1497944603', '1497944603', '0');

-- ----------------------------
-- Table structure for os_slide
-- ----------------------------
DROP TABLE IF EXISTS `os_slide`;
CREATE TABLE `os_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(50) NOT NULL COMMENT '轮播图名称',
  `description` varchar(255) DEFAULT '' COMMENT '说明',
  `link` varchar(255) DEFAULT '' COMMENT '链接',
  `target` varchar(10) DEFAULT '' COMMENT '打开方式',
  `image` varchar(255) DEFAULT '' COMMENT '轮播图片',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态  1 显示  0  隐藏',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图表';

-- ----------------------------
-- Records of os_slide
-- ----------------------------
INSERT INTO `os_slide` VALUES ('1', '1', 'index', '', '', '_self', '/public/uploads/20170622/4d82a54df8af4a5b0155a4b83c35fac3.jpg', '1', '0');
INSERT INTO `os_slide` VALUES ('2', '1', 'index2', '', '', '_self', '/public/uploads/20170622/3e0c777e4258bec412319d24858eda2c.jpg', '1', '0');
INSERT INTO `os_slide` VALUES ('3', '2', '冰纷夏日', '', 'http://www.juzhonghui.cn', '_self', '/public/uploads/20170630/787a3751f2912d0d301dcf95170eeb18.jpg', '1', '0');

-- ----------------------------
-- Table structure for os_slide_category
-- ----------------------------
DROP TABLE IF EXISTS `os_slide_category`;
CREATE TABLE `os_slide_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '轮播图分类',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图分类表';

-- ----------------------------
-- Records of os_slide_category
-- ----------------------------
INSERT INTO `os_slide_category` VALUES ('1', '首页轮播');
INSERT INTO `os_slide_category` VALUES ('2', '首页顶部广告');

-- ----------------------------
-- Table structure for os_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `os_sms_log`;
CREATE TABLE `os_sms_log` (
  `sms_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL DEFAULT '' COMMENT '验证码',
  `type` int(1) NOT NULL COMMENT '验证码类型',
  `create_time` int(11) NOT NULL,
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '接收手机',
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of os_sms_log
-- ----------------------------
INSERT INTO `os_sms_log` VALUES ('1', '9984', '1', '1499528608', '');
INSERT INTO `os_sms_log` VALUES ('2', '8979', '1', '1499528700', '');
INSERT INTO `os_sms_log` VALUES ('3', '4282', '1', '1499531843', '15519076193');
INSERT INTO `os_sms_log` VALUES ('4', '5073', '1', '1499531970', '15519076193');
INSERT INTO `os_sms_log` VALUES ('5', '7798', '1', '1499532158', '15519076193');
INSERT INTO `os_sms_log` VALUES ('6', '7904', '1', '1499653188', '15885888482');
INSERT INTO `os_sms_log` VALUES ('7', '1575', '1', '1499653438', '15885888482');
INSERT INTO `os_sms_log` VALUES ('8', '3921', '1', '1499653482', '18585888482');
INSERT INTO `os_sms_log` VALUES ('9', '2008', '1', '1499654660', '18585888482');
INSERT INTO `os_sms_log` VALUES ('10', '7586', '1', '1499654741', '15519076193');
INSERT INTO `os_sms_log` VALUES ('11', '4543', '1', '1499654839', '15519076193');
INSERT INTO `os_sms_log` VALUES ('12', '4120', '1', '1499761853', '15519076193');
INSERT INTO `os_sms_log` VALUES ('13', '6890', '1', '1499848140', '15519076193');
INSERT INTO `os_sms_log` VALUES ('14', '6265', '1', '1499848192', '15519076193');
INSERT INTO `os_sms_log` VALUES ('15', '1322', '1', '1502084902', '15519076193');
INSERT INTO `os_sms_log` VALUES ('16', '7618', '1', '1502176947', '15519076193');
INSERT INTO `os_sms_log` VALUES ('17', '5862', '1', '1503907731', '18585622625');
INSERT INTO `os_sms_log` VALUES ('18', '4920', '1', '1503993486', '44');
INSERT INTO `os_sms_log` VALUES ('19', '7600', '1', '1503993513', '');

-- ----------------------------
-- Table structure for os_system
-- ----------------------------
DROP TABLE IF EXISTS `os_system`;
CREATE TABLE `os_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '配置项名称',
  `value` text NOT NULL COMMENT '配置项值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of os_system
-- ----------------------------
INSERT INTO `os_system` VALUES ('1', 'site_config', 'a:7:{s:10:\"site_title\";s:18:\"贵州驴友天下\";s:9:\"seo_title\";s:0:\"\";s:11:\"seo_keyword\";s:0:\"\";s:15:\"seo_description\";s:0:\"\";s:14:\"site_copyright\";s:0:\"\";s:8:\"site_icp\";s:0:\"\";s:11:\"site_tongji\";s:0:\"\";}');

-- ----------------------------
-- Table structure for os_techan
-- ----------------------------
DROP TABLE IF EXISTS `os_techan`;
CREATE TABLE `os_techan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '发布者',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '标题',
  `about` int(11) NOT NULL COMMENT '介绍',
  `saled` int(11) DEFAULT '0' COMMENT '销量',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `photo` text COMMENT '图集',
  `unit` decimal(10,2) NOT NULL COMMENT '单价',
  `price1` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '经销商提成',
  `price2` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '导游提成',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `chandi` tinyint(4) DEFAULT NULL COMMENT '产地',
  `is_recommend` int(11) DEFAULT '0',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of os_techan
-- ----------------------------

-- ----------------------------
-- Table structure for os_user
-- ----------------------------
DROP TABLE IF EXISTS `os_user`;
CREATE TABLE `os_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '用户名',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `thumb` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  `gender` varchar(10) DEFAULT NULL COMMENT '性别',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '用户状态  1 正常  2 禁止',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) COMMENT '(null)',
  UNIQUE KEY `mobile` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of os_user
-- ----------------------------
INSERT INTO `os_user` VALUES ('6', 'torans', 'd7c66035c84e45d14e1d5463dd350469', '15519076192', '', null, '2017-07-10 10:47:28', '2017-07-10 10:47:52', '61.243.43.151', '男', '1');
INSERT INTO `os_user` VALUES ('4', '王富富', 'CWi29f&gt;rLa96bT3e', '18585888482', '', null, '2017-07-10 10:44:33', null, '', '男', '1');
