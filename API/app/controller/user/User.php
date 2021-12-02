<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/29 0029
 * Time: 9:16
 */

namespace app\controller\user;


use app\model\ClassTeacher;
use app\model\Plan;
use ruhua\bases\BaseController;
use ruhua\services\TokenService;
use app\model\UserProject as UserProkectModel;
use app\model\User as UserModel;
use app\model\Student as StudentModel;
use app\model\ClassStu as ClassStuModel;
use app\model\Classes as ClassesModel;
use app\model\Teacher as TeacherModel;
use app\model\Pingce as PingceModel;

class User extends BaseController
{
    public function get_infor()
    {
        $uid=TokenService::getCurrentUid();
        $user=UserModel::with('kids')->withoutfield('openid,openid_gzh,unionid,create_time,update_time,session_key')->find($uid);
        return app('json')->go($user);
    }

    public function get_teacher($project="",$id="")
    {

        if($id!=""){
            $res=TeacherModel::with(['labels.project','courses.course.img'])->find($id);
            return app('json')->go($res);
        }
        if($project==""){
            $res=TeacherModel::with('labels.project')->select();
        }else{
            $tid=UserProkectModel::where(['label'=>$project])->column('tid');
            $res=TeacherModel::with('labels.project')->where(['id'=>$tid])->select();

        }

        return app('json')->go($res);
    }


    /**
     * 普通用户切换角色
     */
    public function set_job($job,$chird="",$name="")
    {
        $uid=TokenService::getCurrentUid();
        $ujob=UserModel::where('id',$uid)->value('job');


        if($job==0)
            $data['job']=$job;
        else
            $data['job']=2;

        if($ujob==1){
            $data['job']=1;
        }
        $data['chird']=$chird;
        $data['name']=$name;
        $res=UserModel::update($data,['id'=>$uid]);
        return app('json')->go($res);
    }

    public function get_study_history($job=0)
    {
        if($job==0)
            return $this->stu_get_history();


    }



    private function stu_get_history()
    {
        $uid=TokenService::getCurrentUid();
        $sid=StudentModel::where(['uid'=>$uid])->value('id');
        $cids=ClassStuModel::where(['uid'=>$sid])->column('cid');
        $data=ClassesModel::with(['courses'=>function($query){
            $query->with(['teachers.teacher.user','img']);
        }])->where(['id'=>$cids])->withoutField('plan_date')->select();
        foreach ($data as $k=>$v){

            $data[$k]['start']=substr($v['start_time'],5,6);
            $data[$k]['end']=substr($v['end_time'],5,6);
        }

        return app('json')->go($data);
    }





    private function student_class()
    {

        $student_id=TokenService::getCurrentStuId();
        if(!$student_id)
            return null;
        $class_id=ClassStuModel::where(['uid'=>$student_id])->column('cid');
        $res=ClassesModel::where(['id'=>$class_id])->field('id,name')->select();
        return $res;
    }


    private function teacher_class()
    {
     //   $class=ClassesModel::field('id,name')->select();

        $tid=TokenService::getCurrentTid();
        $class_id=ClassTeacher::where(['tid'=>$tid])->column('cid');
        $class=ClassesModel::where(['id'=>$class_id])->field('id,name')->select();
        return $class;
    }

    /**家长获取班级
     * @return \think\Collection
     */
    private function person_class()
    {
        $uid=TokenService::getCurrentUid();
        $stu_ids=StudentModel::where(['person'=>$uid])->column('id');
        $class_stu=ClassStuModel::where(['uid'=>$stu_ids])->column('cid');
        $res=ClassesModel::where(['id'=>$class_stu])->field('id,name')->select();
        return $res;
    }




    /**
     * 获取测评数据
     */
    private function get_total_pc_data($sid,$class_id)
    {

        $data['chartData']=$this->get_chartData($sid,$class_id);
        $data['chartData2']=$this->get_chartData2($sid,$class_id);

        return app('json')->go($data);

    }

