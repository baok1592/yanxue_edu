<?php


namespace app\model;

use ruhua\bases\BaseModel;
use ruhua\services\TokenService;
use think\model\concern\SoftDelete;

/**
 * @mixin \think\Model
 */
class Classes extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;

    public function classstu()
    {
        return $this->hasMany('ClassStu','cid','id');
    }

    public function plans()
    {
        return $this->hasMany('Plan','class_id','id');
    }

    public function project()
    {
        return $this->hasMany('ClassProject','cid','id');
    }

    public function teacher()
    {
        return $this->hasMany('ClassTeacher','cid','id');
    }

    public function teachers()
    {
        return $this->hasMany('ClassTeacher','cid','id');
    }

    public function courses()
    {
        return $this->hasMany('Course','id','course');
    }

    public function coursed()
    {
        return $this->belongsTo('Course','course','id');
    }

    public function studencount()
    {
        return $this->hasMany('ClassStu','cid','id');
    }


    public function plan()
    {
        $uid=TokenService::getCurrentUid();
        $sid=Student::where(['uid'=>$uid])->value('id');
        return $this->hasMany('Plan','class_id','id')->where('uid',$sid);
    }
    public function setStartTimeAttr($value)
    {
        return strtotime($value);
    }

    public function getStartTimeAttr($value)
    {
        return date("Y-m-d",$value);
    }

    public function setEndTimeAttr($value)
    {
        return strtotime($value);
    }

    public function getEndTimeAttr($value)
    {
        return date("Y-m-d",$value);
    }

    public function setPlanDateAttr($value)
    {
        return json_encode($value);
    }

    public function getPlanDateAttr($value)
    {
        if(!$value)
            return [];
        return json_decode($value);
    }
}
