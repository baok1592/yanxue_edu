<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/26 0026
 * Time: 16:43
 */

namespace app\model;


use ruhua\bases\BaseModel;
use think\model\concern\SoftDelete;

class SysConfig extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;

    public static function get($key)
    {
        return self::where('key',$key)->value('value');
    }
    public static function wqGet($key,$ucid=0)
    {
        return self::where(['key'=>$key,'ucid'=>$ucid])->value('value');
    }
    //修改页面主题
    public static function upzt($value){
        $res = self::update(['value'=>$value],['key'=>'page_theme']);
        return app('json')->go($res);
    }
}