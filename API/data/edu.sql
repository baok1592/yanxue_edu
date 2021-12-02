# Host: localhost  (Version: 5.5.5-10.1.38-MariaDB)
# Date: 2021-10-29 10:58:52
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "rh_admin"
#

DROP TABLE IF EXISTS `rh_admin`;
CREATE TABLE `rh_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  `login_time` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(255) DEFAULT NULL,
  `uniacid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '教师id',
  `ucid` int(11) DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

#
# Structure for table "rh_article"
#

DROP TABLE IF EXISTS `rh_article`;
CREATE TABLE `rh_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '文章标题',
  `short_title` varchar(255) DEFAULT NULL COMMENT '文章短标题',
  `summary` varchar(255) DEFAULT NULL COMMENT '文章摘要',
  `image` int(11) NOT NULL DEFAULT '0' COMMENT '文章标题图片',
  `reading_volume` int(11) NOT NULL DEFAULT '0' COMMENT '文章阅读量',
  `content` text COMMENT '正文内容',
  `is_hidden` int(11) NOT NULL DEFAULT '0' COMMENT '隐藏',
  `is_tui` int(11) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

#
# Structure for table "rh_auth_group"
#

DROP TABLE IF EXISTS `rh_auth_group`;
CREATE TABLE `rh_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(255) NOT NULL DEFAULT '''\\''\\''''',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(1000) NOT NULL DEFAULT '',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;
INSERT INTO `rh_auth_group` (`id`, `title`, `status`, `rules`, `ucid`) VALUES ('1', '超级管理员', '1', '102,96,103,2,3,28,99,104,5,38,39,40,41,105,35,36,37,106,14,22,26,48,107,23,24,49,50,51,108,13,100,109,58,59,60,110,25,27,31,101,111,19,68,69,72,112,20,21,61,62,63,64,65,113,29,114,30,32,33,34', '0');


#
# Structure for table "rh_auth_group_access"
#

DROP TABLE IF EXISTS `rh_auth_group_access`;
CREATE TABLE `rh_auth_group_access` (
  `aid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  `ucid` int(11) DEFAULT NULL,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `uid` (`aid`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

INSERT INTO `rh_auth_group_access` (`aid`, `group_id`, `ucid`) VALUES
(1, 1, NULL);

#
# Structure for table "rh_auth_rule"
#

DROP TABLE IF EXISTS `rh_auth_rule`;
CREATE TABLE `rh_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) DEFAULT NULL,
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `pid` int(1) NOT NULL DEFAULT '0',
  `condition` char(100) NOT NULL DEFAULT '',
  `brief` varchar(80) NOT NULL DEFAULT '',
  `ucid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `rh_auth_rule`
--

INSERT INTO `rh_auth_rule` (`id`, `name`, `title`, `type`, `status`, `pid`, `condition`, `brief`, `ucid`) VALUES
(2, '/user/cms_get_teacher', '获取教师', 1, 1, 103, '', '', NULL),
(3, '/user/get_user', '获取所有用户', 1, 1, 103, '', '', NULL),
(5, '/article/get_delete_article', '获取回收站文章', 1, 1, 104, '', '', NULL),
(13, '/course/cms_get_course', '获取课程', 1, 1, 108, '', '', NULL),
(14, '/class/cms_get_class', '获取班级', 1, 1, 106, '', '', NULL),
(19, '/cms/get_config', '配置获取', 1, 1, 111, '', '', NULL),
(20, '/admins/createAdmin', '添加', 1, 1, 112, '', '', NULL),
(21, '/group/admin/createGroup', '添加分组', 1, 1, 112, '', '', NULL),
(22, '/class/edit_classes', '编辑班级', 1, 1, 106, '', '', NULL),
(23, '/course/edit_course', '编辑课程', 1, 1, 107, '', '', NULL),
(24, '/course/add_course', '添加课程', 1, 1, 107, '', '', NULL),
(25, '/student/change_class', '学生换班', 1, 1, 110, '', '', NULL),
(26, '/class/add_class', '添加班级', 1, 1, 106, '', '', NULL),
(27, '/student/add_student', '添加学生', 1, 1, 110, '', '', NULL),
(28, '/user/user_to_teacher', '添加教师', 1, 1, 103, '', '', NULL),
(29, '/plan/add_plan', '添加计划', 1, 1, 113, '', '', NULL),
(30, '/video/upload_video', '上传视频', 1, 1, 114, '', '', NULL),
(31, '/msg/get_change_msg', '获取换班日志', 1, 1, 110, '', '', NULL),
(32, '/image/upload_img', '图片上传', 1, 1, 114, '', '', NULL),
(33, '/image/delete_img', '删除图片', 1, 1, 114, '', '', NULL),
(34, '/video/delete_video', '删除视频', 1, 1, 114, '', '', NULL),
(35, '/banner/add_banner', '添加广告', 1, 1, 105, '', '', NULL),
(36, '/banner/edit_banner', '编辑广告', 1, 1, 105, '', '', NULL),
(37, '/banner/del_banner', '删除广告', 1, 1, 105, '', '', NULL),
(38, '/article/add_article', '添加文章', 1, 1, 104, '', '', NULL),
(39, '/article/edit_article', '编辑文章', 1, 1, 104, '', '', NULL),
(40, '/article/del_article', '删除文章', 1, 1, 104, '', '', NULL),
(41, '/article/recieve_article', '文章批量恢复', 1, 1, 104, '', '', NULL),
(48, '/class/del_classes', '删除班级', 1, 1, 106, '', '', NULL),
(49, '/project/add_project', '添加课程分类', 1, 1, 107, '', '', NULL),
(50, '/project/edit_project', '编辑课程分类', 1, 1, 107, '', '', NULL),
(51, '/project/del_project', '删除课程分类', 1, 1, 107, '', '', NULL),
(58, '/label/add_label', '添加标签', 1, 1, 109, '', '', NULL),
(59, '/label/update_label', '编辑标签', 1, 1, 109, '', '', NULL),
(60, '/label/delete_label', '删除标签', 1, 1, 109, '', '', NULL),
(61, '/admins/deleteAdmin', '删除管理员', 1, 1, 112, '', '', NULL),
(62, '/admins/update_admin', '编辑管理员', 1, 1, 112, '', '', NULL),
(63, '/group/admin/updateGroup', '编辑分组', 1, 1, 112, '', '', NULL),
(64, '/group/admin/deleteGroup', '删除分组', 1, 1, 112, '', '', NULL),
(65, '/group/admin/getGroupAll', '获取分组', 1, 1, 112, '', '', NULL),
(68, '/cms/update_sys', '更新配置', 1, 1, 111, '', '', NULL),
(69, '/gy/update_ys', '更新关于', 1, 1, 111, '', '', NULL),
(72, '/gy/update_Fw', '编辑服务', 1, 1, 111, '', '', NULL),
(99, '/user/del_teacher', '删除老师', 1, 1, 103, '', '', NULL),
(100, '/course/del_course', '删除课程', 1, 1, 108, '', '', NULL),
(101, '/student/del_student', '删除学生', 1, 1, 110, '', '', NULL),
(102, NULL, '首页', 1, 1, 0, '', 'home', NULL),
(103, NULL, '教师管理', 1, 1, 0, '', 'teacher', NULL),
(104, NULL, '文章管理', 1, 1, 0, '', 'article', NULL),
(105, NULL, '内容管理', 1, 1, 0, '', 'banner', NULL),
(106, NULL, '班级管理', 1, 1, 0, '', 'class_manage', NULL),
(107, NULL, '课程分类', 1, 1, 0, '', 'project', NULL),
(108, NULL, '课程管理', 1, 1, 0, '', 'course', NULL),
(109, NULL, '学生标签', 1, 1, 0, '', 'label', NULL),
(110, NULL, '学生管理', 1, 1, 0, '', 'student', NULL),
(111, NULL, '设置', 1, 1, 0, '', 'set', NULL),
(112, NULL, '管理员', 1, 1, 0, '', 'manage', NULL),
(113, NULL, '学习计划', 1, 1, 0, '', 'plan', NULL),
(114, NULL, '资源管理', 1, 1, 0, '', 'resources', NULL);

-- --------------------------------------------------------

#
# Structure for table "rh_banner"
#

DROP TABLE IF EXISTS `rh_banner`;
CREATE TABLE `rh_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0普通轮播图1跳转到文章、2跳转到优秀教师、3跳转到课程',
  `jump_id` int(11) NOT NULL DEFAULT '0' COMMENT '跳转id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='轮播图';

#
# Structure for table "rh_bind_teacher"
#

