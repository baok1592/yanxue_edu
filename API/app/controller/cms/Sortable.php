<?php


namespace app\controller\cms;

use app\model\Sortable as SortableModel;
use app\model\SysConfig;
use ruhua\bases\BaseController;



class Sortable extends BaseController
{
    //查询
    public function getAll(){

        return SortableModel::getAll();
    }
    //添加
    public function addSor(){
        $post = input('post.');
        $res = SortableModel::create($post);
        return app('json')->go($res);
    }
    //删除
    public function delSor($id){
        $res = SortableModel::where('id',$id)->delete();
        return app('json')->go($res);
    }
    //修改 sortable
    public function updateSortable(){
        $post = input('post.');
        $data['id'] = $post['id'];
        $data['sortable'] = $post['sortable'];

        return SortableModel::updateSortable($data['id'],$data['sortable'],$post['json'],$post['bg_img']);
    }
    //修改 page
    public function updatePage(){
        $post = input('post.');
        $data['id'] = $post['id'];
        $data['page_name'] = $post['page_name'];
        $data['page_background_color'] = $post['page_background_color'];

        return SortableModel::updatePage($data['id'], $data['page_name'], $data['page_background_color'],$post['json'],$post['bg_img']);
    }

    //查询页面主题
    public function getZt(){
        return SysConfig::getzt();
    }
    //修改页面主题
    public function upZt($value){
        return SysConfig::upzt($value);
    }
    public function save(){
        $res = (new SortableModel())->createAttr();
        if($res){
            return app('json')->go($res);
        }
    }
    public function getPageType(){
        $res = (new SortableModel())->getPageType();
        if($res){
            return app('json')->go($res);
        }
    }
    public function getOnePage(){
        $res = (new SortableModel())->getOnePage();
        if($res){
            return app('json')->go($res);
        }
    }
    public function saveOnePage(){
        $res = (new SortableModel())->saveOnePage();
        if($res){
            return app('json')->go($res);
        }
    }
    public function deleteOnePage(){
        $res = (new SortableModel())->deleteOnePage();
        if($res){
            return app('json')->go($res);
        }
    }
    public function setPage(){
        $res = (new SortableModel())->setPage();
        if($res){
            return app('json')->go($res);
        }
    }

}