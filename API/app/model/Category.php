<?php


namespace app\model;


use ruhua\exceptions\BaseException;
use app\model\Category as CategoryModel;
use ruhua\bases\BaseModel;
use think\model\concern\SoftDelete;

class Category extends BaseModel
{
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    public function setImgAttr($v)
    {
        return $v['url'];
    }

    public function getJsonAttr($value)
    {
        return json_decode($value);
    }

    public function Article()
    {
        return $this->hasMany('Article','category_id','category_id')->field('id,short_title,category_id,title,img_id,author,summary,source,create_time');
    }

    public function kids()
    {
        return $this->hasMany('Category','pid','category_id');
    }

    public static function getCategoryAll()
    {
        $res=self::with('kids')->order('sort desc')->select()->toArray();
        return $res;
    }

    public static function deleteCategory($id)
    {
        $category=self::where('category_id',$id)->find();
        if(!$category)
            throw new BaseException(['msg'=>'无该栏目！']);
        $pids=self::where('pid',$id)->find();
        if($pids){
            throw new BaseException(['msg'=>'请先删除子栏目！']);
        }
        $category->delete();
        return 1;
    }

    public static function updateCategory($form)
    {
        if($form['pid']==0){
            $form['level']=1;
        }else{
            $form['level']=2;
        }
        $form['json']=json_encode($form['json'],JSON_UNESCAPED_UNICODE);
        $res =self::update($form,['category_id'=>$form['category_id']]);
        if($res){
            return 1;
        }
        return 0;
    }

    public static function createCategory($form)
    {
        if($form['pid']==0){
            $form['level']=1;
        }else{
            $form['level']=2;
        }
        $form['sort']=0;
        $form['json']=json_encode($form['json'],JSON_UNESCAPED_UNICODE);
        $res = self::create($form);
       return $res;
    }

    public static function upCategorySort()
    {
        $arr=input('post.');
        if(!is_array($arr)){
            return 0;
        }
        $cate=new CategoryModel;
        foreach ($arr as $k=>$v){
            $cate->where('category_id',$k)->update(['sort' => $v]);
        }
        return 1;
    }

}