DROP TABLE IF EXISTS `rh_bind_teacher`;
CREATE TABLE `rh_bind_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) DEFAULT NULL COMMENT '电话号码',
  `uid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师绑定号码表';

#
# Structure for table "rh_card_number"
#

DROP TABLE IF EXISTS `rh_card_number`;
CREATE TABLE `rh_card_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(255) DEFAULT NULL COMMENT '卡密',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '使用状态0待使用1已使用',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `ucid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='卡密表';

#
# Structure for table "rh_category"
#

DROP TABLE IF EXISTS `rh_category`;
CREATE TABLE `rh_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目标题',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '栏目描述',
  `type` varchar(20) NOT NULL COMMENT '类型list列表cover封面',
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否显示  1 显示 0 不显示',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  `template` varchar(255) NOT NULL COMMENT '模板',
  `seotitle` varchar(80) NOT NULL COMMENT 'seo标题',
  `keyword` varchar(80) NOT NULL COMMENT '关键字',
  `is_jump` int(11) NOT NULL COMMENT '是否跳转',
  `jumpaddress` varchar(255) NOT NULL COMMENT '跳转地址',
  `json` text,
  `content` text NOT NULL COMMENT '封面内容',
  `is_phone_index` int(11) NOT NULL COMMENT '是否手机端首页显示0否1是',
  `is_pc_index` int(11) NOT NULL DEFAULT '0' COMMENT '是否pc首页显示0否1是',
  `delete_time` int(11) DEFAULT NULL,
  `value` int(11) NOT NULL DEFAULT '0',
  `is_tui_index` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品分类表';


INSERT INTO `rh_category` (`category_id`, `uniacid`, `category_name`, `short_name`, `type`, `pid`, `level`, `is_visible`, `sort`, `category_pic`, `template`, `seotitle`, `keyword`, `is_jump`, `jumpaddress`, `json`, `content`, `is_phone_index`, `is_pc_index`, `delete_time`, `value`, `is_tui_index`, `ucid`) VALUES
(2, 0, '新闻', '', 'new', 0, 1, 1, 2, 'http://192.168.124.16:8092/uploads/img/20210430/4432d34d5fe166bb0d6d913aa0f3549a.jpg', '', '', '', 0, '', '[]', '', 0, 0, NULL, 0, 0, '3'),
(5, 0, '课程', '', 'course', 0, 1, 1, 0, 'http://192.168.124.16:8092/uploads/img/20210710/f08cb5aad520cae5005596d00ae124d6.png', '', '', '', 0, '', '[]', '', 0, 0, NULL, 0, 0, '3'),
(6, 0, '教师', '', 'teacher', 0, 1, 1, 0, 'http://192.168.124.16:8092/uploads/img/20210430/631a48c82733801f120373be436ad531.jpg', '', '', '', 0, '', '\"\"', '', 0, 0, NULL, 0, 0, '3');


#
# Structure for table "rh_class_project"
#

DROP TABLE IF EXISTS `rh_class_project`;
CREATE TABLE `rh_class_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级科目表';

#
# Structure for table "rh_class_stu"
#

DROP TABLE IF EXISTS `rh_class_stu`;
CREATE TABLE `rh_class_stu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COMMENT='班级学生表';

#
# Structure for table "rh_class_teacher"
#

DROP TABLE IF EXISTS `rh_class_teacher`;
CREATE TABLE `rh_class_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '教师id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='教师班级绑定表';

#
# Structure for table "rh_classes"
#

DROP TABLE IF EXISTS `rh_classes`;
CREATE TABLE `rh_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '班级名称',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `course` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `plan_date` text COMMENT '开课日期',
  `classroom` varchar(255) DEFAULT NULL COMMENT '教室',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '10',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='班级表';

#
# Structure for table "rh_course"
#

DROP TABLE IF EXISTS `rh_course`;
CREATE TABLE `rh_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '课程名称',
  `image` int(11) NOT NULL DEFAULT '0' COMMENT '课程封面图片',
  `play` int(11) NOT NULL DEFAULT '0' COMMENT '播放量',
  `content` text COMMENT '详细介绍',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价格',
  `teacher` int(11) NOT NULL DEFAULT '0' COMMENT '授课老师',
  `is_down` int(11) NOT NULL DEFAULT '0' COMMENT '是否下架',
  `is_tui` int(11) NOT NULL DEFAULT '0' COMMENT '推荐',
  `project` int(11) NOT NULL DEFAULT '0' COMMENT '课程分类',
  `yj` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分享佣金',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `url` int(11) NOT NULL DEFAULT '0' COMMENT '视频连接',
  `buy` int(11) NOT NULL DEFAULT '0' COMMENT '购买开启',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `url_name` varchar(255) DEFAULT NULL,
  `total_num` int(11) NOT NULL DEFAULT '100' COMMENT '总人数',
  `now_num` int(11) NOT NULL DEFAULT '0' COMMENT '50',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='视频课程表';

#
# Structure for table "rh_course_teacher"
#

DROP TABLE IF EXISTS `rh_course_teacher`;
CREATE TABLE `rh_course_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='教师课程关联表';

#
# Structure for table "rh_experience"
#

DROP TABLE IF EXISTS `rh_experience`;
CREATE TABLE `rh_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `certificate` text COMMENT '教师资质',
  `experience` text COMMENT '教师经验',
  `content` text COMMENT '教师特点',
  `json` text COMMENT '其它备用字段',
  `uid` int(11) NOT NULL DEFAULT '0',
  `infor` text COMMENT '教师简介',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(20) DEFAULT '0' COMMENT '电话号码',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师资质表';

#
# Structure for table "rh_fx"
#

DROP TABLE IF EXISTS `rh_fx`;
CREATE TABLE `rh_fx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话',
  `infor` text COMMENT '简介',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '老师',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `child` varchar(20) DEFAULT NULL COMMENT '孩子',
  `sex` int(11) NOT NULL DEFAULT '0',
  `age` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='分销表';

#
# Structure for table "rh_image"
#

DROP TABLE IF EXISTS `rh_image`;
CREATE TABLE `rh_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `use_name` varchar(80) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '图片分类',
  `is_visible` int(11) NOT NULL DEFAULT '1' COMMENT '是否能显示1能0不能',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='图片总表';

#
# Structure for table "rh_image_category"
#

DROP TABLE IF EXISTS `rh_image_category`;
CREATE TABLE `rh_image_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `is_visible` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='图片分类表';

#
# Structure for table "rh_kids"
#

DROP TABLE IF EXISTS `rh_kids`;
CREATE TABLE `rh_kids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '年龄',
  `person` int(11) NOT NULL DEFAULT '0' COMMENT '家长',
  `uid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生表';

#
# Structure for table "rh_message"
#

DROP TABLE IF EXISTS `rh_message`;
CREATE TABLE `rh_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `content` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0请假1反馈2报名',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `read` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='留言表';

#
# Structure for table "rh_msg"
#

DROP TABLE IF EXISTS `rh_msg`;
CREATE TABLE `rh_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0分销记录1价格修改记录3换班',
  `content` text COMMENT '修改内容',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `read` int(11) NOT NULL DEFAULT '0' COMMENT '阅读',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='日志';

#
# Structure for table "rh_order"
#

DROP TABLE IF EXISTS `rh_order`;
CREATE TABLE `rh_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最终价格',
  `pay_statement` int(11) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `prepay_id` varchar(255) DEFAULT NULL,
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `fx_teacher` int(11) NOT NULL DEFAULT '0' COMMENT '分享教师',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `payment_type` varchar(255) NOT NULL DEFAULT 'xcx' COMMENT '支付方式',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0普通下单1拼团',
  `item_id` int(11) NOT NULL DEFAULT '0' COMMENT '拼团id',
  `user_ip` varchar(255) DEFAULT NULL,
  `pt_state` int(11) NOT NULL DEFAULT '0',
  `is_captain` int(11) NOT NULL DEFAULT '0' COMMENT '是否团长',
  `card_id` int(11) NOT NULL DEFAULT '0' COMMENT '卡密',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0正常1退款中2已退款3已驳回',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

#
# Structure for table "rh_pingce"
#

