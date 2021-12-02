<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 9:58
 */

namespace app\controller\cms;


use app\model\Plan;
use ruhua\bases\BaseController;
use app\model\Classes as ClasessModel;
use ruhua\exceptions\BaseException;
use app\model\ClassStu as ClassStuModel;
use app\model\ClassProject as ClassProjectModel;
use app\model\ClassTeacher as ClassTeacherModel;
use ruhua\services\TokenService;
use think\facade\Db;
use app\model\Student as StudentModel;
use app\model\Course as CourseModel;
use app\model\Msg as MsgModel;
use app\model\Plan as PlanModel;
use app\model\Pingce as PingceModel;

class Classes extends BaseController
{
    /**
     * 添加班级
     */
    public function add_class()
    {
        $data=input('post.');
        $msgs="";


        Db::startTrans();// 启动事务
        try{
        $class=ClasessModel::where(['name'=>$data['name']])->find();

        if($class){
            $msgs="班级名称重复";
            throw new BaseException(['msg'=>'班级名称重复']);
        }

        $create=[
            'name'=>$data['name'],
            'start_time'=>$data['start_time'],
            'end_time'=>$data['end_time'],
            'course'=>$data['course'],
            'classroom'=>$data['classroom'],
            'num'=>$data['num']
        ];
        $course=CourseModel::with('pro')->where(['id'=>$data['course']])->find();
        $total=$course['pro']['count'];
        if(count($data['student'])>$total){
            $msgs="超过学生人数上限";
            throw new BaseException(['msg'=>"超过学生人数上限"]);
        }

        $res=ClasessModel::create($create);
        $class_teacher=array();
        foreach ($data['teacher'] as $k=>$v){
            $class_teacher[$k]['tid']=$v;
            $class_teacher[$k]['cid']=$res['id'];
            $class_teacher[$k]['course_id']=$data['course'];
        }
        (new ClassTeacherModel())->saveAll($class_teacher);
        $class_student=array();
        foreach ($data['student'] as $k=>$v){
            $class_student[$k]['uid']=$v;
            $class_student[$k]['cid']=$res['id'];
        }
        (new ClassStuModel())->saveAll($class_student);
        $student=StudentModel::where(['id'=>$data['student']])->select();
        $msg=array();
        foreach ($student as $k=>$v){
            $dt=[
                'uid'=>$v['id'],
                'type'=>3,
                'content'=>"{$v['name']} 加入{$data['name']}"
            ];
            $msg[]=$dt;
        }

        (new MsgModel())->saveAll($msg);
            Db::commit();
        }catch (\Exception $e){
            Db::rollback(); // 回滚事务
            throw new BaseException(['msg'=>$msgs]);

        }
        return app('json')->go($res);
    }

    /**编辑班级
     * @param $id
     * @param $name
     * @return mixed
     */
    public function edit_classes()
    {
        $msg="";

        Db::startTrans();// 启动事务
        try {
            $data = input('post.');
            $class = ClasessModel::where(['id' => $data['id']])->find();
            $course=CourseModel::with('pro')->where(['id'=>$data['course']])->find();
            $total=$course['pro']['count'];

            $students=ClassStuModel::where(['cid'=>$data['id']])->count();
            if(($students+count($data['student']))>$total){
                $msg='学生人数超过上限'.$total;
                    throw new BaseException(['msg'=>$msg]);
            }

            $create = [
                'name' => $data['name'],
                'start_time' => $data['start_time'],
                'end_time' => $data['end_time'],
                'course' => $data['course'],
                'classroom' => $data['classroom'],
                'num'=>$data['num']
            ];
            $res = $class->save($create);
            ClassTeacherModel::where(['cid' => $data['id']])->delete();
            $class_teacher = array();

            foreach ($data['teacher'] as $k => $v) {
                $class_teacher[$k]['tid'] = $v;
                $class_teacher[$k]['cid'] = $data['id'];
                $class_teacher[$k]['course_id'] = $data['course'];
            }
            (new ClassTeacherModel())->saveAll($class_teacher);
            $class_student = array();
            $classstuModel=new ClassStuModel();


            foreach ($data['student'] as $k => $v) {
                $student=$classstuModel->where(['uid'=>$v,'cid'=>$data['id']])->find();
                if($student){
                    $msg="有学生已在该班级";
                    throw new BaseException(['msg'=>'有学生已在该班级']);
                }

                $class_student[$k]['uid'] = $v;
                $class_student[$k]['cid'] = $data['id'];

            }

            (new ClassStuModel())->saveAll($class_student);

            Db::commit();
        }catch (\Exception $e){
            Db::rollback(); // 回滚事务
            throw new BaseException(['msg' => $e->getMessage().$msg]);

        }

       // $res=ClasessModel::update(['name'=>$name],['id'=>$id]);
        return app('json')->go($res);
    }





