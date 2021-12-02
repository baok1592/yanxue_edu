<?php


namespace app\model;

use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use think\facade\Request;

/**
 * @mixin \think\Model
 */
class User extends BaseModel
{
    /**关联多标签
     * @return \think\model\relation\HasMany
     */
    public function label()
    {
        return $this->hasMany('UserProject','uid','id');
    }

    public function tlabel()
    {
        return $this->hasMany('CourseTeacher','tid','id');
    }



    public function getQrcodeXcxAttr($value)
    {
        return Request::domain().$value;
    }


    public function setNicknameAttr($value)
    {
        return base64_encode($value);
    }

    public function getNicknameAttr($value)
    {
        return base64_decode($value);
    }

    public function teacher()
    {
        return $this->belongsTo('Teacher','id','uid');
    }

    public function getTJsonAttr($value)
    {
        if(!$value)
            return "";
        return $value;
    }

    public function student()
    {
        return $this->belongsTo('Student','id','uid');
    }


    /**
     * 关联教师资历
     */
    public function experience()
    {
        return $this->belongsTo('Experience','id','uid');
    }

    public function kids()
    {
        return $this->hasMany('Student','person','id');
    }

    public function course()
    {
        return $this->hasMany('Course','teacher','id')->withoutField('url');
    }

    public static function check_bind($id)
    {
        $res=self::with(['student','kids','teacher'])->find($id);
        if(!$res['student']&&!$res['teacher'])
            return true;
        else
            throw new BaseException(['msg'=>'该微信用户已被绑定']);
    }


}
