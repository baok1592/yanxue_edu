<?php


namespace app\model;

use ruhua\bases\BaseModel;

/**
 * @mixin \think\Model
 */
class UserProject extends BaseModel
{
    public function project()
    {
        return $this->belongsTo('Project','label','id')->field('id,name');
    }

    public function user()
    {
        return $this->hasMany('User','id','uid')->field('id,headpic,nickname,name,img');
    }
}
