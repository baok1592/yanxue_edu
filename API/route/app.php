<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;





Route::any('ue_uploads', 'common.Common/ue_uploads');

Route::get('', function () {
    echo '培训课程系统'.VAE_VERSION.'(开发版)';
});
//系统安装
Route::group('install', function () {
    Route::get('', 'install.Index/step1');
    Route::get('step2', 'install.Index/step2');
    Route::get('step3', 'install.Index/step3');
    Route::post('create_data', 'install.Index/createData');
});


//管理员Admins
Route::group('admins', function(){
   Route::get('get_index_data', 'cms.Admin/getCmsIndexData');//获取首页数据
  //  Route::post('get_table', 'cms.Admin/getTableData');//获取首页图表数据
    Route::get('/get_admin_all', 'cms.Admin/getAdmin_all');   //获取管理员
    Route::post('/createAdmin', 'cms.Admin/add_admin');   //添加管理员
    Route::put('/deleteAdmin', 'cms.Admin/del_admin');   //删除管理员
    Route::post('/update_admin', 'cms.Admin/up_admin');   //更新管理员
})->middleware('CheckCms');


/**
 * 微信
 */
Route::group('weixin',function () {
    // Route::post('get_xcx_token','user.Xcx/XcxLogin');//微信登录获取token
   // Route::post('upinfo', 'user.Xcx/xcx_upinfo');   //更新用户昵称、头像
    Route::get('gzh_code','user.Auth/getcode');//公众号获取code
    Route::get('get_gzh_token','user.Auth/gzhLogin');//公众登录获取token
});





//公用设置
Route::group('common', function () {
    Route::get('get_plan_id', 'user.User/get_plan_id');//修改开关按钮
    Route::group('', function () {
        Route::post('cms_set_state', 'common.Common/cms_set_state');//修改开关按钮

    })->middleware('CheckCms');

    Route::get('get_index_data', 'common.Common/get_index_data');//获取首页推荐数据
    Route::get('gj', 'common.Gj/main');//题目改卷
    Route::get('search_item', 'common.Gj/search_main');//拍照搜题
    Route::get('get_sys', 'common.Common/get_sys');//前端获取配置信息
    Route::get('get_xcx_code', 'common.Common/get_xcx_code');//前端获取小程序码
    Route::put('message_read', 'common.Common/message_read');//教师阅读
});


//权限
Route::group('auth', function () {
    Route::post('getXcxToken', 'user.Auth/getXcxToken');//小程序登录获取token
    Route::post('xcx_upinfo', 'user.Auth/xcx_upinfo');//用户更新个人信息
    Route::post('bindwWxMobile', 'user.Auth/bindwWxMobile');//绑定微信手机号码
    Route::post('check_token', 'user.Auth/is_token');//验证token是否过期
});
//管理员
Route::group('cms', function () {
    Route::post('login', 'cms.Admin/login');//管理员登录

    Route::group('', function () {
        Route::post('edit_psw', 'cms.Admin/edit_psw');//管理员修改密码
        Route::get('get_config', 'cms.Sysconfig/get_config');//管理员获取配置文件
        Route::post('update_sys', 'cms.Sysconfig/update_sys');//修改配置文件
    })->middleware('CheckCms');

});
//关于--更新
Route::group('gy', function () {
    Route::get('ys', 'cms.SetYsFw/getYs');//获取隐私政策相关信息
    Route::get('fw', 'cms.SetYsFw/getFw');//获取服务相关信息

    Route::group('', function () {
        Route::post('update_ys', 'cms.SetYsFw/updateYs');//上传隐私政策相关信息
        Route::post('update_Fw', 'cms.SetYsFw/updateFw');//上传服务相关信息
    })->middleware('CheckCms');
});







//日志
Route::group('msg', function () {
    Route::get('get_msg', 'cms.Msg/get_msg');//获取日志信息
    Route::get('get_change_msg', 'cms.Msg/get_change_msg');//获取换班日志

});


//学生标签
Route::group('label', function () {
    Route::put('add_label', 'cms.Label/add_label');//添加学生标签
    Route::put('update_label', 'cms.Label/update_label');//更新学生标签
    Route::delete('delete_label', 'cms.Label/delete_label');//删除学生标签
    Route::get('get_label', 'cms.Label/get_label');//获取学生标签

})->middleware('CheckCms');







//学生
Route::group('student', function () {
    Route::group('', function () {
        Route::post('add_student', 'cms.Student/add_student');//添加学生
        Route::put('set_class', 'cms.Student/set_class');//设置学生分班情况
        Route::put('bind_student', 'cms.Student/bind_student');//绑定学生信息
        Route::delete('del_student', 'cms.Student/del_student');//删除学生
        Route::post('update_student', 'cms.Student/update');//删除学生

    })->middleware('CheckCms');

    Route::get('get_one_stu', 'cms.Student/get_one_stu');//获取单个学生信息
    Route::get('get_student', 'cms.Student/get_student');//获取学生信息
    Route::post('search_stu_label', 'cms.Student/search_stu_label');//标签查询学生
});


