<?php


namespace app\model;

use ruhua\bases\BaseModel;
use think\facade\Request;

/**
 * @mixin \think\Model
 */
class Image extends BaseModel
{

    public function getUrlAttr($value)
    {

        return Request::domain().$value;
    }

}
