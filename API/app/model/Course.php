<?php


namespace app\model;

use ruhua\bases\BaseModel;
use think\model\concern\SoftDelete;

/**
 * @mixin \think\Model
 */
class Course extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;
    public function video()
    {
        return $this->belongsTo('Video','url','id');
    }

    public function pt()
    {
        return $this->belongsTo('PtGoods','id','goods_id');
    }

    public function pro()
    {
        return $this->belongsTo('Project','project','id');
    }

    public function teachers()
    {
        return $this->hasMany('CourseTeacher','course_id','id');
    }

    public function img()
    {
        return $this->belongsTo('Image','image','id')->field('id,url,category_id');
    }

    public function classes()
    {
        return $this->belongsTo('Classes','id','course');
    }

}
