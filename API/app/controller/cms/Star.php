<?php


namespace app\controller\cms;


use ruhua\bases\BaseController;
use app\model\StarTask as StarTaskModel;
use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;
use app\model\StarOrder as StarOrderModel;
use app\model\PtGoods as PtGoodsModel;
use app\model\StarTaskGoods as StarTaskGoodsModel;
use think\facade\Db;
use think\facade\Log as Logs;


class Star extends BaseController
{
    /**
     * 添加助力任务
     */
    public function add_task()
    {
        $data=input('post.');
        $rule=[
            'course_id'=>'require',
            'start_time'=>'require',
            'end_time'=>'require',
            'name'=>'require'
        ];
        $this->validate($data,$rule);
        $ids=array();
        foreach ($data['course_id'] as $k=>$v){
            $ids[]=$v['course_id'];
        }

        $pt_goods=PtGoodsModel::where(['goods_id'=>$ids])->select();
        if(count($pt_goods)>0)
            throw new BaseException(['msg'=>'有商品已经在其它活动中']);
        $dt=[
            'start_time'=>$data['start_time'],
            'end_time'=>$data['end_time'],
            'name'=>$data['name'],
            'json'=>$data['json']
        ];
        $res=StarTaskModel::create($dt);
        $create=array();
        foreach ($data['course_id'] as $k=>$v){
            $create[]=[
                'task_id'=>$res['id'],
                'course_id'=>$v['course_id'],
                'star'=>$v['star']
            ];
        }

        (new StarTaskGoodsModel())->saveAll($create);
        return app('json')->go($res);
    }

    /**
     * 修改助力任务
     */
    public function update_task()
    {
        $data=input('post.');
        if(isset($data['create_time']))
            unset($data['create_time']);
        if(isset($data['update_time']))
            unset($data['update_time']);

        $ids=array();
        foreach ($data['course_id'] as $k=>$v){
            $ids[]=$v['course_id'];
        }
        Db::startTrans();// 启动事务
        try {
        $pt_goods=PtGoodsModel::where(['goods_id'=>$ids])->select();
        if(count($pt_goods)>0)
            throw new BaseException(['msg'=>'有商品已经在其它活动中']);
        $dt=[
            'start_time'=>$data['start_time'],
            'end_time'=>$data['end_time'],
            'name'=>$data['name'],
            'json'=>$data['json']
        ];
        $res=StarTaskModel::update($dt,['id'=>$data['id']]);
        $create=array();
        foreach ($data['course_id'] as $k=>$v){
            $create[]=[
                'task_id'=>$data['id'],
                'course_id'=>$v['course_id'],
                'star'=>$v['star']
            ];
        }
        StarTaskGoodsModel::where(['task_id'=>$data['id']])->delete();
        (new StarTaskGoodsModel())->saveAll($create);
            Db::commit();
        return app('json')->go($res);
        }catch (\Exception $e) {
            Db::rollback(); // 回滚事务
            throw new BaseException(['msg' => '有商品已在其它活动中']);
        }

    }

    /**删除助力任务
     * @param $id
     */
    public function del_task($id)
    {
        $data=StarTaskModel::find($id);
        if(strtotime($data['start_time'])>time()&&strtotime($data['end_time'])<time()){
            throw new BaseException(['msg'=>'活动已在进行中，无法删除']);
        }

        $res=StarTaskModel::destroy($id);
        StarTaskGoodsModel::where(['task_id'=>$data['id']])->delete();
        return app('json')->go($res);
    }

    /**
     * 获取助力任务信息
     */
    public function get_task()
    {
        $res=StarTaskModel::with('course.course')->select();
        return app('json')->go($res);
    }

    /**
     * 创建订单任务
     */
    public function create_order($task_id,$course_id)
    {
        $data=[
            'task_id'=>$task_id,
            'uid'=>TokenService::getCurrentUid(),
            'course_id'=>$course_id
        ];
        $order=StarOrderModel::where($data)->find();
        if($order)
            throw new BaseException(['msg'=>'该课程已参与过']);
        $res=StarOrderModel::create($data);
        return app('json')->go($res);
    }

    /**邀请助力
     * @param $id
     * @return mixed
     * @throws BaseException
     */
    public function set_star_order($id)
    {
        $star=StarOrderModel::star($id);
        return app('json')->go($star);
    }


    /**
     * 查看所有助力任务
     */
    public function get_all_order()
    {
        $res=StarOrderModel::order('create_time desc')->select();
        return app('json')->go($res);
    }

    /**
     * 用户获取助力任务
     */
    public function user_get_order()
    {
        $uid=TokenService::getCurrentUid();
        $res=StarOrderModel::where(['uid'=>$uid])->order('create_time desc')->select();
        return app('json')->go($res);

    }




}