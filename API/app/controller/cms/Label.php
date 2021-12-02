<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 15:52
 */

namespace app\controller\cms;


use ruhua\bases\BaseController;
use app\model\StuLabel as StuLabelModel;
use ruhua\exceptions\BaseException;

class Label extends BaseController
{
    public function add_label($name)
    {
        $data['name']=$name;
        $label=StuLabelModel::where($data)->find();
        if($label)
            throw new BaseException(['msg'=>'名称重复']);
        $res=StuLabelModel::create($data);
        return app('json')->go($res);
    }

    public function update_label($id,$name)
    {
        $res=StuLabelModel::update(['name'=>$name],['id'=>$id]);
        return app('json')->go($res);
    }

    public function delete_label($id)
    {
        $res=StuLabelModel::destroy($id);
        return app('json')->go($res);
    }

    public function get_label()
    {
        $res=StuLabelModel::select();
        return app('json')->go($res);
    }
}