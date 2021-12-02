<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 9:46
 */

namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use think\model\concern\SoftDelete;

class Student extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;
    public function wx()
    {

        return $this->belongsTo('User','uid','id')->field('id,nickname,nickname,headpic');
    }

    public function persons()
    {
        return $this->belongsTo('User','person','id')->field('id,nickname,nickname,headpic,name');
    }


    public function msg()
    {
        return $this->hasMany('Msg','uid','id')->where('type',3);
    }

    public function pingce()
    {
        return $this->hasMany(['Pingce','id','uid']);
    }

    public function labels()
    {

        return $this->hasMany('StuLabel','id','label');
    }

    public function classesstu()
    {

        return $this->hasMany('ClassStu','uid','id');
    }

    public function teacher()
    {
        return $this->belongsTo('Teacher','uid','id');
    }

    public function setLabelAttr($value)
    {
        return json_encode($value);
    }

    public function getLabelAttr($value)
    {
        if($value!="")
            return json_decode($value);
        return [];
    }

    public static function check_bind($id)
    {
        $res=self::find($id);
        if($res['uid']>0)
            throw new BaseException(['msg'=>'学生已绑定过微信账号']);
    }
}