DROP TABLE IF EXISTS `rh_pingce`;
CREATE TABLE `rh_pingce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '学生id',
  `class_id` int(11) NOT NULL DEFAULT '0',
  `index` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `cyxx` int(11) NOT NULL DEFAULT '0' COMMENT '创意想象',
  `hmbx` int(11) NOT NULL DEFAULT '0' COMMENT '画面表现',
  `scgz` int(11) NOT NULL DEFAULT '0' COMMENT '色彩感知',
  `qgbd` int(11) NOT NULL DEFAULT '0' COMMENT '情感表达',
  `hhjq` int(11) NOT NULL DEFAULT '0' COMMENT '绘画技巧',
  `zzl` int(11) NOT NULL DEFAULT '0' COMMENT '专注力',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='教学评测表';

#
# Structure for table "rh_plan"
#

DROP TABLE IF EXISTS `rh_plan`;
CREATE TABLE `rh_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '学生id',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '老师id',
  `plan_time` int(11) NOT NULL DEFAULT '0' COMMENT '计划日期日',
  `content` text COMMENT '计划内容',
  `message` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `class_id` int(11) NOT NULL DEFAULT '0' COMMENT '班级id',
  `index` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='学习计划';

#
# Structure for table "rh_project"
#

DROP TABLE IF EXISTS `rh_project`;
CREATE TABLE `rh_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '上限人数',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='学科表';

#
# Structure for table "rh_pt"
#

DROP TABLE IF EXISTS `rh_pt`;
CREATE TABLE `rh_pt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '活动名称',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `pt_time` int(11) NOT NULL COMMENT '拼团时间',
  `user_num` int(11) NOT NULL COMMENT '参团用户数量',
  `is_new_user` int(11) NOT NULL DEFAULT '0' COMMENT '0都能买1只能新用户购买',
  `is_buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启购买数量限制',
  `buy_num` int(11) NOT NULL COMMENT '限制购买的数量',
  `is_sign_one` int(11) NOT NULL DEFAULT '0' COMMENT '是否开启团长代收',
  `visible_time` int(11) NOT NULL COMMENT '提现显示的时间',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='拼团活动表';

#
# Structure for table "rh_pt_goods"
#

DROP TABLE IF EXISTS `rh_pt_goods`;
CREATE TABLE `rh_pt_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `pt_id` int(11) NOT NULL COMMENT '拼团活动id',
  `price` decimal(10,2) NOT NULL COMMENT '拼团价格',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='拼团商品表';

#
# Structure for table "rh_pt_item"
#

DROP TABLE IF EXISTS `rh_pt_item`;
CREATE TABLE `rh_pt_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '拼团发起人团长id',
  `course_id` int(11) NOT NULL COMMENT '商品ID',
  `course_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '商品名称',
  `state` int(11) NOT NULL COMMENT '团购订单状态0队长未付款团购未开启1队长付款开启拼团2团拼完成-1拼团未成功已关闭',
  `user_num` int(11) NOT NULL COMMENT '团购订单人数上限',
  `pay_user` int(11) NOT NULL DEFAULT '0' COMMENT '当前付款人数',
  `img_id` int(11) NOT NULL COMMENT '团购订单图片',
  `item_time` int(11) NOT NULL COMMENT '该团有效时间',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='拼团表';

#
# Structure for table "rh_sortable"
#

