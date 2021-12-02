<?php

namespace app\model;

use ruhua\bases\BaseModel;

/**
 * @mixin \think\Model
 */
class Project extends BaseModel
{
    public function chird()
    {
        return $this->hasMany('Project','pid','id');
    }

    public function father()
    {
        return $this->belongsTo('Project','pid','id')->field('id,name');
    }
}
