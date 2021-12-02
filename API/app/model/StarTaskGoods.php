<?php


namespace app\model;


use ruhua\bases\BaseModel;

class StarTaskGoods extends BaseModel
{
    public function course()
    {
        return $this->belongsTo('Course','course_id','id');
    }

}