DROP TABLE IF EXISTS `rh_sortable`;
CREATE TABLE `rh_sortable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL COMMENT '页面地址',
  `name` varchar(255) DEFAULT NULL COMMENT '页面名称',
  `sortable` text NOT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '页面的类型',
  `page_name` varchar(255) DEFAULT NULL COMMENT '页面标题',
  `page_background_color` varchar(255) DEFAULT NULL COMMENT '页面背景颜色',
  `json` text,
  `bg_img` varchar(255) DEFAULT '',
  `ucid` int(11) DEFAULT '3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


--
-- 转存表中的数据 `rh_sortable`
--

INSERT INTO `rh_sortable` (`id`, `path`, `name`, `sortable`, `type`, `page_name`, `page_background_color`, `json`, `bg_img`, `ucid`) VALUES
(1000, 'http://localhost:8080/h5/', '主页', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-swiper\",\"name\":\"轮播图\",\"img_url\":\"/cms/img/st-swiper.973d3789.png\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"banner_mode\":\"none\",\"banner_title\":false,\"banner_effect3d\":false,\"unique\":1625716833},{\"sorts\":\"st-grid\",\"name\":\"宫格导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"grid_col\":\"3\",\"grid_border\":\"true\",\"unique\":1625716835},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-3\",\"title_text\":\"精品课程\",\"unique\":1625801375},{\"sorts\":\"st-shop-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"list_type\":\"list-type-2\",\"shop_shape\":\"square\",\"is_show_title\":true,\"is_show_description\":true,\"is_show_price\":true,\"is_show_button\":true,\"button_text\":\"抢购\",\"button_type\":\"default\",\"unique\":1625716846},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-2\",\"title_text\":\"最新消息\",\"unique\":1625801377},{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-2\",\"unique\":1625716847}],\"disable\":false}', 'index', 'index', '#FFFFFF', 'null', '', 0),
(1005, 'http://localhost:8080/h5/#/pages/study_list/study_list', '学习足迹', '{\"id\":1005,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-5\",\"unique\":1625813600},{\"sorts\":\"st-qrcode\",\"name\":\"二维码\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADnUlEQVRoQ+1ZvWsUQRR/s3utYBMLQYggKUxjqVZJaSM2BkQLL9nZI4VWNlbGf0GLcDPjXiCIYIgRkRQ2SaWksrOxMAg2SSOksNndJxN2lslk9vZj7pJcuO3uZuY385v3/YbAiH9kxM8POYFer3cxjuM5AHjgQooQsouIXyil73QcxthDQkjggi3XIqIIw/CtwskJdLvde57nbbhukK3fb7VaU+12+6/8vby8PNlqtX4NCBviOL66uLi4K/F0Akue570AgFlK6XbTzbrd7jEc239N8DnnMwCwlabpy06nszQmYLvFsQT66FYjFcoWSds49kmPEwRBWx+oKwEhxAYiXjTBJTYAbAZBsKbGmhLYAgBpPNZPNyg5oQ4BbW4lbCcClNIjQc8G5kDgiOcrwh4T0OU8lkCBvchLGooKSWM1LU1G7kEYcVXsRjZQ5il835+en5//ocjV8ULqQEUeDhHbYRiuOLlRTaTH9knT9F+n09lxiQNRFF1PkuSSCR7H8a5K2JwJ1Em86kigDm6RbYyzUfMWT00CjLHHhJAeADSuBTIyEwAwrRcdmrG6YsstZFqTR+5chbKq6TkAhHV1U5+flZTrlNJnRuB7BQBPXLCzta8ppU8Vzvkp6gdwM6cCcf4kIL2Iy1VKG9Cjp47FGJsihFwuw/d9f0+P7pkTyJfpTYdcAkKIa4j4swy8yjghZCcIgpuGEfctjCy4h57Glsr07UoQQuYQcb/KQW1z0jSdMdszjLEbhJDvALCWpmmeNxXtIaXo+/76wsLCgbx9ianmmgnkiUTiovS47iU1ykbrbmKLxLaNOecfEXE1DMP1qnucGQJRFF1JkuQ3ALyhlB7pl5oGayFXvzNXBGp6C7lZFQkUESirDxSZWq3FsoLG7KW6EFAXUKZSnudtK1daasSc80P3V7Xsq0JAHpAxtkEIWaWUfig7cL/xygRc+kKD8kJRFE0kSbKnl5ojRaCRF1IqNCwJcM4/AcAFi5ocUErvGtG8/vvAIAhkz1fy9YeZT0+cc7TpOCHkWxAEt50JCCE2EfFOkSFV6Qv1M8KMgPQqs2XG3EiFJCjn/D0AyFLR/P5QSh/pf9Z9TjoRAmU3U4WAJJam6Yql1yNVaLgScCXQz42OhAROlMAw6gGdgEwDpERVKjAwCQyzIrMlacp76QSEEF8R8VaZylqTObVoWDWxiasSMiHEfdkkDsPws2yuIeJkBQK5Mzh/XYky9mdt/D8z0xt8hodtxAAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"order\",\"pic_list\",\"us\"],\"unique\":1625798445},{\"sorts\":\"st-plan\",\"name\":\"学习计划\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"unique\":1625798443},{\"sorts\":\"st-plan\",\"name\":\"学习计划\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"unique\":1625798442},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-cover\",\"name\":\"封面\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"cover_data\":0,\"cover_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\cover\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'article_list', 'undefined', '#fff', NULL, '', 0),
(1006, 'http://localhost:8080/h5/#/pages/article_list/article_list', '文章列表', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-2\",\"unique\":1625621659}],\"disable\":false}', 'article_list', 'article', '#fff', NULL, '', 0),
(1018, 'http://localhost:8080/h5/#/pages/pic_list/pic_list', '课程', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-tabs\",\"name\":\"tab选项\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"tabs_type\":\"green\",\"tabs_text_blod\":\"true\",\"unique\":1625621204},{\"sorts\":\"st-shop-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"list_type\":\"list-type-1\",\"shop_shape\":\"square\",\"is_show_title\":true,\"is_show_description\":true,\"is_show_price\":true,\"is_show_button\":true,\"button_text\":\"抢购\",\"button_type\":\"default\",\"unique\":1625620843}]}', 'pic_list', 'undefined', '#fff', NULL, '', 0),
(1028, 'http://localhost:8080/h5/#/pages/teacher_list/teacher_list', '教师列表', '{\"id\":1028,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-1\",\"unique\":1625621745},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-pro-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"pro_list_date\":0,\"pro_style\":\"style-1\",\"pro_bgd\":\"\",\"pro_list_bgc\":\"\",\"pro_type\":\"pic_type\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\picList\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'pic_list', '', '#fff', NULL, '', 0),
(1029, 'http://localhost:8080/h5/#/pages/video/video', '视频直播', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-video\",\"name\":\"视频\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"us\"],\"unique\":1625620574},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1626080656}],\"disable\":false}', 'cover', 'article', '#fff', NULL, '', 0),
(1030, 'http://localhost:8080/h5/#/pages/user/us/us', '关于我们', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-image\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"img_button\":\"\",\"img_logbox\":\"\",\"img_height\":200,\"img_padding_show\":false,\"img_padding\":12,\"img_serve_url\":\"\",\"unique\":1625623244},{\"sorts\":\"st-presentation\",\"name\":\"介绍栏\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABBUlEQVRoQ+2ayxHCMAxE5UqgE1AqoROgEyqxoBOoxBzgEIJt7Ik/UdicPZZ231r5TAwpv4zy/mm9AkTkuCQ6zHz29RMkICJuYQK8vUJAK0rMDAKtzPbWAYGu9hMRCKgnEEJYS9j0Rjo7QhCQiQoEUh3INDZ5eWr95Ie51Z0Ba+3VGLNLtjSy0Dl3G4ZhP15SnQAEjOzuQqBEdGJ7VI8QBPxwoDoBETkQ0aYQiQczXzCFchxQP0bfEdoWitC9eYQKNR7cpvohhoDeY1T9IYYAPMy9HPjfNzKM0d5jVB0BIjrVbnqy/0e92Z8WGzf/VQ4CNBJonfmoR8zs7We9vxr0jkxqffUEnnjyX0AMBwrBAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"presentation_show\":true,\"presentation_title\":\"默认标题\",\"presentation_text\":\"默认内容默认内容默认内容默认内容默认内容默认内容默认内容\",\"presentation_type\":\"left\",\"unique\":1625623242},{\"sorts\":\"st-contact\",\"name\":\"联系我们\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAC2UlEQVRoQ+1ZvW4TQRCeOSNREt4gSPRATyCzdhnx8wQJDXWM6ENqJAg1BeYNgkLpu3GAB3B6JMITAC3CHjRmT1pffJddn31no9vK8s3tft98s7OzcwhrPnDN8UNDoG4FGwVWQgFmPgKAW3WD8Vi/S0RD124SQkmSDBDxvscEdZsQEQ1yCYjIdwA4rxtlZv0NREyjo5gAABwS0YtVIsDM2wDAFlNDoHJxGgUqd3lmwUaB/0IBZt4DgN0FkHlPRL2QeRYSQsysZ8NByMI5tsHnzKII7ImIqlBqIGJvDgU2ASBdW9+fqhSytVCwh0oxWsDLDYEFOLHUFCuhADPviMghANy0bL4i4gERfbyMnRcBmwl87wun2Zq9CAQznwDATo7NCRE9KHrfl0BIGvVOBMz8EgCeK0ARAcR/V/TM72fGmNd5JGolEMfxKIqiyAWcAk3/E5HfxpirpQhcFofzPO/3+1utVuuTz7uj0ehep9P5PMvWSwGfRUJtmHkfAHJDIzOfXua18XBh1EngLgDM9OoMnFtE9GWlCCiYOI7/RFHUKlJvPB6P2u32lZXbAwooSZIuIr4qIiAi5bNQaHyH2DNzT0R20xTqZiEAeGuMeVr6HAgBFGLLzLdtmf6o4L1jAHiTdzjWuYn1fnGhByUiZ04jy+V1RETdLNFaCDDzu7TGF5FfiKgpcqrWZ+bJPUBE9hHxmgWuNk9cEpUTcG931tvbRPQzL4SYeUNEtHebthc1nPQMmYxKCVivftOFFbwxRveA10iSZOiQuJN2qasmoBvyoQ2bzSLPZ1lZJc5tOH0gosnGzxLQlBbUNchznzHm1H2mAADgh/3Pu2LNzOFWxdfVAUv7PkBEU5+vbGtGN6+OG9nLuU8cuSEIAI+J6LhKAhPvafgYY1SNuQYzi6tiZR/5VAFtzSDi0M0ioSxsFasOGOjhVhmBUKC+9g0BX08ty65RYFme9Z137RX4C5bu3kCEsdBTAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"contact_icon\":true,\"contact_icons\":[\"address\",\"phone\",\"time\",\"name\"],\"unique\":1625623241}]}', 'us', 'undefined', '#fff', NULL, '', 0);
INSERT INTO `rh_sortable` (`id`, `path`, `name`, `sortable`, `type`, `page_name`, `page_background_color`, `json`, `bg_img`, `ucid`) VALUES
(1031, 'http://localhost:8080/h5/#/pages/user/usinfo/usinfo', '个人信息', '{\"id\":1028,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-form\",\"name\":\"表单\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"us\"],\"form_style\":\"form1\",\"form_list\":[\"name\",\"phone\",\"message\"],\"unique\":1625712314},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-pro-list\",\"name\":\"商品列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACtWK6eAAANl0lEQVR4nO2d7VkbOxCFKYESKIEO4g5CB7iD0AHbQdKB3QGuQIcOoAPTgdMB94dEYnxNPCPNjj72vM8z/+yVNLNHGml3pasrI0II3wA8AnhC5L1ze0lteQwhfLPyUyucxOulAX+XGpqLVwjhO4BNA87xsqcQwvfafs8lxeupAT962aZKvADcA9g34IBatgdw7+74DABcg/HawyNeAFZYtqNPbQ/gbnbHZwLgDozXse0BrOZw9DWWlUpp7QnAtbnjM0GM15JSKa1tYBUvALcYYxI3t+0B3Jo4vTxe+wb80bq9oDReiM4+NNCYXuyAiiIB46W1/HiBzs61KiJBjFfttvdo+niB4ig1V5GA8So1ebwQJ3hFc44QwmsI4RnAFsDUmW1DCM8hhNdCp+/hMHFP8dozXsXxehHFC5mrVcnBDwBu5r4pvABwA2Cd2pbj9CeHOmatVqU2rQeM10NBvDaXClhlOPoNDT8LsALAKrOXms03iM85tPF6xRzPAhojxestI16rf110r7zY1q3FjYA4rGt8tMcMqRZiaqWdd0zW9WgdAL+08frqQmvlhda+TW0HxLTrd80bUyPUVNe1dR16weTehm70+P8FFobS6ed7pfyytaPH2rL8HimKF3S57LZOE9sDunRrbViuJtiTVbm9A126dXf8x63kTyGEt3rNaxPFisnOqkwAO2G8nq3KHAXFxH37509ZqiJXV1fqlb/iyTpieiUtb2XQxKGAPFs6fPxBFGD2Rl+jGEWKOxhFgM1GrNFQLNevNHn0Q+2GtQrkc4LJoCxpHr0ub9mYID7QlsULwnwWAz1xtQbCtMdiFFaMVs18n9IaiE/cJT7cihweQnit3ajWEd64xcu9ECzHMx2+jCTNCiE8iybodPhlIByJDcqR9Hycf1xA2KEdpA7f1m5Q60A4lzMoRxKvyaBJQwPhow063AgKpC/E8aLDbaBA+oICcYYC6QsKxBkKpC8oEGcokL6gQJyhQPqCAnGGAukLCsQZCqQvKBBnKJC+oECcoUD6ggJxhgLpCwrEGQqkLygQZyiQvqBAnKFA+oICcYYC6QsKxBkKpC8oEGcokL6gQJyhQPqCAnGGAukLCsQZCqQvKBBnKJC+oECcoUD6ggJxhgLpCwrEGQqkLygQZyiQvqBAnKFA+oICcYYC6QsKxBkKpC8oEGcokL6gQJyhQPqCAnGGAukLCsQZCqQvKBBnKJC+oECcoUD6ggJxhgLpCwrEGQqkLygQZyiQvqBAnKFA+oICcYYC6QsKxBkKpC8oEGcokL6gQJyhQPqCAnGGAukLCsQZCqQvrAXyq3aDWocC6QtTgYQQnms3qHUA7CiQfhALJITwKvjhS+0GtU4I4VnQ0byVlkOB2CAWiLTnA3BTu1GtAuBa4kOLkZgCsUEjENEPAaxrN6pVAKyFPiyey1EgNmgEshI6HbUb1SoAnoQ+vDMoiwIxQCyQ9GOJ098BrOo2qz0UHcw7gGuD8igQA7QCkc5DOFk/AZGLvrNaCaRAbNAK5E7oeDr/CAAPCr+tjcpkjAxQCeTq6uoqhPDmHeye0XQqIYTfMEivUrkUiAFqgUC+EvMO4LBkkSRxHBT+mgzLpkAMUAvk6ko9irwDeKzUvmoA+KHxkeXokcqnQAzIEgh0c5EPAxawuoW4WoUM/6yN60GBGJAlkPRH6YrWOaHcw7C3rA3iE/J7yJ9zfLI53mGjQGwoEch1Rqp1TixPAB47tafUhpy2vwP2qdVRfCTlT9bljgZK3r4GcJsCnH2DLNmS725nCqykDtMcZY8ESj9PAEVSYsWvlPwjLpLyp7nKHwVYfL8DikRlyVeziSPFRFKXac46jACsPnBDFEnpnGR4mzOtOomHpD7T3PXoHVh+AYq4mpO7ujW8pY+lXFbvhHWaPOrSM5jjE2kAdxxNPgnjN5zfKBDWbfKsU49grj0EEEeTaclCScKYUOGZj7COk3e9egMem2wgvr+1pNRrl9pc7WGosJ5Trfr1Apx2ofko7BrxNZUphPA8wugSQnhLc4tfqW1NvCEgrP9Uu56tA0+BED8oEBsokEGhQGygQAaFArGBAhkUCsQGCmRQKBAbKJBBoUBsoEAGhQKxgQIZFArEBgpkUCgQG+B0XAVxRhJUnudyGa/jKogzwtd4uEXsBQDs2dEMiKTnS3ZTu66tAuBW6MNt7boSJeB5LsUofPhQu65ECXieSzGS9CrZ7J9QkxkQBpejyBkg3JE/hPC7dl1JJgC2QoHs0ch3LC2A+N2SdNNxu6PPEXdj/I64KyEUQ1jLtk9t+Zna1syNBt0eypva9W2FFE+p38rTKxTsW9upAY3sP6z8anPxk03EL0NF/ipa3kUcph6hOx9jNDskH9T8Nl1znss7FnhUxQcANkpfrXILusMY6ZOVHQDc24ZTTgjhVVnfJzQw+nmB2JlD46Os0SMVtKRUSmtAnS2ApEu+x3bA4KMJyrKcG21ht+CoIbEDKqybQ5Fbn9gewCaE8N27znORFlM2yE//dXM1RHEsea6htQNm3rz6HBmp1ld17xWLe3SncjoojhJzFQniMruFSBZpyXfyFBkUR6m5p1vgURVZliOOaxTOOdIbpzvEl8J6tJ3irdmv7KByvAEAbjiSzCiO5OTsAytRed9aaxA7izUKDjatUWcDcS/BdsgQh/oY6BSM1TzhbgcAq8wbb12pvtJXuhdlKQ3Ne7MA+tRqsg1r+0D4NuiRuadaR3W94WjyyXbI/ZAMilcXahwc0xKIBwlpJsRT5frmjn6j2BaliybQjR5rm9D1C3TpaLVR5KTON4hHVAw/kU9tfIDFp8fQBXsqLnAQoEu31rXrewyOznQBsE3nunRriKPEhPj6jW1nBOEqTQjh1bTgAVCkLvwEtlcUveCqdl1bA7oXBqunWUSJNMDcI+hrpCMwKrynRQoBt5EpBvIVQLvvnIkPit7vpnZdWwVxwstReEQAvAgCy8n5BYST9X3tehIl7PlskI7EtetJlAjTq23terYOeN7EmAgFMtWuZ+tQIINCgdhAgQwKBWIDBTIoFIgNFMigUCA2UCCDQoHYQIEMCgViAwUyKBSIDT0LBPHT3G89G+Z6FYoCsaEXgeDvWS4/IXjNqEMD0pkuVg6TFDqZFDYwaFwgiJ81bLCsDQEPqc03JY6TFDSZRWpQ0KhAEIWBBm7W2gbkbNwgvPhkH7qxQGMCQXwFf9PAjdma/YRyq1HJRaf5QjkGaEggiKPGklIpre0hHU2EF5zmDWn/oBGBQH8025JtLXGo5ELT3IHtHTQgEMT0ofZN15utLzlVcpFpzsCOACoLRFo+TSkS4QWmuQI7CqgoEDCtsrDzO84I/zzNEdiRQCWBIB52lH1jpC06J8RdIled2oTyLVUPOPe8RPjnyTqwo4EKAkHmYUcfm4+fvSE6B3/3H845bevl3AUpEAMqCSRn3jFhATs8ps4jxz8PpxeiQAzwFghiTykOfOpR3Y+prg3i0Q+a0eTzTvwUiA0VBLJViEN/Ft9AIB5w+qYQyXT8ZwrEAE+BQDF6pN7zxqLcnoHuFOC/owgFYoOzQDTnkqwsyhwB6JbD1x9/okAMcBbIXhi3rUV5I6E+z4UCscFLIBCmV0ytziP1X7JrCsQIR4FI0wQetfAFkC9w3FEgRjgKRBrclUGzhkTRyUwUiBFeApHk0CGE3xZtGhVoznOhQGzwEggEH0LxuIrLCCfrLxSIEY4CkcRra9CkoZGuZlEgRjQmkMmgSUMD4BcF4ggF0hfieNHhNlAgfUGBOEOB9AUF4gwF0hcUiDMUSF9QIM5QIH1BgThDgfQFBeIMBdIXFIgzFEhfUCDOUCB9QYE4Q4H0BQXiDAXSF9YC2dZuUOtQIH0B4YdnIofz+4LLANg1JJCdRZtGRvy6u/jDEfJPhF/6vRmU88YOrRwITvj9+KJQ1POBO2R8CTSfcBai2LZmsTspXgLynU124twZp5v6kj9AswlAeVmiD30gOV5soUC+8d50hXi+guTHqN2wVkFE4sPzh7ToyroTlvVk0bYRgSC9Srb6+IPkxyYBHg1FB/MOg7QHwnTuU4DJHxQdzPvxn0RLXgD2FdvWJIhIfGe2sgT5vJGj/gnI2bZVoyoAm3rNawvoDmhZG5YrnfO8g89E/gBgo/Db52xJeX7Cuk4T20Fzk1os756iPBRm8alxcbyUvdKiRZJ8dXEDtyObZqiDZvQ6MF4G97ZyFHnHAtMtAD81Pko+NX8mAeA6I16P1vVonZx4/etimhWZD9tjAUN48o10efDYZvMNdHPHDwMWsLqV4rXP8M/q0oWlK1qn9gLgBwZ64o74xPVHuqlyfDL7O1GQr2idE8o9BnribhCvraSQ68ID2d8RxQLEVYPHzmyT6p4zWvyxuVKrL+KlTbVO7SNeP519bWE/U91L4yU/6BS6Aw9p/3e265HLYLyKLCteoNOzrNZ55GC8sqwoXqDTVVZLHIxXxXghOr10TjK8pXlANXGcxKt0TjK8pXvaJl6IL8jlrm4twXZoaDUIMV65q1tLsC3miBeAFXunv5Z8sTJ3tBEA7hivCvECsF6y41Pb17M72gjGq1K8EJ/kLin12qHjtwZSvJaUem2biRfio/0JwE7x3XSzltqwS21a1favNYyXjP8AfWrGZJuPskEAAAAASUVORK5CYII=\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"pro_list_date\":0,\"pro_style\":\"style-1\",\"pro_bgd\":\"\",\"pro_list_bgc\":\"\",\"pro_type\":\"pic_type\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\picList\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'us', '', '#fff', NULL, '', 0),
(1032, 'http://localhost:8080/h5/#/pages/teacher_list/teacher/info', '教师信息', '{\"id\":1005,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-chart\",\"name\":\"图表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"chart_style\":\"radar\",\"unique\":1625823826},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-3\",\"title_text\":\"标题\",\"unique\":1625801833},{\"sorts\":\"st-article-list\",\"name\":\"文章列表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABmElEQVRoge2YXZXCMBBGI6ESkICEOlgcgIOtA+pgkYADUDAXCTjYdVAcsA9NOaGnP0laOn3IPSdPhOT70mQyE2MSiUQi8WmAPfDDOEcg19b7BnABnoGt1NZtjDEGKCLENy3X1m9E5OauKpAPtJ2I3J3+J239phEjIjfP/ru+/wAb4HfR7RhhIB8wcIjZir5zL2FgIyJ/ESaKVRhQIRnQZm4DNkodA1u2CgPANiYKAddoA85FVjFys1LHeTftOLV+X94A9e0bM+kTOHSMt7NjhrRJWyhrpQdebRUHuAHIgLKVF/UKZy2ZaGJN2AizZyRmi8gXsNHW+4YVF3KIq64IpAJOfh9hYqut/60is+F0MGaLyMMxUbpj2W1YRSxG2a3Og9aEoyuKU7R0pBJ5gOhn3zihBl4DefYfyoUyn7ukJf7BlPM0pwEVkgFt5jYAfBNe0MSH45kPcVQUYmI9MKcBlYrMrQVG32eoX7Cb/ucegyHFTMHEguYcuWpehj8O9WvaI1S8iNy1tb+we/caYOA86bMnEolEYkn+AZY/bkCHk98BAAAAAElFTkSuQmCC\",\"type\":[\"index\",\"article_list\",\"pic_list\"],\"article_type\":\"list-type-1\",\"unique\":1625715123},{\"sorts\":\"st-nav\",\"name\":\"导航\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"nav_style\":\"style-1\",\"nav_right\":\"login\",\"nav_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\nav\"},{\"sorts\":\"st-minibanner\",\"name\":\"图片\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD4AAAAwCAYAAABJy8k0AAADIUlEQVRoge2aPWgUQQCFB38RRYn4l+B/xCKFjdpo4Q9CsLKxSKEBRQvRQtRCrBTUxkrsIjaaQg4UQYkkl31vdnbvCOHAJqciIaBYqY1YWPhzFncLlzM7O7N3e3uXy4NX3HHzeB8zNzOXjRBCCMdxjgJ4BkDOY08D8EmeFEIIQfImyVKH+aIA8K0FijTVAD6LmjdOkDw8Hw3gcTXrLHCl1HoxTwXgbih4LpfbkHbBpLQAvgBe9WJ8fHxj2gWTkhac5Lq0C4aJ5D4AQyQ/VLp+BTDkOE6v4fjbOvBNSQPEEcnhmp6zDGAwKgPAnbYCJ/lSBx1YSrlfl9NW4CRPmUBXnNVltRu4ZwFe8n2/JyxLC66U6m4mWJRI/rQBl1IeCctqN3Bj6Ar46bAsLbhuqaQhkjOW4MfDsrTneAvO+FMb8Hw+vzYsq62WOoCDptAA7kdkaXf1zc2CMhWAKwbQOYOc9gIXQgiSx0i+nQO4SPKqSUbUXT0WuO/7PSQzccbaSCnVx/JfU/Zms9k1NmO1M+667pY4hVhW5PcsTWlnPA64lPJCzao5l0TxeqUF931/q02Y4zi9rLldAfitu0GlpYaBl0qlRQAKIbvsd8/zdicJYistuOM42yyCbkQcMzMTExOrk4SxUUPAlVJ7SP6KAC+RRCaTWRy3LMkBksP1ZASKOs62RwUUi8VlJN8ZQAd+GLPoIMm/lYznJJfEyanKqw+c5D0L6MCXbUpKKc9XQQd+VSgUliYC7rruDt1g13UPzFEo0gD+AOg3KUjykiZrLC58bPDR0dGVAD7GmO3AP5RSfRHQ1wxyxkZGRpY3DRzAozqgA3/yPK8rJP+WRQ7z+fyKhoF7nrczZFB/A6BLLC97v3a5Msa+ASBHclVi4J7ndZH80ijwip9UQT+oI2fSFD7qHP/vqQTJFw2GDny98mSk3pxJk4uSFXjlLE0CutF+E7Z3GIGT3BV8UCnVDeB7C0AZGcAUNc/+jMFZVupAlvDvw+CjwDvGC+Cd5gXwTnPngtf5i6stDWBaADibdpFmW0p5JrisDLTAv1Un7SmSrwEcEkKIf7/OIuh6zYZ9AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"img_style\":\"style-1\",\"img_button\":\"\",\"img_serve_url\":\"http://qz.thinkphpcode.com/static/pc/imgs/index-item1-2.jpg\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\miniBanner\"},{\"sorts\":\"st-cover\",\"name\":\"封面\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"cover\",\"article\",\"art_list\",\"pic_list\",\"pro_list\"],\"cover_data\":0,\"cover_bgc\":\"\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\cover\"},{\"sorts\":\"st-footer\",\"name\":\"页脚\",\"img_url\":\"/cms/img/st-tabs.ec3c73a2.png\",\"type\":[\"index\",\"cover\",\"article\",\"art_list\",\"pic_list\",\"us\"],\"fot_style\":\"style-4\",\"tag_path\":\"test\\\\test\\\\st-cmp\\\\footer\",\"fot_list_bgc\":\"\"}]}', 'article_list', 'undefined', '#fff', NULL, '', 0),
(1033, 'http://localhost:8080/h5/#/pages/study/plan/plan', '学习计划', '{\"id\":\"sort-1\",\"level\":1,\"child\":[{\"sorts\":\"st-plan\",\"name\":\"学习计划\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"unique\":1625716799}],\"disable\":false}', 'cover', 'article', '#fff', NULL, '', 0),
(1037, 'http://localhost:8080/h5/#/pages/user/index', '我的', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-qrcode\",\"name\":\"二维码\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAADnUlEQVRoQ+1ZvWsUQRR/s3utYBMLQYggKUxjqVZJaSM2BkQLL9nZI4VWNlbGf0GLcDPjXiCIYIgRkRQ2SaWksrOxMAg2SSOksNndJxN2lslk9vZj7pJcuO3uZuY385v3/YbAiH9kxM8POYFer3cxjuM5AHjgQooQsouIXyil73QcxthDQkjggi3XIqIIw/CtwskJdLvde57nbbhukK3fb7VaU+12+6/8vby8PNlqtX4NCBviOL66uLi4K/F0Akue570AgFlK6XbTzbrd7jEc239N8DnnMwCwlabpy06nszQmYLvFsQT66FYjFcoWSds49kmPEwRBWx+oKwEhxAYiXjTBJTYAbAZBsKbGmhLYAgBpPNZPNyg5oQ4BbW4lbCcClNIjQc8G5kDgiOcrwh4T0OU8lkCBvchLGooKSWM1LU1G7kEYcVXsRjZQ5il835+en5//ocjV8ULqQEUeDhHbYRiuOLlRTaTH9knT9F+n09lxiQNRFF1PkuSSCR7H8a5K2JwJ1Em86kigDm6RbYyzUfMWT00CjLHHhJAeADSuBTIyEwAwrRcdmrG6YsstZFqTR+5chbKq6TkAhHV1U5+flZTrlNJnRuB7BQBPXLCzta8ppU8Vzvkp6gdwM6cCcf4kIL2Iy1VKG9Cjp47FGJsihFwuw/d9f0+P7pkTyJfpTYdcAkKIa4j4swy8yjghZCcIgpuGEfctjCy4h57Glsr07UoQQuYQcb/KQW1z0jSdMdszjLEbhJDvALCWpmmeNxXtIaXo+/76wsLCgbx9ianmmgnkiUTiovS47iU1ykbrbmKLxLaNOecfEXE1DMP1qnucGQJRFF1JkuQ3ALyhlB7pl5oGayFXvzNXBGp6C7lZFQkUESirDxSZWq3FsoLG7KW6EFAXUKZSnudtK1daasSc80P3V7Xsq0JAHpAxtkEIWaWUfig7cL/xygRc+kKD8kJRFE0kSbKnl5ojRaCRF1IqNCwJcM4/AcAFi5ocUErvGtG8/vvAIAhkz1fy9YeZT0+cc7TpOCHkWxAEt50JCCE2EfFOkSFV6Qv1M8KMgPQqs2XG3EiFJCjn/D0AyFLR/P5QSh/pf9Z9TjoRAmU3U4WAJJam6Yql1yNVaLgScCXQz42OhAROlMAw6gGdgEwDpERVKjAwCQyzIrMlacp76QSEEF8R8VaZylqTObVoWDWxiasSMiHEfdkkDsPws2yuIeJkBQK5Mzh/XYky9mdt/D8z0xt8hodtxAAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"order\",\"pic_list\",\"us\"],\"unique\":1625798214}]}', 'us', 'undefined', '#fff', NULL, '', 0),
(1039, 'http://localhost:8080/h5/#/pages/article_list/article/article', '文章详情', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-server-title\",\"name\":\"数据标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"server_title_type\":\"center\",\"server_title_time\":true,\"server_title_soure\":true,\"unique\":1625792838},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1625792837}]}', 'article', 'undefined', '#fff', NULL, '', 0),
(1040, 'http://localhost:8080/h5/#/pages/order/order', '订单', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-order\",\"name\":\"订单\",\"img_url\":\"data:image/png;base64,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\",\"type\":[\"index\",\"cover\",\"order\",\"us\"],\"unique\":1625796340},{\"sorts\":\"st-server-title\",\"name\":\"数据标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"server_title_type\":\"center\",\"server_title_time\":true,\"server_title_soure\":true,\"unique\":1625792838},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1625792837}]}', 'order', 'undefined', '#f4f4f5', 'null', '', 0),
(1041, 'http://localhost:8080/h5/#/pages/study/evaluating/evaluating', '学习评测', '{\"id\":1018,\"level\":1,\"disable\":false,\"child\":[{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-2\",\"title_text\":\"标题\",\"unique\":1625800601},{\"sorts\":\"st-chart\",\"name\":\"图表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"chart_style\":\"radar\",\"unique\":1625800598},{\"sorts\":\"st-title\",\"name\":\"标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAACp0lEQVRoQ+1Yi3ETMRTcVwFOBZAKCBXgTQOEChIqIFRA0kGogKQCTAP3TAWEDkwFOBWI2RvJI3ssDiz/jjnNeM6+u/fZ99kn2dDzZT33HwOAQ2dwyMCQgcoI9L+E3P0KwPNNAkHy1t3HAD4CmAN4R1LXzuXudwBe6kWS7BQovGBN00zN7PUmCkiau/8CMIryX0le5Lrc/QWAS4HN7+d2pWcT+5LZBoCQGV8C4O5fALSAVp3cGoAS8r81oBIMIagc5mZ2QfIx6XT3BbijBfCn1PcCQGzi1EMPEdBlvN5kANP3nyTvuzLs7u8BiCBSf4kcJiSTjVZ1sXm6DGRlIsfEQm2px6uXMhNC+HZ+fj4u6Xf3MwDqHTX/uqUSFXG1bLcLAPPYE8jZTY63Bs0eSV6vA+Duivb35LxkzGwquRDCONMnHa92AoBka1DrX3sgzgaVjtYDSc2oxXL3PNsfSN5tPQOVAPKZcrJuKDZNI7Z7BmBG8vRoAEQySL0zA3Bf6AFlJfXHybECKHHA6v3yCN+UhTYtoTwDIYQnAIuBWEJjZtfHlAHRpxhIa8EyXak4GgByNGtQ/TwlqV7IWUg0+zkOtydtHHcKoGmamZmlrfoSqxTmQE6TouO3ORO5u5xP1PpJ82SnANx9AuDNShnckrwpDbIQgrb37TlBVBk/+i7madknhPDDzMYCt2sAZyGESZYF2S8CiMNvFGXWnlHidL5K5VUEEPck7UYqZ5bVpooHlsTLar6lE1ncHqhB09IAmnXpj891llAQRnFLMV31ZeOTUBc77Ov5AGBfkS4Os0M7UGt/KKHaCNbK63+d/Nxaq2/v8gKQ/6+zdwdqDQ4AaiNYKz+wUG0Ea+X7n4GBRmtroFL+v6DRfk/iygweXLz/LHTwEFY60PsM/Ab66dzaOfXFjwAAAABJRU5ErkJggg==\",\"type\":[\"index\",\"cover\",\"article\",\"article_list\",\"pic_list\",\"us\"],\"title_type\":\"list-type-2\",\"title_text\":\"标题\",\"unique\":1625800576},{\"sorts\":\"st-chart\",\"name\":\"图表\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAEHUlEQVRoQ+2ZTYgcRRTH36txBXFRVJQcRAQRRQIRXNCDaDwIguDJgzmoZLZez6yo6xfiBywuEvELNYmy2/1qEvUgYQ6KkktE2KAsQVBRhHxoXBRBEGJYl712PamlVybjTE9VTctsYBqGOcx7//d+9a/qrupBOM8vPM/7hzHAqB0cO9DtQLvdvnB1dXVKKXW9tXYbIl5MRHP/l1OVOLC0tHTBysrK7jzP70fEuwHOWVsniOimLQvAzM8BwDMAcEWfJrcmQJZldwLAXkTcMWB0NwCYeScAfIKIR621PymlPtNaLw/rTNQUyrLsEUR8z7N4J8BSV84viHgYERemp6dPeeqdExYMwMwvAMCegGJlAJsyZxDxDa316wG6G6FBAGmaPqmUeiuwiA/ApuQRIronRN8bwBhzr4gcDhEvYkMAXMpvRHStbx0vgHa7fdHa2tpxEfEW7mggFMCl/klE23wgvACY+U0AeNpHsEdMDICT2UdEs4NqDgRg5qsB4PdBQiW/xwKAtXa+0Wi8VFZ7IECWZfOIOMxWIBoAAM4i4q1a69P9IAYCGGNOisgNo3CgqLmfiB6PAjDGbBeRH4do3qUO48BG6Vqtdk29Xu85jUsdaLVaZK3NRg2AiLu01od69VEKwMz7AOCxUQOIyLtJkvTsoxTAGPOpiNw3agAAWCai22McOAYAt20BgFNEdGMwwMLCQsyT9z91ZmZmfi220927Ud+xOUNEVwYDuIQ0TS/1rdIvbmJi4pI8z68DgFgAIKKe033gc4CZzwLAZbEQInJofX29Pjk5eQARH4jUiXeAmb8BgFsiC88R0cvMvAsAPorUcGlxa8BlZlnWQsR6YPG/AaBORB9nWfYgIn4YmN8dHncXcirM/BAAfBDQwDFrbb3RaJxk5t0AcCAgt1/oi0T0StQiNsZcLiJ/eTbRIiLtYo0xWkTYM680LM/zm5vN5g9RAIULzgHnRN8LEZ/SWr9dTLumO6hX0byIfJ0kSd9n0cC7UAHgFrFbzL2uP0SkniTJEfdjmqaPKqX2V9F8odEgor77MS+AAqLXvuiLWq1W39wpGmNmReSdCpv/loimSp33LZam6YRS6jsA2O5yEHGv1vqJzXxmdkdOd/Ss8iod/Y0+Qqq1Wq0pa+1XADDbaasx5lkReS1EyyP2IBENvH0HAbiii4uLOzrvCBEvujx6h6NEdJdPYDBAp2iWZXOIOO9TKCDmVSJ63jd+KIA0TR9WSr3vW8wjzj29D3rE/RsyFEAxpe6o1WrudWPsfglE5HNr7Z5ms/llSPPBi7hMnJkTAHCfEJATImKSJAl931qdA91Q7uBird2plHL/H7hDyFXF92lE/FlE3Pf3iLgc+0q9s+bQUyjU8qrjxwBVj2io3tiB0BGrOn7sQNUjGqr3D6pZoUC/Wgl3AAAAAElFTkSuQmCC\",\"type\":[\"index\",\"cover\",\"article_list\",\"pic_list\",\"us\"],\"chart_style\":\"line\",\"unique\":1625800595},{\"sorts\":\"st-server-title\",\"name\":\"数据标题\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"server_title_type\":\"center\",\"server_title_time\":true,\"server_title_soure\":true,\"unique\":1625792838},{\"sorts\":\"st-html\",\"name\":\"数据文本\",\"img_url\":\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAgMAAADQNkYNAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAAAlQTFRFAAAA5ubmAAAAF/49xAAAAAF0Uk5TAEDm2GYAAAABYktHRACIBR1IAAAACXBIWXMAAABIAAAASABGyWs+AAAASElEQVRo3u3UoQ0AMAwDwZDuV9L9V+kAlQqCIvmeWkddpejWedvfAUEQBEEQBEEQBEGQ6URSZmNPCUEQBEEQBEEQBEGQNlFsFys0TXk1zfreAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIxLTAxLTIxVDA5OjQxOjIzKzA4OjAw2PWkZwAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMS0wMS0yMVQwOTo0MToyMyswODowMKmoHNsAAABQdEVYdHN2ZzpiYXNlLXVyaQBmaWxlOi8vL2hvbWUvYWRtaW4vaWNvbi1mb250L3RtcC9pY29uXzd1cXMyN2ZlcWh2L2ljX21vZGVfYmxvY2suc3ZnHyf84AAAAABJRU5ErkJggg==\",\"type\":[\"cover\",\"article\"],\"unique\":1625792837}]}', 'index', 'undefined', '#fff', NULL, '', 0);

-- --------------------------------------------------------

#
# Structure for table "rh_star_order"
#

DROP TABLE IF EXISTS `rh_star_order`;
CREATE TABLE `rh_star_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '完成进度',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '0未完成1已完成2已过期',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='助力订单';

