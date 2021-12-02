<?php
namespace app\controller\common;
use app\service\ValidataService;
use ruhua\bases\BaseController;
use app\model\Banner as BannerModel;


class Banner extends BaseController
{
    /**添加广告图
     * @return mixed
     */
    public function add_banner()
    {
        $data=input('post.');
        (new ValidataService())->bannerValidata($data);
        $res=BannerModel::create($data);
        return app('json')->go($res);
    }

    /**编辑广告图
     * @return mixed
     */
    public function edit_banner()
    {
        $data=input('post.');
        (new ValidataService())->bannerValidata($data);
        $res=BannerModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);
    }

    /**删除广告图
     * @param $id
     */
    public function del_banner($id)
    {
        $res=BannerModel::destroy($id);
        return app('json')->go($res);
    }

    public function set_sort()
    {
        $data=input('post.');
        $arr=array();
        foreach ($data as $k=>$v)
        {
            $dt['id']=$k;
            $dt['sort']=$v;
            $arr[]=$dt;
        }
        $res=(new BannerModel())->saveAll($arr);
        return app('json')->go($res);
    }

    /**
     * 查看广告图
     */
    public function get_banner($id="")
    {
        $res=BannerModel::with(['img','article','teacher','course'])->order('sort asc')->select();
        foreach ($res as $k=>$v){
            switch ($v['type']){
                case 0:
                    $res[$k]['jump_name']='';
                    break;
                case 1:
                    $res[$k]['jump_name']=$v['article']['title'];
                    break;
                case 2:
                    $res[$k]['jump_name']=$v['teacher']['name'];
                    break;
                default:
                    $res[$k]['jump_name']=$v['course']['name'];
                    break;
            }
            unset($res[$k]['article']);
            unset($res[$k]['teacher']);
            unset($res[$k]['course']);
        }

        if($id!="")
            $res=BannerModel::with('img')->where('id',$id)->find();
        return app('json')->go($res);

    }
}