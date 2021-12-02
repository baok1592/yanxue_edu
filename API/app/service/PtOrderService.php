<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2019/11/25 0025
 * Time: 15:10
 */

namespace app\service;


use app\model\Order;
use app\model\PtGoods;
use app\model\PtItem;
use app\Request;
use ruhua\bases\BaseCommon;
use ruhua\exceptions\BaseException;
use ruhua\exceptions\OrderException;
use think\facade\Db;
use think\facade\Log;
use app\model\PtGoods as PtGoodsModel;
use app\model\Course as CourseModel;



class PtOrderService
{
    /**
     * 创建公众号订单
     * @param $post
     * @param $uid
     * @param $type
     * @param $openid
     * @return \GzhPay\json数据，可直接填入js函数作为参数|string
     * @throws OrderException
     */
    public function createGzhOrder($post, $uid, $openid, $type)
    {

        Db::startTrans();
        try {
            if ($type == 1) {
                $order_data = $this->CreatePtItemOrder($post, $uid); //创建订单
            } else if ($type == 2) {
                $order_data = $this->CreatePtOrder($post, $uid); //创建订单
            }
            if (!is_array($order_data)) {
                return $order_data;
            }
            $gzh['web_name'] = app('system')->getValue('web_name');
            $gzh['api_url'] = app('system')->getValue('api_url');
            $res = (new JsApi())->gzh_pay($openid, $order_data['order_data'], $gzh);
            Db::commit();
            return  $res;
        }catch (\Exception $e){
            Db::rollback();// 回滚事务
            throw new OrderException(['msg' => $e->getMessage()]);
        }
    }

    /**
     * 创建小程序订单
     * @param $post
     * @param $uid
     * @param $type
     * @return \GzhPay\json数据，可直接填入js函数作为参数|string
     * @throws OrderException
     */
    public function createWxOrder($post, $uid, $type)
    {
        if ($type == 1) {
            $order_data = $this->CreatePtItemOrder($post, $uid); //创建订单
        } else if ($type == 2) {
            $order_data = $this->CreatePtOrder($post, $uid); //创建订单
        }

        if (!is_array($order_data)) {
            return $order_data;
        }

     return $order_data;
    }

    /**
     * 队长创建订单
     * @param $post
     * @param $uid
     * @return array|string
     * @throws OrderException
     */
    public function CreatePtItemOrder($post, $uid)
    {
        Db::startTrans();
        try {

            $course_infor=CourseModel::with('pt.pt')->where("id",$post['course_id'])->find();
            if(!$course_infor['pt']||!$course_infor['pt']['pt'])
                return app('json')->fail('商品未开启拼团');

            if (time() < strtotime($course_infor['pt']['pt']['start_time']) || time() > strtotime($course_infor['pt']['pt']['end_time'])){
                return app('json')->fail('未在活动时间');
            }
            $item_data = $this->setItemData($course_infor, $uid);
            $item = PtItem::create($item_data);
            $order_data = $this->setOrderData($post, $uid, $item, $course_infor);//组装订单数据
            $res_order = Order::create($order_data);//创建订单
            $data['id'] = $res_order['id'];
            $data['order_data'] = $order_data;
            Db::commit();
            return app('json')->go($data);
        } catch (\Exception $e) {
            Db::rollback();// 回滚事务
            return app('json')->fail($e->getMessage());
        }
    }

    /**
     * 团员创建订单
     * @param $post
     * @param $uid
     * @return array|string
     * @throws OrderException
     */
    public function CreatePtOrder($post, $uid)
    {
        Db::startTrans();
        try {
            $course_infor=CourseModel::with('pt.pt')->where("id",$post['course_id'])->find();
            if(!$course_infor['pt']||!$course_infor['pt']['pt'])
                return app('json')->fail('商品未开启拼团');

            if (time() < strtotime($course_infor['pt']['pt']['start_time']) || time() > strtotime($course_infor['pt']['pt']['end_time'])){
                return app('json')->fail('未在活动时间');
            }
            $item = PtItem::where('id', $post['item_id'])->where('state', 1)->find();
            if (!$item) {
                return app('json')->fail('团购未开启或已结束');
            }
            $item_user = Order::where('item_id', $post['item_id'])
                ->where('pay_statement', 1)->column('uid');
            if (in_array($uid, $item_user)) {
                return app('json')->fail('请勿重复参团');
            }
            if (count($item_user) >= $item['user_num']) {
                return app('json')->fail('人数已满');
            }

            $order_data = $this->setOrderData($post, $uid, $item, $course_infor);//组装订单数据
            $res_order = Order::create($order_data);//创建订单

            $data['id'] = $res_order['id'];
            $data['order_data'] = $order_data;

            Db::commit();
            return app('json')->go($data);
        } catch (\Exception $e) {
            Db::rollback();// 回滚事务
            return app('json')->fail($e->getMessage());
        }
    }

