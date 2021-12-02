<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 11:35
 */

namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use think\facade\Db;
use think\facade\Log;

class CourseTeacher extends BaseModel
{
    public function course()
    {
        return $this->belongsTo('Course','course_id','id');
    }



    public function classes()
    {
        return $this->hasMany('Classes','id','cid');
    }

    public function teacher()
    {
        return $this->belongsTo('Teacher','tid','id');
    }

    public function add($data,$uid)
    {
        Db::startTrans();// 启动事务
        $model=(new CourseTeacher());

        try{
            $arr=array();
            $res=$model->where(['tid'=>$uid])->delete();
            foreach ($data as $k=>$v){
                $arr[$k]['tid']=$uid;
                $arr[$k]['course_id']=$v;
            }
            Log::error($arr);
            $model->saveAll($arr);
            Db::commit();
            return true;

        }catch (\Exception $e){
            Db::rollback(); // 回滚事务
            throw new BaseException('添加失败'. $e->getMessage());

        }
    }

}