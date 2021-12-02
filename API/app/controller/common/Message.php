<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 11:03
 */

namespace app\controller\common;


use app\model\Fx;
use ruhua\bases\BaseController;
use app\model\Message as MessageModel;
use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;
use app\model\Student as StudentModel;

class Message extends BaseController
{

    /**添加留言
     * @return mixed
     * @throws BaseException
     */
    public function add_message()
    {

        $data=input('post.');
        $data['time']=strtotime($data['time']);
        $job=TokenService::getCurrentJob();
        $uid=TokenService::getCurrentUid();
        if($job==0)
            $data['uid']=StudentModel::where(['uid'=>$uid])->value('id');
        else
            $data['uid']=StudentModel::where(['person'=>$uid])->value('id');

        if(!$data['uid'])
            $data['uid']=$uid;

        $message=MessageModel::where(['uid'=>$data['uid'],'type'=>$data['type']])->whereTime('create_time','today')->find();
        if($message){
            if($message['type']==0)
                throw new BaseException(['msg'=>'今天已填写过']);
        }

        $res=MessageModel::create($data);
        return app('json')->go($res);
    }

    /**用户删除请假
     * @param $id
     */
    public function user_del_message($id)
    {
       $where=[
           'id'=>$id,
           'uid'=>TokenService::getCurrentUid(),
           'type'=>0
       ];
       $res=MessageModel::where($where)->delete();
       return app('json')->go($res);
    }

    /**
     * 用户查看所有请假信息
     */
    public function user_get_message()
    {
        $data=[
            'uid'=>TokenService::getCurrentUid(),
            'type'=>0,
        ];
        $res=MessageModel::where($data)->select();
        return app('json')->go($res);
    }

    /**管理员获取留言信息
     * @param int $type 0请假1反馈
     * @return mixed
     */
    public function cms_get_message($type=0)
    {
        $where=['type'=>$type];
        $res=MessageModel::with(['student','user'])->where($where)->order('id desc')->select();
        return app('json')->go($res);
    }


    /**cms删除留言
     * @param $id
     * @return mixed
     */
    public function del_message($id,$type="")
    {
        if($type==1)
            $res=Fx::destroy($id);
        else
            $res=MessageModel::destroy($id);
        return app('json')->go($res);
    }
}