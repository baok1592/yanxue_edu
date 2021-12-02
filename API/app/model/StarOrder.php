<?php


namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;
use think\facade\Db;

class StarOrder extends BaseModel
{
    public static function star($id)
    {

        Db::startTrans();// 启动事务
        try{
            $msg="";
        $data=self::with('task')->find($id);
        if($data['state']>0){
            $msg="任务已结束";
            throw new BaseException(['msg'=>'任务已结束']);
        }

        $task=StarTask::whereTime('start_time','<',time())->whereTime('end_time','>',time())->where('id',$data['task_id'])->find();
        if(!$task){
            $data->save(['state'=>2]);
            $msg="助力已过期";
            throw new BaseException(['msg'=>'助力已过期']);
        }
        $uid=TokenService::getCurrentUid();
        $userstar=StarUser::where(['uid'=>$uid,'order_id'=>$id])->find();
        if($userstar){
            $msg="您已助力过";
            throw new BaseException(['msg'=>'您已助力过']);
        }

        $star=[
            'order_id'=>$id,
            'uid'=>TokenService::getCurrentUid()
        ];
        StarUser::create($star);

        $res=$data->save(['num'=>$data['num']+1]);

       $star=StarTaskGoods::where(['task_id'=>$data['task_id'],'course_id'=>$data['course_id']])->value('star');

        if($star<=$data['num']){
            $data->save(['state'=>1]);

            $dt=[
                'course_id'=>$id,
                'uid'=>$data['uid']
            ];
            $msg="该课程您已拥有";
            self::add_user_course($dt);
            $msg="助力已完成";
            throw new BaseException(['msg'=>'助力已完成']);
        }
            Db::commit();
        }catch (\Exception $e){
            Db::rollback(); // 回滚事务
            throw new BaseException(['msg'=> $e->getMessage().$msg]);

        }
        return $res;
    }

    public static function add_user_course($data)
    {
        $res=UserCourse::where($data)->find();
        if($res)
            throw new BaseException(['msg'=>'该课程您已拥有']);
        return UserCourse::create($data);
    }

    public function task()
    {
        return $this->belongsTo('StarTask','task_id','id');
    }

}