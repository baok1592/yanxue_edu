<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 11:26
 */

namespace app\controller\cms;

use app\model\Msg as MsgModel;
use ruhua\bases\BaseController;

class Msg extends BaseController
{
    public function get_msg($type=0)
    {
        $res=MsgModel::with('user')->where(['type'=>$type])->select();
        return app('json')->go($res);
    }

    public function get_change_msg($read="")
    {
        if($read!=""){
            $res=MsgModel::where(['type'=>3,'read'=>0])->count();
        }else{
            $res=MsgModel::where(['type'=>3])->order('id desc')->select();
        }
        return app('json')->go($res);
    }
}