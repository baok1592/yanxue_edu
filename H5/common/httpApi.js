/**
 * API接口配置文件
 */
module.exports = {
	home : {
		get_banner:"banner/get_banner", // 首页banner 
		get_category:"phone/index/get_nav",	//获取首页nav
		get_shop:"course/get_course",		//获取
	},
	article:{
		get_article:"article/get_article",   //获取单个文章
	},
	course:{
		get_course:"course/get_course",	//获取课程
		get_project:"project/get_project", //获取课程分类
	},
	plan:{
		get_class:"plan/job_get_class",		//获取班级
		get_plan:"plan/get_stu_plan",			//获取某个班的学习计划
		get_plan_id:"common/get_plan_id", 		//获取某个学习计划的内容
	},
	teacher:{
		get_teacher:"user/get_teacher",		//获取教师列表
	},
	teacherCms:{
		get_data:"user/get_static_data",	//教师获取佣金信息
		get_leave:"user/get_stu_leave",		//教师获取请假信息
		get_vacate:"user/get_stu_leave",	//教师获取请假列表
		look_vacate:"common/message_read",	//教师查看请假
		get_order:"order/t_get_order",		//用户获取订单
		up_order:"order/t_update_price",	//教师优惠订单价格
	},
	user:{
		get_info:"user/get_infor",	//获取个人信息
		up_info:"user/set_job",		//更新个人信息
		get_vacate:"message/user_get_message",		//用户查看请假信息
		get_order:"order/get_my_order",				//获取个人订单
		add_vacate:"message/add_message",			//用户请假
		get_code:"common/get_xcx_code",		//用户获取小程序二维码
	},
	order:{
		get_order:"order/get_my_order",	//获取订单
		del_order:"order/del_order",	//删除订单
		tui_order:"order/tui_order",	//退款
		get_tui:"order/cms/get_tui",	//获取退款
	}
}

 