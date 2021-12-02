<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/11/25 0025
 * Time: 16:08
 */

namespace app\model;


use ruhua\bases\BaseModel;
use ruhua\exceptions\OrderException;
use think\facade\Log;

class PtItem extends BaseModel
{
    //关联模型
    public function user()
    {
        return $this->hasOne('User', 'id', 'user_id')->field('id,nickname,headpic');
    }

    /**
     * 获取拼团队伍
     * @param $goods_id
     * @return mixed
     */
    public static function getItem($goods_id)
    {
        $res = self::with('ptorder.users')->where('course_id', $goods_id)->where('state', 1)
            ->whereTime('item_time', '>', time())
            ->order('user_num')->limit(6)->select();

        foreach ($res as $k=>$v){
            $res[$k]['c_pic']=$v['ptorder']['users']['headpic'];
            $res[$k]['c_name']=$v['ptorder']['users']['nickname'];
            $res[$k]['item_pic']= $v['ptorder']['users']['headpic'];
        }
        return app('json')->go($res);
    }

    public function ptorder()
    {
        return $this->belongsTo('Order','id','item_id');
    }

    public function orders()
    {
        return $this->hasMany('Order','item_id','id');
    }

    /**
     * 获取某个拼团详情
     * @param $id
     * @return mixed
     */
    public static function getOneItem($id)
    {
        $res = self::with('orders.users')->where('id', $id)->where('state', 1)
            ->whereTime('item_time', '>', time())
            ->order('user_num')->find();

        if(!$res){
            return app('json')->success();
        }
        $res=$res->toArray();
        $res['item_pic'] = [];
        $res['c_pic'] = [];
        foreach ($res['orders'] as $kk => $vv) {
            if ($res['user_id'] == $vv['uid']) {
                $res['c_pic'] = $vv['users']['headpic'];
                $res['c_name'] = $vv['users']['nickname'];
            } else {
                array_push($res['item_pic'], $vv['users']['headpic']);
            }
        }

        return app('json')->go($res);
    }

    /**
     * 检测拼团队伍是否完成
     * @param $id
     * @return int
     * @throws OrderException
     */
    public static function checkItemUser($id)
    {
        $res = Order::where('order_id', $id)->find();
        if ($res['item_id'] == 0) {
            return 1;
        }
        $item = $res['item'];
        $item = self::with('user')->where('id', $item)->find();
        if ($res['user_id'] == $item['user_id']) {
            $state = 0;
        } else {
            $state = 1;
        }
        if (!$item || $item['state'] != $state || $item['user_num'] <= $item['pay_user'] || $item['item_time'] < time()) {
            throw new OrderException(['msg' => '拼团订单不存在或已完成']);
        }
        return 1;
    }

    /**
     * 关闭拼团订单
     */
    public static function closeItem()
    {
        $itemModel = new self();
        $orderModel = new Order();
        try {
            $itemModel->where(['state' => 0])->whereTime('item_time', '<', time())->delete();
            $item = $itemModel->with(['user'])->where(['state' => 1])->whereTime('item_time', '<', time())->select();
            foreach ($item as $k => $v) {
                if (($v['pay_user'] + $v['cheng_tuan_num']) >$v['user_num']){       //虚拟成团
                    $itemModel->where(['id'=>$v['id']])->save(['state'=>2]);
                    $orderModel->where(['item_id'=>$v['id'],'payment_state'=>1])->update(['pt_state'=>2]);
                    $ids = Order::where('item_id', $item['id'])->where('payment_state', 1)->column('user_id');
                    event('SendGzhDeliveryMessage', [$item, 3, $ids]);//拼团成功发送公众号模板消息
                    break;
                }
                $itemModel->where(['id'=>$v['id']])->save(['state'=>-1]);
                $order = $orderModel->where('item_id', $v['id'])->where('payment_state', 1)->select();
                foreach ($order as $kk => $vv) {
                    $tui = new TuiService();
                    $tui->ptTuiPay($vv['order_id']);
                    $vv['goods_name']=substr($v['goods_name'],0,10);
                    event('SendGzhDeliveryMessage', [$vv, 4, $vv['user_id']]);//拼团失败发送公众号模板消息
                }
            }

        } catch (\Exception $e) {
            Log::error('关闭拼团:' . $e->getMessage());
        }
    }
}