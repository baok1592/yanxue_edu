<?php


namespace app\model;

use ruhua\bases\BaseModel;

/**
 * @mixin \think\Model
 */
class ClassStu extends BaseModel
{
    public function classes()
    {
        return $this->belongsTo('Classes','cid','id');
    }

    public function classname()
    {
        return $this->belongsTo('Classes','cid','id');
    }

    public function stu()
    {
        return $this->belongsTo('   Student','uid','id');
    }
}
