<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 9:57
 */

namespace app\controller\user;


use app\model\Admin;
use app\model\ClassTeacher;
use app\model\Plan;
use app\service\ValidataService;
use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;
use app\model\Course as CourseModel;
use app\model\Order as OrderModel;
use app\model\User as UserModel;
use app\model\ClassTeacher as ClassTeacherModel;
use app\model\Plan as PlanModel;
use app\model\ClassStu as ClassStuModel;
use app\model\Student as StudentModel;
use app\model\Message as MessageModel;
use app\model\Pingce as PingceModel;
use app\model\Classes as ClassesModel;
use think\facade\Filesystem;
use think\facade\Log;

class Teacher extends BaseController
{
    /**
     * 教师获取数据统计
     */
    public function get_static_data()
    {
        $uid=TokenService::getCurrentUid();
        $course_ids=CourseModel::where(['teacher'=>$uid])->column('id');
        $where=['course_id'=>$course_ids,'pay_statement'=>1];

        $sum_order=OrderModel::where($where)->count();  //支付订单总数
        $total_price=OrderModel::where($where)->sum('price');
        $bind=0;
        $yj=UserModel::where(['id'=>$uid])->value('yj');
        $data=[
            'sum_order'=>$sum_order,
            'total_price'=>$total_price,
            'bind'=>$bind,
            'yj'=>$yj
        ];
        return app('json')->go($data);
    }

    /**
     * 教师查看自己课程
     */
    public function get_t_course()
    {
        $uid=TokenService::getCurrentUid();
        $course=ClassTeacherModel::with(['course.img','classes'])->where('tid',$uid)->select();
        return app('json')->go($course);
    }









    /**
     * 教师获取学生请假信息
     */
    public function get_stu_leave($type="")
    {
        $res=MessageModel::with(['user.student','student'])->where(['type'=>0])->order('read asc')->select();
        if($type!=""){
            $dt['data']=0;

            if($res){

                foreach ($res as $k=>$v){
                    if($v['read']==0){

                        $dt['data']=1;
                        break;
                    }
                }
            }
            $res=$dt;
        }

        return app('json')->go($res);
    }







}