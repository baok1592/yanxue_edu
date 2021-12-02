<?php


namespace app\controller\user;


use app\model\PtItem;
use app\service\PtOrderService;
use ruhua\services\TokenService;
use ruhua\bases\BaseController;

class Pt extends BaseController
{
    /**
     * 队长创建拼团订单
     * @return mixed
     */
    public function createPtItemOrder()
    {
        $post = input('post.');
        $this->validate($post, ['course_id' => 'require', 'price' => 'require', 'total_price' => 'require',
            'payment_type' => 'require']);
        $uid = TokenService::getCurrentUid();
        if ($post['payment_type'] == 'xcx') {
            return (new PtOrderService())->createWxOrder($post, $uid, 1);
        }
        if ($post['payment_type'] == 'wx') {
            $openid = TokenService::getCurrentTokenvar('openid');
            $res=(new PtOrderService())->createGzhOrder($post, $uid, $openid, 1);
            return $res;
        }

    }

    /**
     * 团员创建拼团订单
     * @return mixed
     */
    public function createPtOrder()
    {
        $post = input('post.');
        $this->validate($post, ['course_id' => 'require', 'price' => 'require', 'total_price' => 'require','item_id'=>'require',
            'payment_type' => 'require']);
        $uid = TokenService::getCurrentUid();
        if ($post['payment_type'] == 'wx') {
            $openid = TokenService::getCurrentTokenvar('openid');
            return (new PtOrderService())->createGzhOrder($post, $uid, $openid, 2);
        }
        if ($post['payment_type'] == 'xcx') {
            $res=(new PtOrderService())->createWxOrder($post, $uid, 2);
            return $res;
        }
    }

    /**
     * 获取拼团队伍
     * @param $id
     * @return \think\response\Json
     */
    public function getPtItem($id)
    {
        $res = PtItem::getItem($id);
        return $res;
    }

    /**
     * 获取某个拼团队伍
     * @param $id
     * @return \think\response\Json
     */
    public function getOnePtItem($id)
    {

        $res = PtItem::getoneItem($id);

        return $res;
    }

}