    /**删除班级
     * @param $id
     * @return mixed
     * @throws BaseException
     */
    public function del_classes($id)
    {
        $stu=ClassStuModel::where(['cid'=>$id])->column('id');
        if($stu)
            ClassStuModel::where(['id'=>$stu])->delete();
        $res=ClasessModel::destroy($id);
        ClassProjectModel::where(['cid'=>$id])->delete();
        return app('json')->go($res);
    }

    /**cms获取班级信息
     * @param string $id
     * @return mixed
     */
    public function cms_get_class($id="")
    {
        $tid=TokenService::getCurrentTid();
        $aid=TokenService::getCurrentAId();
        if($tid>0&&$aid>1)
            $cids=ClassTeacherModel::where(['tid'=>$tid])->column('cid');
        else
            $cids=ClasessModel::column('id');

        if($id==""){
            if($tid==0)
                $res=ClasessModel::with(['classstu.stu','project','teacher.tea','coursed.pro'])->order('id desc')->select();
            else
                $res=ClasessModel::with(['classstu.stu','project','teacher.tea','coursed.pro'])->where(['id'=>$cids])->order('id desc')->select();
            foreach ($res as $k=>$v){
                $teachers=$v['teacher'];
                $arr=[];
                foreach ($teachers as $key=>$val){
                    $arr[]=$val['tea']['name'];

                }
                $res[$k]['teacher_name']=$arr;
                $res[$k]['course_count']=$v['coursed']['pro']['count'];
                unset($res[$k]['coursed']);
            }
        }
        else{
            $pc=PingceModel::where(['class_id'=>$id])->column('index');
            $res=ClasessModel::with(['classstu.stu','project','teacher.tea','plans'])->find($id);
            $plan_data=array();

                foreach ($res['plan_date'] as $k=>$v){
                    $dt=[];
                    $dt['time']=$v;
                    if(in_array($k,$pc))
                        $dt['is_pc']=1;
                    else
                        $dt['is_pc']=0;
                    foreach ($res['plans'] as $key=>$val){

                        if($val['index']==$k){
                            $dt['plan']=$val;
                            break;
                        }else{
                            $dt['plan']=null;
                        }


                    }
                    $plan_data[]=$dt;
                }

                $res['plan_data']=$plan_data;



            $reg[0]=$res;
            $res=$reg;
        }
        foreach ($res as $key=>$v){
            $res[$key]['total_stu']=count($v['classstu']);
            $res[$key]['week']=$this->date_to_week($v['plan_date']);
            $res[$key]['total_tea']=count($v['teacher']);
            $tid=array();
            foreach ($v['teacher'] as $k=>$v){
                $tid[$k]=$v['tid'];
            }
            $res[$key]['tid']=$tid;
        }
        if($id!="")
            $res=$res[0];
        return app('json')->go($res);
    }


    /**设置课程日期
     * @return mixed
     */
    public function set_plan_date()
    {
        $post=input('post.');
        $classes=ClasessModel::find($post['id']);
        $plan=$classes['plan_date'];
        $plan[$post['index']]=$post['date'];
        $res=ClasessModel::update(['plan_date'=>$plan],['id'=>$post['id']]);
        return app('json')->go($res);
    }

    /**前端获取班级信息
     * @return mixed
     */
    public function get_class($id="")
    {
        $res=ClasessModel::with(['classstu.stu','project','teacher.tea','coursed.pro','plans'])->select();
        if($id!="")
            $res=ClasessModel::with(['classstu.stu','project','teacher.tea','coursed.pro','plans'])->find($id);
        return app('json')->go($res);
    }

    public function date_to_week($data)
    {
        $week=array();
        if($data!=null)
        foreach ($data as $k=>$v){
            if($k>6)
                break;
            if(!in_array((int)date("w",strtotime($v)),$week))
                $week[$k]=(int)date("w",strtotime($v));
        }
        return $week;
    }
}