#
# Structure for table "rh_star_task"
#

DROP TABLE IF EXISTS `rh_star_task`;
CREATE TABLE `rh_star_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '活动名称',
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程id',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '助力数量',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `json` text,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='助力任务表';

#
# Structure for table "rh_star_task_goods"
#

DROP TABLE IF EXISTS `rh_star_task_goods`;
CREATE TABLE `rh_star_task_goods` (
  `task_id` int(11) NOT NULL DEFAULT '0',
  `course_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `star` int(11) NOT NULL DEFAULT '0' COMMENT '助力人数',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`task_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='活动商品表';

#
# Structure for table "rh_star_user"
#

DROP TABLE IF EXISTS `rh_star_user`;
CREATE TABLE `rh_star_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '任务id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='助力用户';

#
# Structure for table "rh_stu_label"
#

DROP TABLE IF EXISTS `rh_stu_label`;
CREATE TABLE `rh_stu_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '标签名',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='学生标签表';

#
# Structure for table "rh_student"
#

DROP TABLE IF EXISTS `rh_student`;
CREATE TABLE `rh_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '学生姓名',
  `img` varchar(255) DEFAULT NULL COMMENT '学生头像',
  `age` int(11) NOT NULL DEFAULT '0' COMMENT '学生年龄',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '学生性别0男1女',
  `mobile` varchar(20) DEFAULT NULL COMMENT '学生电话',
  `person` int(11) NOT NULL DEFAULT '0' COMMENT '家长id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '学生绑定用户id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `label` text COMMENT '标签',
  `fee_course_num` int(11) NOT NULL DEFAULT '0' COMMENT '交费课时',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='学生表';

