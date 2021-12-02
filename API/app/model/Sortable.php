<?php


namespace app\model;


use ruhua\bases\BaseModel;

class Sortable extends BaseModel
{
    //查询
    public static function getAll(){
        $get = input('get.');
        if(isset($get['id'])){
            $res = self::where('id',$get['id'])->select();
            return  app('json')->go($res);
        }
        $res = self::select();
        return app('json')->go($res);
    }

    //修改 sortable
    public static function updateSortable($id,$sortable,$json,$bg_img){
        $res = self::update(['sortable'=>$sortable,'json'=>$json,'bg_img'=>$bg_img],['id'=>$id]);
        return app('json')->go($res);
    }
    //修改 page_
    public static function updatePage($id,$page_name,$page_background_color,$json,$bg_img){
        $res = self::update(['page_name'=>$page_name,'page_background_color'=>$page_background_color,'json'=>$json,'bg_img'=>$bg_img],['id'=>$id]);
        return app('json')->go($res);
    }

    public function getJsonAttr($value)
    {
        return json_decode($value);
    }

    public function setJsonAttr($value)
    {
        return json_encode($value);
    }
    public function getAttrs($id){
        $s = self::where('id',$id)->find();
        return $s->sortable;
    }
    public function createAttr(){
        $attr = input("param.");
        return self::create($attr);
    }
    public function getPageType(){
        return self::select();
    }
    public function getOnePage(){
        $id = input("param.id");
        return self::where("id",$id)->find();
    }
    public function saveOnePage(){
        $id = input("param.id");
        $arr = input("param.arrs");
        $page = self::where("id",$id)->find();
        $a = json_encode($arr);
        $page->sortable = $a;
        return $page->save();
    }
    public function deleteOnePage(){
        $id = input("param.id");
        $page = self::where("id",$id)->find();
        return $page->delete();
    }
    public function setPage(){
        $page = input('param.');
        $pages = self::where('id',$page['id'])->find();
        $pages['page_name'] = $page['page_name'];
        $pages['page_background_color'] = $page['page_background_color'];
        return $pages->save();
    }
}