    /**获取单条评测数据
     * @param $sid
     */
    private function get_one_pc_data($sid,$class_id,$index)
    {
        $where['uid']=$sid;
        $where['class_id']=$class_id;
        $where['index']=$index;
        $hmbx=PingceModel::where($where)->value('hmbx');
        $cyxx=PingceModel::where($where)->value('cyxx');
        $scgz=PingceModel::where($where)->value('scgz');
        $qgbd=PingceModel::where($where)->value('qgbd');
        $hhjq=PingceModel::where($where)->value('hhjq');
        $zzl=PingceModel::where($where)->value('zzl');
        $chartData=[
            'categories'=>['创意想象','画面表现','色彩感知','情感表达','绘画技巧','专注力'],
            'series'=>[
                [
                    'name'=>'评分',
                    'data'=>[$cyxx,$hmbx,$scgz,$qgbd,$hhjq,$zzl]
                ]
            ]
        ];
        $data['chartData']=$chartData;
        $data['chartData2']=$this->get_chartData2($sid,$class_id,$index);
        return app('json')->go($data);


    }


    private function get_chartData2($sid,$class_id,$index="")
    {
        $where['uid']=$sid;
        $where['class_id']=$class_id;
        if($index!="")
            $where['index']=$index;
        $data=PingceModel::where($where)->select();
        $categories=array();
        $hmbx=array();
        $cyxx=array();
        $scgz=array();
        $qgbd=array();
        $hhjq=array();
        $zzl=array();
        foreach ($data as $k=>$v){
            $categories[]=$v['index']+1;
            $hmbx[]=$v['hmbx'];
            $cyxx[]=$v['cyxx'];
            $scgz[]=$v['scgz'];
            $qgbd[]=$v['qgbd'];
            $hhjq[]=$v['hhjq'];
            $zzl[]=$v['zzl'];
        }

        $chart_data=[
            'categories'=>$categories,
            'series'=>[
                [
                    'name'=>'创意想象',
                    'data'=>$cyxx
                ],
                [
                    'name'=>'画面表现',
                    'data'=>$hmbx
                ],
                [
                    'name'=>'色彩感知',
                    'data'=>$scgz
                ],
                [
                    'name'=>'情感表达',
                    'data'=>$qgbd
                ],
                [
                    'name'=>'绘画技巧',
                    'data'=>$hhjq
                ],
                [
                    'name'=>'专注力',
                    'data'=>$zzl
                ],
            ],

        ];
        return $chart_data;
    }

    /**获取图表诗句
     * @param $sid
     * @param $class_id
     * @return array
     */
    private function get_chartData($sid,$class_id)
    {

        $where['uid']=$sid;
        $where['class_id']=$class_id;
        $hmbx=PingceModel::where($where)->sum('hmbx');
        $cyxx=PingceModel::where($where)->sum('cyxx');
        $scgz=PingceModel::where($where)->sum('scgz');
        $qgbd=PingceModel::where($where)->sum('qgbd');
        $hhjq=PingceModel::where($where)->sum('hhjq');
        $zzl=PingceModel::where($where)->sum('zzl');
        $chartData=[
            'categories'=>['创意想象','画面表现','色彩感知','情感表达','绘画技巧','专注力'],
            'series'=>[
                [
                    'name'=>'评分',
                    'data'=>[$cyxx,$hmbx,$scgz,$qgbd,$hhjq,$zzl]
                ]
            ]
        ];
        return $chartData;
    }

    public function get_plan()
    {
        $plan=ClassesModel::with(['teachers.tea','coursed.pro'])->select();
        $res=array();
        foreach ($plan as $k=>$v){
            if($v['plan_date']){
                foreach ($v['plan_date'] as $key=>$value){
                    $dt=[
                        'date'=>$value,
                        'teacher'=>$v['teachers'],
                        'project'=>$v['coursed'],
                        'index'=>$key,
                        'class_id'=>$v['id'],
                        'class_name'=>$v['name']
                    ];

                    $res[]=$dt;
                }
            }

        }
        return app('json')->go($res);
    }

    public function update_infor()
    {
        $data=input('post.');
        $uid=TokenService::getCurrentUid();
        $res=UserModel::update(['nickname'=>$data['nickname'],'headpic'=>$data['headpic']],['id'=>$uid]);
        return app('json')->go($res);
    }







}