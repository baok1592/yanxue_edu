<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/29 0029
 * Time: 15:16
 */

namespace app\model;


use ruhua\bases\BaseModel;

class Kids extends BaseModel
{
    public function per()
    {
        return $this->belongsTo('User','person','id')->field('id,name,headpic');
    }
}