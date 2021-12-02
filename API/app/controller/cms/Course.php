<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 10:39
 */

namespace app\controller\cms;


use app\model\CourseTeacher;
use app\model\PtGoods;
use app\service\ValidataService;
use ruhua\bases\BaseController;
use app\model\Course as CourseModel;
use ruhua\exceptions\BaseException;
use app\model\Project as ProjectModel;
use app\model\User as UserModel;
use app\model\CourseTeacher as CourseTeacherModel;

class Course extends BaseController
{

    /**添加视频文章
     * @return mixed
     */
    public function add_course()
    {
        $data=input('post.');
        (new ValidataService())->courseValidata($data);
        $teacher=$data['teacher'];
        $res=CourseModel::create($data);
        $arr=array();
        foreach ($teacher as $k=>$v){
            $arr[]=[
                'course_id'=>$res['id'],
                'tid'=>$v
            ];
        }
        (new CourseTeacherModel())->saveAll($arr);
        return app('json')->go($res);
    }

    /**编辑视频文章
     * @return mixed
     */
    public function edit_course()
    {
        $data=input('post.');
        (new ValidataService())->courseValidata($data);
        $res=CourseModel::update($data,['id'=>$data['id']]);
        CourseTeacher::where(['course_id'=>$data['id']])->delete();
        $teacher=$data['teacher'];
        $arr=array();
        foreach ($teacher as $k=>$v){
            $arr[]=[
                'course_id'=>$res['id'],
                'tid'=>$v
            ];
        }
        (new CourseTeacherModel())->saveAll($arr);
        return app('json')->go($res);
    }

    /**删除视频文章
     * @param $id
     * @return mixed
     */
    public function del_course($id)
    {
        $res=CourseModel::destroy($id);
        CourseTeacher::where(['course_id'=>$id])->delete();
        return app('json')->go($res);
    }

    public function cms_get_course($id="")
    {
        if($id==""){
            $res=CourseModel::with(['pro','teachers.teacher','video','img'])->order('id desc')->select();
            foreach ($res as $k=>$v){
                $teachers=$v['teachers'];
                $arr=[];
                foreach ($teachers as $key=>$val){
                    $arr[]=$val['teacher']['name'];
                }
                $res[$k]['teacher_name']=$arr;
            }
        }
        else{
            $res=CourseModel::with(['pro','teachers','video','img'])->find($id);
             $teachers=$res['teachers'];
        $arr=array();
        foreach ($teachers as $k=>$v){
            $arr[]=$v['tid'];
        }
        unset($res['teacher']);
        $res['teacher']=$arr;
        }
        return app('json')->go($res);
    }


    public function get_course($id="",$project="",$is_tui="")
    {
        if($is_tui!=""){
            $res=CourseModel::with(['pro.chird','teachers.teacher','img','video'])->where('is_tui',1)->select();
            return  app('json')->go($res);
        }
        if($project!=""){
            $pro=ProjectModel::find($project);
            $res=CourseModel::with(['pro.chird','teachers.teacher','img','video'])->where('project',$project)->select();
          /*  if($pro['pid']==0){
                $ids=ProjectModel::where(['pid'=>$project])->column('id');
                $res=CourseModel::with(['pro.chird','teachers.teacher','img','video'])->where(['project'=>$ids])->order('id desc')->select();
            }else{
                $res=CourseModel::with(['pro.chird','teachers.teacher','img','video'])->where('project',$project)->select();
            }*/
            return app('json')->go($res);
        }
        if($id==""){
            $res=CourseModel::with(['pro.chird','teachers.teacher','img','video'])->select();
        }
        else{
            $res=CourseModel::with(['pro','teachers.teacher','img','video'])->find($id);
        }
        return app('json')->go($res);
    }

    /**
     * 教师关联课程
     */
    public function set_teacher_course($uid,$cid)
    {
        UserModel::Check($uid);
        CourseModel::Check($cid);
        $data=[
            'course_id'=>$cid,
            'tid'=>$uid
        ];
       $course=CourseTeacherModel::where($data)->find();
       if($course)
           throw new BaseException(['msg'=>'已绑定过']);
       $res=CourseTeacher::create($data);
       return app('json')->go($res);
    }

    public function get_no_active_goods()
    {
        $ids=PtGoods::column('goods_id');
        $goods=CourseModel::with('img')->where('id','not in',$ids)->select();
        return app('json')->go($goods);
    }
}