#
# Structure for table "rh_study_history"
#

DROP TABLE IF EXISTS `rh_study_history`;
CREATE TABLE `rh_study_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0' COMMENT '课程Id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学习轨迹';

#
# Structure for table "rh_sys_config"
#

DROP TABLE IF EXISTS `rh_sys_config`;
CREATE TABLE `rh_sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `desc` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1基础2微信3支付宝4短信5物流6上传配置',
  `switch` int(11) NOT NULL DEFAULT '0' COMMENT '0填写框1开关2单选3多选',
  `other` varchar(255) DEFAULT NULL,
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '3',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

--
-- 转存表中的数据 `rh_sys_config`
--

INSERT INTO `rh_sys_config` (`id`, `key`, `value`, `desc`, `type`, `switch`, `other`, `delete_time`, `ucid`) VALUES
(1, 'api_url', 'http://rhedu.ruhuashop.com', '入口位置', 1, 0, NULL, 0, 3),
(5, 'wx_app_id', '', '小程序appid', 2, 0, NULL, 0, 3),
(6, 'wx_app_secret', '', '小程序秘钥', 2, 0, NULL, 0, 3),
(7, 'pay_num', '', '商户id', 2, 0, NULL, 0, 3),
(8, 'pay_key', '', '商户key', 2, 0, NULL, 0, 3),
(9, 'wx_token_expire', '72000', 'token有效期', 1, 0, NULL, 0, 3),
(35, 'app_appid', '', 'app的appid', 2, 0, NULL, 0, 3),
(97, 'title', 'ABC培训机构', '系统标题', 1, 0, NULL, 0, 3),
(98, 'copyright', 'CCLV@1209', '版权信息', 1, 0, NULL, 0, 3),
(99, 'yd_id', '', '有道智云id', 1, 0, NULL, 0, 3),
(100, 'yd_key', '', '有道智云秘钥', 1, 0, NULL, 0, 3),
(101, 'page_theme', '#00f', '页面主题', 1, 1, NULL, 0, 3),
(102, 'address', '1', '公司地址', 1, 0, NULL, 0, 3),
(103, 'phone', '1', '联系电话', 1, 0, NULL, 0, 3),
(104, 'date', '1', '营业时间', 1, 0, NULL, 0, 3),
(105, 'name', '1', '公司名称', 1, 0, NULL, 0, 3),
(106, 'gzh_appid', '', '公众号appid', 2, 0, NULL, 0, 3),
(107, 'gzh_secret', '', '公众号秘钥', 2, 0, NULL, 0, 3);

