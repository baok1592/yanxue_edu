<?php


namespace app\model;

use ruhua\bases\BaseModel;


/**
 * @mixin \think\Model
 */
class Msg extends BaseModel
{
    public function user()
    {
        return $this->belongsTo('User','uid','id');
    }
}
