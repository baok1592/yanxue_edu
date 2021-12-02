<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 9:46
 */

namespace app\controller\cms;


use app\service\ValidataService;
use ruhua\bases\BaseController;
use app\model\Student as StudentModel;
use app\model\ClassStu as ClassStuModel;
use ruhua\exceptions\BaseException;
use app\model\Classes as ClassesModel;
use app\model\User as UserModel;
use app\model\Msg as MsgModel;
use app\model\StuLabel as StuLabelModel;
use think\facade\Log;


class Student extends BaseController
{
    /**
     * 录入学生信息
     */
    public function add_student()
    {
        $data=input('post.');
        (new ValidataService())->studentValidata($data);
        $res=StudentModel::create($data);
        return app('json')->go($res);
    }

    /**
     * 修改学生信息
     */
    public function update()
    {
        $data=input('post.');
        (new ValidataService())->studentValidata($data);
        $res=StudentModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**
     * 查看学生信息
     */
    public function get_student($id="",$uid="On")
    {

        if($id==""){
            $res=StudentModel::with(['wx','persons','classesstu.classname'])->order('id desc')->select();
            foreach ($res as $k=>$v)
            {
                $res[$k]['labels']=StuLabelModel::where(['id'=>$v['label']])->select();
            }
        }
        else{
            $res=StudentModel::with(['wx','persons','classesstu.classname'])->find($id);
            $res['labels']=StuLabelModel::where(['id'=>$res['label']])->select();
        }

        if($uid=="0"){
            $res=StudentModel::with(['wx','persons','classesstu.classname'])->where(['uid'=>0])->select();
        }



        return app('json')->go($res);
    }


    /**学生分班
     * @param $uid
     * @param $cid
     */
    public function set_class($uid,$cid)
    {
        $data=[
            'cid'=>$cid,
            'uid'=>$uid
        ];
      StudentModel::Check($uid);
        ClassesModel::Check($cid);
        $class=ClassStuModel::where($data)->find();
        if($class)
            throw new BaseException(['msg'=>'学生已在该班级']);
        $res=ClassStuModel::create($data);

        return app('json')->go($res);
    }




    public function bind_student($uid,$wx_id,$job)
    {
        $student=StudentModel::Check($uid);

        UserModel::Check($wx_id);
        UserModel::check_bind($wx_id);
        if($job==0){
            if($student['uid']>0)
                throw new BaseException(['msg'=>'学生已被绑定过']);
            $res=StudentModel::update(['uid'=>$wx_id],['id'=>$uid]);
        }
        else{
            $res=StudentModel::update(['person'=>$wx_id],['id'=>$uid]);
        }

        return app('json')->go($res);
    }

    public function search_stu_label()
    {
        $label=input('post.label');
        $student=StudentModel::with(['wx','persons','classesstu.classname'])->select();
        foreach ($student as $k=>$v)
        {
            $student[$k]['labels']=StuLabelModel::where(['id'=>$v['label']])->select();
        }
        $arr=array();
        $i=0;
            foreach ($student as $k=>$v){
                $stu_label=$v['label'];

                if($stu_label!=null)
                    foreach ($label as $key=>$value){
                        if(in_array($value,$stu_label)){
                            $arr[$i++]=$v;
                            break;
                        }

                    }
            }
        return app('json')->go($arr);
    }

    public function del_student($id)
    {
        $res=StudentModel::destroy($id);
        return app('json')->go($res);
    }


    public function get_one_stu($id)
    {
        $res=StudentModel::with(['msg','classesstu.classes','persons'])->find($id);
        $res['labels']=StuLabelModel::where(['id'=>$res['label']])->select();

        $arr=array();

      foreach ($res['classesstu'] as $k=>$v){
           if($v['classes']!=null){

               $arr[]=$v;
           }

       }
       unset($res['classesstu']);
       $res['classesstu']=$arr;
        return app('json')->go($res);
    }

}