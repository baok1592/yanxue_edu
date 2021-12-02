<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 9:34
 */

namespace app\model;


use ruhua\bases\BaseModel;

class Plan extends BaseModel
{
    public function setPlanTimeAttr($value)
    {
        return strtotime($value);
    }

    public function teacher()
    {

        return $this->belongsTo('Teacher','tid','id');
    }

    public function course()
    {
        return $this->belongsTo('Course','cid','id');
    }

    public function getPlanTimeAttr($value)
    {
        return date("Y-m-d",$value);
    }

    public function setContentAttr($value)
    {
        return json_encode($value,JSON_UNESCAPED_UNICODE);
    }

    public function getContentAttr($value)
    {
        return json_decode($value,JSON_UNESCAPED_UNICODE);
    }

    public function student()
    {
        return $this->belongsTo('Student','uid','id');
    }

    public function classes()
    {
        return $this->belongsTo('Classes','class_id','id');
    }

}