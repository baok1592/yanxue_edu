<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/19 0019
 * Time: 16:10
 */

namespace app\controller\cms;


use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use ruhua\model\SysConfig as SysConfigModel;
use think\facade\Db;

class Sysconfig extends BaseController
{
    public function get_config()
    {
        $res=SysConfigModel::select();
        return app('json')->go($res);
    }

    public function update_sys()
    {
        $data=input('post.');
        Db::startTrans();// 启动事务
        $sys=(new SysConfigModel());
        try {
            foreach ($data as $k=>$v){
                $sys->where(['id'=>$v['id']])->update(['value'=>$v['value']]);
            }
            Db::commit();
            return ['data'=>true];
        } catch (\Exception $e) {
            Db::rollback();
            throw  new BaseException(['msg'=>$e->getMessage()]);
        }
        return app('json')->go($res);
    }

}