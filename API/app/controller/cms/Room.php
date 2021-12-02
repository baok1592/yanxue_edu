<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/20 0020
 * Time: 11:34
 */

namespace app\controller\cms;


use ruhua\bases\BaseController;
use app\service\ValidataService;
use app\model\Room as RoomModel;
use ruhua\exceptions\BaseException;
use app\model\Classes as ClassesModel;

class Room extends BaseController
{
    /**
     * 添加教室
     * */
    public function add_room()
    {
        $post=input('post.');
        $rule=[
            'name'=>'require'
            ];
        (new ValidataService())->roomValidata($post);
        $room=RoomModel::where(['name'=>$post['name']])->find();
        if($room)
            throw new BaseException(['msg'=>"教室名称重复"]);
        $res=RoomModel::create($post);
        return app('json')->go($res);
    }
    
    public function up_room()
    {
        $post=input('post.');
        $rule=[
            'name'=>'require'
            ];
        (new ValidataService())->roomValidata($post);
        $res=RoomModel::update($post,['id'=>$post['id']]);
        if($post['live_url']!=""){
            ClassesModel::where(['classroom'=>$post['name']])->update(['live'=>$post['live_url']]);
        }
        return app('json')->go($res);
    }
    
    public function del_room($id)
    {
        $res=RoomModel::destroy($id);
        return app('json')->go($res);
    }
    
    public function get_room()
    {
        $res=RoomModel::select();
        return app('json')->go($res);
    }

    
}