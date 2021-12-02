<?php


namespace app\model;

use ruhua\bases\BaseModel;
/**
 * @mixin \think\Model
 */
class Order extends BaseModel
{
    public function user()
    {
        return $this->belongsTo('User','uid','id')->field('id,name,nickname');
    }

    public function course()
    {
        return $this->belongsTo('Course','course_id','id');
    }

    public function users()
    {
        return $this->belongsTo('User','uid','id');
    }
}
