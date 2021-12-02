<?php


namespace app\controller\cms;
use app\model\Category as CategoryModel;
use app\validate\IDPostiveInt;
use app\validate\CategoryValidate;
use ruhua\bases\BaseController;
use app\model\SysConfig;

class Category extends BaseController
{
    //获取所有栏目并排好序，包括隐藏
    public function get_categorySort()
    {
        $data=CategoryModel::getCategoryAll();
        return app('json')->go($data);
    }

    //删除栏目
    public function del_category($id)
    {
        (new IDPostiveInt)->goCheck();
        $type=CategoryModel::where(['category_id'=>$id])->value('type');
        $result = CategoryModel::deleteCategory($id);
      //  $this->del_zhizhu($id,$type);
        return app('json')->go($result);
    }

    //更新栏目
    public function up_category($form)
    {
        (new CategoryValidate)->goCheckArray();
        $data=CategoryModel::updateCategory($form);
        return app('json')->go($data);
    }

    //新增栏目
    public function add_category($form)
    {
        $data = CategoryModel::createCategory($form);

     //   $this->zhizhu($data['id'],$data['type']);

        return app('json')->go($data);
    }

    //更新栏目排序
    public function up_category_sort()
    {
        $data=CategoryModel::upCategorySort();
        return app('json')->go($data);
    }

    //CMS获取发文章的所有栏目
    public function article_category_list(){
        $list=CategoryModel::where(['pid'=>0,'type'=>[0,1]])->select();
        return app('json')->go($list);
    }
    //根据id获取栏目信息
    public function getCategory($id){
        $data=CategoryModel::where('category_id',$id)->find();
        return app('json')->go($data);
    }

    private function is_create()
    {
        $sitemap_url=ROOT."/Sitemap.txt";
        if(!file_exists($sitemap_url)){
            $myfile = fopen($sitemap_url, "w") or die("Unable to open file!");
            fclose($myfile);
        }

        return $sitemap_url;

    }


    private function zhizhu($id,$type)
    {
        $is=SysConfig::get('baidu_sj');
        $sitemap_url=ROOT."/Sitemap.txt";
        if($is==0)
            return;
        $token=SysConfig::get('zhizhu_token');
        $site=SysConfig::get('site');
        $url="http://data.zz.baidu.com/urls?site={$site}&token={$token}";

        $urls=array("http://{$site}/pc_{$type}.html?cid={$id}");
        $res=curl_post_baidu($url,$urls);
        if(!file_exists($sitemap_url)){
            $myfile = fopen($sitemap_url, "w") or die("Unable to open file!");
            fclose($myfile);
        }

        $handle=fopen($sitemap_url,"a+");
        $str=fwrite($handle,$urls[0]."\r\n");
        fclose($handle);
    }


    public function del_zhizhu($id,$type)
    {
        $site=SysConfig::get('site');
        $sitemap_url=$this->is_create();
        if(file_exists($sitemap_url)){
            $fp = fopen($sitemap_url,"a+");
            $file_size = filesize($sitemap_url);
            $str = fread($fp,$file_size);
            $res_new = str_replace("http://{$site}/pc_$type.html?cid={$id}\r\n","",$str);
            file_put_contents($sitemap_url,$res_new);
            fclose($fp);


        }
    }


}