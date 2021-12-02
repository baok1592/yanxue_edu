<?php


namespace app\model;


use ruhua\bases\BaseModel;

class StarTask extends BaseModel
{

    public function course()
    {
        return $this->hasMany('StarTaskGoods','task_id','id');
    }


    public function setStartTimeAttr($value)
    {
        return strtotime($value);
    }




    public function getStartTimeAttr($value)
    {
        return date("Y-m-d H:i:s",$value);
    }


    public function setEndTimeAttr($value)
    {
        return strtotime($value);
    }


    public function getEndTimeAttr($value)
    {
        return date("Y-m-d H:i:s",$value);
    }

    public function setJsonAttr($value)
    {
        if($value=="")
            return $value;
        else
            return  json_encode($value);
    }

    public function getJsonAttr($value)
    {
        if($value=="")
            return "";
        else
            return json_decode($value);
    }

}