<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 10:18
 */

namespace app\controller\cms;


use app\service\ValidataService;
use ruhua\bases\BaseController;
use app\model\Project as ProjectModel;
use ruhua\exceptions\BaseException;
use app\model\ClassProject as ClassProjectModel;

class Project extends BaseController
{
    /*
     * 添加课程分类
     */
    public function add_project()
    {
        $data=input('post.');
        $pro=ProjectModel::where($data)->find();
        if($pro)
            throw new BaseException(['msg'=>'添加重复']);
        (new ValidataService())->projectValidata($data);
        $res=ProjectModel::create($data);
        return app('json')->go($res);
    }


    /*
    * 修改课程分类
    */
    public function edit_project()
    {
        $data=input('post.');
        (new ValidataService())->projectValidata($data);
        $res=ProjectModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**
     * 删除课程
     */
    public function del_project($id)
    {
        $res=ProjectModel::destroy($id);
        ClassProjectModel::where(['pid'=>$id])->delete();
        return app('json')->go($res);
    }

    public function get_project($type="")
    {
        if($type=="")
            $res=ProjectModel::with('chird')->order('create_time desc')->order('pid asc')->where('pid',0)->select();
        else{
            $arr=array();

            //$res=ProjectModel::with('chird')->order('id desc')->select();
            $res=ProjectModel::with('chird')->order('create_time desc')->where('pid',0)->select();
            foreach ($res as $k=>$v){
                $arr[]=$v;
                if(count($v['chird'])>0){
                    foreach ($v['chird'] as $k1=>$v1)
                        $arr[]=$v1;
                }

            }
            $res=$arr;
        }

        return app('json')->go($res);
    }





}