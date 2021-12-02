<?php

namespace app\model;

use ruhua\bases\BaseModel;
use think\facade\Request;


class Video extends BaseModel
{
    public function getUrlAttr($value)
    {
        return Request::domain().$value;
    }
}