    public function setItemData($goods, $uid)
    {
        $data['user_id'] = $uid;
        $data['course_id'] = $goods['id'];
        $data['course_name'] = $goods['name'];
        $data['user_num'] = $goods['pt']['pt']['user_num'];
        $data['img_id'] = $goods['image'];
        $data['item_time'] = strtotime("+" . $goods['pt']['pt']['pt_time'] . "hours", time());
        return $data;
    }

    /**
     * 组装订单数据
     * @param $post
     * @param $uid
     * @param $item
     * @param $goods
     * @return array
     * @throws OrderException
     */
    public function setOrderData($post, $uid, $item, $goods)
    {
        $data = [];
        $data['order_num'] = (new BaseCommon())->makePtOrderNum();  //订单号
        $data['item_id'] = $item['id'];  //订单号
        $data['uid'] = $uid;
        $data['user_ip'] = (new Request())->ip(); //买家IP
        $data['pt_state'] = 1;
        $data['payment_type'] = $post['payment_type']; //支付方式

        if ($item['user_id'] == $uid) {
            $data['is_captain'] = 1;
        }
        $data['price'] = $goods['pt']['price'];
        $data['total_price'] = $goods['pt']['price'];
        return $data;
    }

    /*
     * 优惠券计算
     *
     * */
    private function computeCouponMoney($coupon_id, $uid, $data)
    {
        if ($coupon_id) {
            $coupon = UserCouponModel::where('id', $coupon_id)->where('user_id', $uid)->where('status', 0)->whereTime('end_time', '>', time())->find();
            if (!$coupon) {
                throw new OrderException(['msg' => '优惠券使用错误']);
            }
            $all_money = 0;
            foreach ($data as $k => $v) {
                $goods = GoodsModel::with('goodsSku')->where('goods_id', $v['goods_id'])->find()->toArray();
                $ptPrice  = PtGoods::getPtGoods($v['goods_id']);
                if ($v['sku_id']) {
                    $skuPrice = GoodsSku::getSkuPrice($goods, $v['sku_id']);//获取规格价格
                    if ($skuPrice) {
                        $money = $this->getCouponMoney($coupon, $v['num'], $skuPrice, $v['goods_id']);
                        $all_money += ($money-$ptPrice['price']);
                    }
                } else {
                    $money = $this->getCouponMoney($coupon, $v['num'], $goods['price'], $v['goods_id']);
                    $all_money += ($money-$ptPrice['price']);
                }
            }
            if ($all_money < $coupon['full']) {
                throw new OrderException(['msg' => '优惠券使用错误']);
            }
            $coupon->save(['status' => 1]);
            Log::error( $coupon['reduce']);
            return $coupon['reduce'];
        }
        return 0;
    }
    //计算价格
    private function getCouponMoney($coupon, $num, $price, $goods_id)
    {
        $total_money = 0;
        if ($coupon['goods_ids'] != 0) {
            $coupon_ids = explode(',', $coupon['goods_ids']);
            if (in_array($goods_id, $coupon_ids)) {
                $money = $price * $num;
                $total_money += $money;
            }
        } else {
            $money = $price * $num;
            $total_money += $money;
        }
        return $total_money;
    }
    /**
     * 组装普通商品订单的 商品数据
     * @param $order_id
     * @param $post
     * @param $goods
     * @param $uid
     * @return array
     */
    public function setOrderGoods($order_id, $post, $goods, $uid)
    {
        $data['order_id'] = $order_id;
        $data['goods_id'] = $goods['goods_id'];
        $data['goods_name'] = $goods['goods_name'];
        $data['sku_id'] = $post['sku_id'] ? $post['sku_id'] : 0;
        if ($post['sku_id']) {
            foreach ($goods['sku'][0]['json']['list'] as $key => $value) {
                if ($value['id'] == $post['sku_id']) {
                    $data['price'] = $value['price'] - $goods['pt_goods']['price'];
                    $data['sku_name'] = (array_key_exists('s1_name', $value) ? $value['s1_name'] : '')
                        . ' ' . (array_key_exists('s2_name', $value) ? $value['s2_name'] : '')
                        . ' ' . (array_key_exists('s3_name', $value) ? $value['s3_name'] : '');
                }
            }
        } else {
            $data['price'] = $goods['price'] - $goods['pt_goods']['price'];
        }
        $data['num'] = $post['num'];
        $data['cost_price'] = $goods['cost_price'];
        $data['total_price'] = $data['price'] * $data['num'];
        $data['pic_id'] = $goods['img_id'];  //商品图片ID
        $data['user_id'] = $uid;  //商品图片ID
        return $data;
    }
}