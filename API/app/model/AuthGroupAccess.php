<?php


namespace app\model;

use ruhua\bases\BaseModel;

class AuthGroupAccess extends BaseModel
{
    public function autogroup(){
        return $this->hasOne('AuthGroup','id','group_id');
    }

}