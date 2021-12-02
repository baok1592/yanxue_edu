<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/19 0019
 * Time: 12:59
 */

namespace app\model;


use ruhua\bases\BaseModel;
use think\model\concern\SoftDelete;

class Teacher extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;
    public function getTJsonAttr($value)
    {

        if(!$value)
            return "";
        return json_decode($value,JSON_UNESCAPED_UNICODE);
    }

/*    public function setTJsonAttr($value)
    {
        return json_encode($value,JSON_UNESCAPED_UNICODE);

    }*/

    public function user()
    {
        return $this->belongsTo('User','uid','id');
    }

    public function labels()
    {
        return $this->hasMany('UserProject','tid','id');
    }

    public function course()
    {
        return $this->belongsTo('CourseTeacher','tid','id');
    }

    public function courses()
    {
        return $this->hasMany('CourseTeacher','tid','id');
    }

}