//留言
Route::group('message', function () {
    Route::post('add_message', 'common.Message/add_message');//添加留言
    Route::delete('user_del_message', 'common.Message/user_del_message');//用户删除留言
    Route::get('user_get_message', 'common.Message/user_get_message');//用户查看请假内容
    Route::get('cms_get_message', 'common.Message/cms_get_message');//管理员获取请假信息
    Route::delete('del_message', 'common.Message/del_message');//cms删除留言信息
});



//视频文章管理
Route::group('course', function () {
    Route::post('add_course', 'cms.Course/add_course');//添加视频文章
    Route::post('edit_course', 'cms.Course/edit_course');//编辑视频文章
    Route::delete('del_course', 'cms.Course/del_course');//删除视频文章
    Route::put('set_teacher_course', 'cms.Course/set_teacher_course');//教师绑定课程

    Route::get('get_course', 'cms.Course/get_course');//获取课程文章
    Route::get('search_course', 'common.Common/search_course');//文章搜索
    Route::get('cms_get_course', 'cms.Course/cms_get_course');//cms获取视频文章
    Route::get('t_get_course', 'User.Course/t_get_course');//教师获取课程文章
    Route::get('get_t_course', 'User.Teacher/get_t_course');//教师查看发布课程
    Route::get('get_no_active_goods', 'cms.Course/get_no_active_goods');//获取未参加活动的商品

});



//课程管理
Route::group('project', function () {
    Route::group('', function () {
        Route::post('add_project', 'cms.Project/add_project');//添加课程
        Route::post('edit_project', 'cms.Project/edit_project');//编辑课程
        Route::delete('del_project', 'cms.Project/del_project');//删除课程
    })->middleware('CheckCms');

    Route::get('get_project', 'cms.Project/get_project');//获取所有课程


});



//班级管理
Route::group('class', function () {
    Route::group('', function () {
        Route::post('add_class', 'cms.Classes/add_class');//添加班级
        Route::post('edit_classes', 'cms.Classes/edit_classes');//编辑班级
        Route::delete('del_classes', 'cms.Classes/del_classes');//删除班级
        Route::post('set_plan_date', 'cms.Classes/set_plan_date');//更改课时

    })->middleware('CheckCms');
    Route::get('get_class', 'cms.Classes/get_class');//前端获取班级信息
    Route::get('cms_get_class', 'cms.Classes/cms_get_class');//cms获取班级信息



});

//用户
Route::group('user', function () {
    Route::post('update_infor', 'user.User/update_infor');//更新用户信息
    Route::post('bind_mobile', 'cms.UserManage/bind_mobile');//教师号码绑定
    Route::post('update_experience', 'cms.UserManage/update_experience');//更新教师资历信息
    Route::post('bind_project', 'cms.UserManage/bind_project');//绑定教师标签
    Route::post('user_to_teacher', 'cms.UserManage/user_to_teacher');//设定用户为教师
    Route::get('get_infor', 'user.User/get_infor');//获取用户个人信息
    Route::get('get_user', 'cms.UserManage/get_user');//获取用户信息
    Route::get('get_teacher', 'user.User/get_teacher');//获取老师信息
    Route::put('set_job', 'user.User/set_job');//切换角色
    Route::post('bind_kids', 'cms.UserManage/bind_kids');//绑定孩子给家长
    Route::post('update_kids', 'cms.UserManage/update_kids');//更新孩子信息
    Route::delete('del_kids', 'cms.UserManage/del_kids');//删除孩子信息
    Route::get('get_all_kids', 'cms.UserManage/get_all_kids');//获取孩子的所有信息
    Route::get('get_study_history', 'user.User/get_study_history');//获取学习足迹
    Route::get('cms_get_teacher', 'cms.UserManage/cms_get_teacher');//获取学习足迹
    Route::delete('del_teacher', 'cms.UserManage/del_teacher');//删除教师
    Route::get('get_no_bind_user', 'cms.UserManage/get_no_bind_user');//获取未绑定的微信
    Route::get('get_static_data', 'user.Teacher/get_static_data');//教师获取数据统计
    Route::get('get_stu_leave', 'user.Teacher/get_stu_leave');//教师获取学生请假信息
});


//图片管理
Route::group('image', function () {
    Route::post('upload_img', 'cms.Image/upload_img');//图片上传
    Route::get('get_all_image', 'cms.Image/get_all_image');//获取全部图片
    Route::post('delete_img', 'cms.Image/delete_img');//删除图片
});

//数据库操作
Route::group('sql',function (){
    Route::get('backup','cms.Backup/data_backup');//数据库备份
    Route::get('backup_list','cms.Backup/backup_list');//备份文件列表
    Route::get('restore','cms.Backup/data_restore');//数据库还原
    Route::delete('delete','cms.Backup/delete');//删除备份文件
    Route::get('download','cms.Backup/downloadFile');//下载备份文件
})->middleware('CheckCms');

