<?php


namespace app\controller\cms;


use app\model\Pt as PtModel;
use app\model\PtGoods as PtGoodsModeL;
use ruhua\bases\BaseController;

class Pt extends BaseController
{
    /**
     * 添加拼团活动
     */
    public function add_pt()
    {
        $post=input('post.');
        return PtModel::addPt($post);

    }

    /**
     * 修改拼团活动
     */
    public function editPt()
    {
        $post = input('post.');
        return PtModel::editPt($post);
    }

    /**
     * 删除拼团活动
     * @param $id
     * @return mixed
     */
    public function deletePt($id = '')
    {
        return PtModel::deletePt($id);
    }

    /**
     * 获取拼团活动
     * @return mixed
     */
    public function getPt()
    {
        $res = PtModel::with('ptGoods.goods.img')->select();
        return app('json')->go($res);
    }


    /**
     *  获取拼团商品
     * @param $type
     * @return mixed
     */
    public function getPtGoods($type)
    {
        $res = PtGoodsModeL::getAllPtGoods($type);
        return app('json')->success($res);
    }







}