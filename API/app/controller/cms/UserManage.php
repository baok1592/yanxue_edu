<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 9:46
 */

namespace app\controller\cms;


use app\model\ClassTeacher;
use think\facade\Log;
use app\model\CourseTeacher;
use ruhua\bases\BaseController;
use app\model\User as UserModel;
use app\model\BindTeacher as BindTeacherModel;
use ruhua\exceptions\BaseException;
use app\model\Experience as ExperienceModel;
use app\model\UserProject as UserProjectModel;
use app\model\Kids as KidsModel;
use app\model\CourseTeacher as CourseTeacherModel;
use app\model\Teacher as TeacherModel;

class UserManage extends BaseController
{
    /**教师号码绑定
     * @param $mobile
     */
    public function bind_mobile()
    {
        $data=input('post.');
        $mobile=$data['mobile'];
        $experience_data=$data['experience'];
        $experience_data['mobile']=$mobile;

        $user=UserModel::where(['mobile'=>$mobile])->find();
        if($user){
            $res=$user->save(['job'=>1]);
            $experience_data['uid']=$user['id'];
        }
        else{
            $bind=BindTeacherModel::where(['mobile'=>$mobile])->find();
            if($bind)
                throw new BaseException(['msg'=>'号码已绑定']);
            $res=BindTeacherModel::create(['mobile'=>$mobile]);
        }

        $experiences=ExperienceModel::where(['mobile'=>$mobile])->find();
        if($experiences)
            $experiences->save($experience_data);
        else
            ExperienceModel::create($experience_data);
        return app('json')->go($res);
    }

    /**获取用户信息
     * @param string $job
     * @return mixed
     */
    public function get_user($job="",$id="")
    {
      
        if($id!=""){
            $res=UserModel::with(['label.project'])->where('id',$id)->find();
            $course_ids=CourseTeacherModel::where('tid',$id)->column('course_id');
            $res['course']=\app\model\Course::with('img')->where(['id'=>$course_ids])->select();
            return app('json')->go($res);
        }
         
        if($job==""){
            $res=UserModel::with(['label.project','student','kids'])->select();
            foreach ($res as $k=>$v){
                if(!$v['student']&&count($v['kids'])>0){
                    $res[$k]['stu']=$v['kids'][0];
                }else{
                    $res[$k]['stu']=$v['student'];
                }

            }
        }
        else
            $res=UserModel::with(['label.project'])->where(['job'=>$job])->select();
        $course_ids=CourseTeacherModel::where('tid',$id)->column('course_id');
      
        $course=\app\model\Course::with('img')->where(['id'=>$course_ids])->select();
        $data['user']=$res;
        $data['course']=$course;
        return app('json')->go($data);
    }

    /**绑定教师标签
     * @return mixed
     */
    public function bind_project()
    {
        $data=input('post.');
        $uid=$data['uid'];
        $project=$data['project'];
        $dt=array();
        foreach ($project as $k=>$v)
        {
            $dt[$k]['uid']=$uid;
            $dt[$k]['label']=$v;
        }
        UserProjectModel::where(['uid'=>$uid])->delete();
        $res=(new UserProjectModel())->saveAll($dt);


        return app('json')->go($res);

    }


    /**
     * 更新资历信息
     */
    public function update_experience()
    {
        $data=input('post.');
        $ex=ExperienceModel::where('mobile',$data['mobile'])->find();
        if($ex){
            $res=$ex->save($data);
        }else{
            $res=ExperienceModel::create($data);
        }
        return app('json')->go($res);
    }

    public function cms_get_teacher($id="")
    {
        if($id=="")
        $res=TeacherModel::with(['user'=>function($query){
            $query->with(['label.project','experience','teacher']);
    },'labels.project'])->order('id desc')->select();
        else
            $res=TeacherModel::with(['user'=>function($query){
                $query->with(['label.project','experience','teacher']);
            },'labels.project'])->where('id',$id)->find();
        return app('json')->go($res);
    }

    /**设定用户为教师
     * @param $id
     */
    public function user_to_teacher()
    {
        $data=input('post.');
        if($data['id']!=""){
            $data['t_json']=json_encode( $data['t_json'],JSON_UNESCAPED_UNICODE);
            $res=TeacherModel::update($data,['id'=>$data['id']]);
        }
        else{
            $data['t_json']=json_encode( $data['t_json'],JSON_UNESCAPED_UNICODE);
            $res=TeacherModel::create($data);
        }

        if(isset($data['uid'])){
            if($data['uid']!=""){
                UserModel::update(['job'=>1],['id'=>$data['uid']]);

               // (new CourseTeacher())->add($data['label'],$data['uid']);
            }
        }

        if(isset($data['id']))
        foreach ($data['label'] as $k=>$v)
        {
            $course[$k]['tid']=$res['id'];
            $course[$k]['label']=$v;
            if(isset($data['id'])){
                $course[$k]['uid']=$data['id'];
                (new UserProjectModel())->where(['uid'=>$data['id']])->delete();
            }

            else{
                $course[$k]['uid']=0;

            }
        }
        (new UserProjectModel())->where(['tid'=>$res['id']])->delete();
        (new UserProjectModel())->saveAll($course);
        return app('json')->go($res);
    }


    public function del_teacher($id)
    {
        $teacher=TeacherModel::find($id);
        UserModel::update(['job'=>0],['id'=>$teacher['uid']]);
        $res=TeacherModel::destroy($id);

        return app('json')->go($res);
    }

    /**
     * 孩子绑定
     */
    public function bind_kids()
    {
        $data=input('post.');
        $res=KidsModel::create($data);
        return app('json')->go($res);
    }


    /**
     * 更新孩子信息
     */
    public function update_kids()
    {
        $data=input('post.');
        $res=KidsModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }


    /**删除孩子信息
     * @param $id
     */
    public function del_kids($id)
    {
        $res=KidsModel::destroy($id);
        return app('json')->go($res);
    }

    /**
     * 获取孩子信息
     */
    public function get_all_kids()
    {
        $res=KidsModel::with('per')->select();
        return app('json')->go($res);
    }


    /**
     * 获取未绑定的微信账号
     */
    public function get_no_bind_user()
    {
        $res=UserModel::with(['student','kids','teacher'])->where(['job'=>0])->select();
        $arr=array();
        foreach ($res as $k=>$v){
            if(!$v['student']&&count($v['kids'])==0&&!$v['teacher'])
                $arr[]=$v;

        }
        return app('json')->go($res);
    }
}