-- --------------------------------------------------------


#
# Structure for table "rh_teacher"
#

DROP TABLE IF EXISTS `rh_teacher`;
CREATE TABLE `rh_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '教师名称',
  `label` text DEFAULT NULL  COMMENT '教师标签',
  `t_json` text COMMENT '教师简介',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '教师id',
  `header` varchar(255) DEFAULT NULL COMMENT '教师头像',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `is_tui` int(11) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '教师改价额度',
  `already` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '教师已用额度',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='教师表';

#
# Structure for table "rh_tui"
#

DROP TABLE IF EXISTS `rh_tui`;
CREATE TABLE `rh_tui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `tui_num` varchar(30) DEFAULT NULL COMMENT '退款单号',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `order_num` varchar(40) NOT NULL COMMENT '订单号',
  `money` decimal(10,2) NOT NULL COMMENT '价钱',
  `message` varchar(255) NOT NULL COMMENT '信息',
  `ip` varchar(100) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0退款中1已退款2驳回中',
  `aid` int(11) NOT NULL DEFAULT '0',
  `wx_id` varchar(50) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `ucid` int(11) NOT NULL DEFAULT '3',
  `uid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='退货管理表';

#
# Structure for table "rh_tui_form"
#

DROP TABLE IF EXISTS `rh_tui_form`;
CREATE TABLE `rh_tui_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(15) DEFAULT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '家庭住址',
  `kids` varchar(20) DEFAULT NULL COMMENT '孩子',
  `sex` int(11) NOT NULL DEFAULT '0' COMMENT '性别',
  `age` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教师推广表单';