//视频管理
Route::group('video', function () {
    Route::post('upload_video', 'cms.Video/upload_video');//视频上传
    Route::get('get_all_video', 'cms.Video/get_all_video');//获取全部视频
    Route::post('delete_video', 'cms.Video/delete_video');//删除视频
});

//轮播图管理
Route::group('banner', function () {
    Route::group('',function (){
        Route::post('add_banner', 'common.Banner/add_banner');//添加轮播图
        Route::post('edit_banner', 'common.Banner/edit_banner');//编辑轮播图
        Route::post('set_sort', 'common.Banner/set_sort');//排序
        Route::delete('del_banner', 'common.Banner/del_banner');//删除轮播图
    })->middleware('CheckCms');

    Route::get('get_banner', 'common.Banner/get_banner');//获取全部轮播图
});

//文章管理
Route::group('article', function () {
    Route::group('',function (){
        Route::post('add_article', 'cms.Article/add_article');//添加文章
        Route::post('edit_article', 'cms.Article/edit_article');//编辑文章
        Route::delete('del_article', 'cms.Article/del_article');//删除文章
        Route::post('recieve_article', 'cms.Article/recieve_article');//恢复被删除文章
        Route::get('get_delete_article', 'cms.Article/get_delete_article');//获取删除文章
    })->middleware('CheckCms');
    Route::get('get_article', 'cms.Article/get_article');//获取所有文章
});

//视频管理
Route::group('star', function () {
    Route::post('add_task', 'cms.Star/add_task');//添加助力活动
    Route::post('update_task', 'cms.Star/update_task');//修改助力活动
    Route::delete('del_task', 'cms.Star/del_task');//删除助力活动
    Route::get('get_task', 'cms.Star/get_task');//获取助力任务

    Route::put('create_order', 'cms.Star/create_order');//创建助力任务
    Route::put('set_star_order', 'cms.Star/set_star_order');//邀请助力
    Route::get('get_all_order', 'cms.Star/get_all_order');//获取所有助力任务
    Route::get('user_get_order', 'cms.Star/user_get_order');//用户获取自己助力任务
});




Route::group('card', function () {
    Route::get('get_card', 'cms.CardNumber/rand');//获取随机数
});

//页面主题
Route::group('zt',function (){
    Route::post('up_page','cms.Sortable/updatePage');//修改 page_
    Route::post('up_zt','cms.Sortable/upZt');//修改页面主题
    Route::delete('del_sor','cms.Sortable/delSor');//删除
    Route::post('add_sor','cms.Sortable/addSor');//修改页面主题
})->middleware('CheckCms');
//页面主题
Route::group('zt',function (){
    Route::get('get_all','cms.Sortable/getAll')->middleware('CheckCms');//获取所有
    Route::post('up_sor','cms.Sortable/updateSortable');//修改 sortable
    Route::get('get_zt','cms.Sortable/getZt');//获取页面主题
});


//分类Category
Route::group('category', function(){

    Route::group('',function (){
        Route::get('get_one_category', 'cms.Category/getCategory'); //获取栏目详情
    });
    //管理员
    Route::group('admin', function(){
        Route::get('/get_category_all', 'cms.Category/get_categorySort'); //获取所有栏目并排好序，包括隐藏
        Route::put('/delete_category', 'cms.Category/del_category'); //删除栏目
        Route::get('get_one_category', 'cms.Category/getCategory'); //获取栏目详情
        Route::post('/update_category', 'cms.Category/up_category'); //更新栏目
        Route::post('/create_category', 'cms.Category/add_category'); //新增栏目
        Route::post('/update_category_sort', 'cms.Category/up_category_sort'); //更新栏目排序
        Route::post('/article_category', 'cms.Category/article_category_list'); //获取发文章的所有栏目

    })->middleware('CheckCms');
});


//手机版
Route::group('phone', function(){
    //公共
    Route::group('', function(){

    });
    //获取首页数据
    Route::group('index',function (){
        Route::get('get_nav', 'cms.Category/get_categorySort');   //获取导航栏
    });

});


// sortable
Route::post('set_data', 'cms.Index/setData');
Route::get('get_data', 'cms.Index/getData');
Route::post('update_data', 'cms.Index/updateData');
//Route::post('set_page', 'cms.Index/setPage');
Route::post('set_theme', 'cms.Index/setTheme');
Route::get('get_theme', 'cms.Index/getTheme');


// 手机sortable
Route::get('get_page_type','cms.sortable/getPageType');
Route::post('set_page','cms.sortable/setPage');
Route::get('get_one_Page','cms.sortable/getOnePage');
Route::post('save','cms.sortable/save');
Route::post('save_one_page','cms.sortable/saveOnePage');
Route::post('delete_one_page','cms.sortable/deleteOnePage');