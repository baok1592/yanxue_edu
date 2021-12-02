<?php


namespace app\model;

use ruhua\bases\BaseModel;


/**
 * @mixin \think\Model
 */
class Banner extends BaseModel
{
    public function img()
    {
        return $this->belongsTo('Image','img_id','id')->field('id,url,category_id');
    }

    public function article()
    {
        return $this->belongsTo('Article','jump_id','id')->field('id,title');
    }

    public function teacher()
    {
        return $this->belongsTo('Teacher','jump_id','id')->field('id,name');
    }
    public function course()
    {
        return $this->belongsTo('Course','jump_id','id')->field('id,name');
    }
}