#
# Structure for table "rh_user"
#

DROP TABLE IF EXISTS `rh_user`;
CREATE TABLE `rh_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL,
  `openid_gzh` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL COMMENT '微信昵称',
  `headpic` varchar(255) DEFAULT NULL COMMENT '微信头像',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `project` int(11) NOT NULL DEFAULT '0' COMMENT '学科',
  `qrcode_xcx` varchar(255) DEFAULT NULL COMMENT '小程序分享码',
  `qrcode_gzh` varchar(255) DEFAULT NULL COMMENT 'H5分享码',
  `img` varchar(255) DEFAULT NULL COMMENT '真实头像',
  `fans` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `coach_time` varchar(255) NOT NULL DEFAULT '0小时' COMMENT '辅导时长',
  `rate` int(11) NOT NULL DEFAULT '5' COMMENT '综合评价',
  `job` int(11) NOT NULL DEFAULT '0' COMMENT '0普通用户1老师2家长',
  `unionid` varchar(255) DEFAULT NULL,
  `is_you` int(11) NOT NULL DEFAULT '0' COMMENT '优秀老师',
  `teacher_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '修改课程费用额度',
  `yj` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `backgroud` varchar(255) DEFAULT NULL COMMENT '推荐封面图',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `session_key` varchar(255) DEFAULT NULL,
  `invite_code` int(11) NOT NULL DEFAULT '0' COMMENT '身份码',
  `chird` varchar(255) DEFAULT NULL COMMENT '孩子',
  `bind_code` varchar(10) DEFAULT NULL COMMENT '绑定教师的code',
  `t_json` text COMMENT '教师简介',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

#
# Structure for table "rh_user_course"
#

DROP TABLE IF EXISTS `rh_user_course`;
CREATE TABLE `rh_user_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='学生课程表';

#
# Structure for table "rh_user_project"
#

DROP TABLE IF EXISTS `rh_user_project`;
CREATE TABLE `rh_user_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `label` int(11) NOT NULL DEFAULT '0' COMMENT '标签id',
  `tid` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=308 DEFAULT CHARSET=utf8mb4 COMMENT='用户标签表';

#
# Structure for table "rh_video"
#

DROP TABLE IF EXISTS `rh_video`;
CREATE TABLE `rh_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `ucid` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='视频表';
