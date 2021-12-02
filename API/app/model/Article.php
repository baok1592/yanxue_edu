<?php


namespace app\model;

use ruhua\bases\BaseModel;
use think\model\concern\SoftDelete;

/**
 * @mixin \think\Model
 */
class Article extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;

    public function img()
    {
        return $this->belongsTo('Image','image','id')->field('id,url,category_id');
    }
}
