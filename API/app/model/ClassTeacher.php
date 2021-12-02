<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 9:40
 */

namespace app\model;


use ruhua\bases\BaseModel;

class ClassTeacher extends BaseModel
{

    public function course()
    {
        return $this->belongsTo('Course','course_id','id');
    }

    public function classes()
    {
        return $this->hasMany('Classes','id','cid');
    }

    public function tea()
    {
        return $this->belongsTo('Teacher','tid','id');
    }

}