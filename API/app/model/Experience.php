<?php


namespace app\model;

use ruhua\bases\BaseModel;

/**
 * @mixin \think\Model
 */
class Experience extends BaseModel
{
    public function setCertificateAttr($value)
    {
        if(is_array($value))
            return json_encode($value,JSON_UNESCAPED_UNICODE);
        else
            return $value;
    }

    public function getCertificateAttr($value)
    {
        if($value!="")
            return json_decode($value,JSON_UNESCAPED_UNICODE);
        else
            return $value;
    }

    public function setExperienceAttr($value)
    {
        if(is_array($value))
            return json_encode($value,JSON_UNESCAPED_UNICODE);
        else
            return $value;
    }

    public function getExperienceAttr($value)
    {
        if($value!="")
            return json_decode($value,JSON_UNESCAPED_UNICODE);
        else
            return $value;
    }

    public function setJsonAttr($value)
    {
        if(is_array($value))
            return json_encode($value,JSON_UNESCAPED_UNICODE);
        else
            return $value;
    }

    public function getJsonAttr($value)
    {
        if($value!="")
            return json_decode($value,JSON_UNESCAPED_UNICODE);
        else
            return $value;
    }


}
