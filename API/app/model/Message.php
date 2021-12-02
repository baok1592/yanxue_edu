<?php


namespace app\model;

use ruhua\bases\BaseModel;

/**
 * @mixin \think\Model
 */
class Message extends BaseModel
{
    public function getTimeAttr($value)
    {
        if($value>0)
            return date("Y-m-d",$value);
        else
            return $value;
    }

    public function user()
    {
        return $this->belongsTo('User','uid','id');
    }

    public function student()
    {
        return $this->belongsTo('Student','uid','id');
    }
}
