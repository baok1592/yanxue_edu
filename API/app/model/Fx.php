<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/10 0010
 * Time: 10:30
 */

namespace app\model;


use ruhua\bases\BaseModel;

class Fx extends BaseModel
{
    public function teacher()
    {
        return $this->belongsTo('Teacher','tid','id');
    }
}