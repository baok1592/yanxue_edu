<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/26 0026
 * Time: 16:40
 */

namespace app\controller\cms;


use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use think\Exception;
use think\facade\Filesystem;
use app\model\Image as ImageModel;
use think\facade\Log;


class Image extends BaseController
{
    /**图片上传
     * @return mixed
     * @throws BaseException
     */
    public function upload_img()
    {

        $file=request()->file('img');
        $data=input('post.');
        $up_data=array();
        if(isset($data['category_id']))
            $up_data['category_id']=$data['category_id'];
        $filename=$file->getOriginalExtension();

        if($filename!="jpg"&&$filename!="jpeg"&&$filename!="png"&&$filename!="gif"){
            throw new BaseException(['msg'=>'非图片上传']);

        }
        try{
            $savename=Filesystem::disk('public')->putFile('img',$file,'data');
            $savename= $img=str_replace("\\",'/',$savename);
            $up_data['url']="/uploads/".$savename;
            $res=ImageModel::create($up_data);
            return app('json')->go($res);
        }catch(Exception $e){

            throw new BaseException(['msg'=>$e->getMessage()]);
        }
    }

    /**获取全部图片
     * @param string $cid
     * @return mixed
     */
    public function get_all_image($cid="")
    {
        if($cid=="")
            $res=ImageModel::select();
        else
            $res=ImageModel::where(['category_id'=>$cid])->select();
        return app('json')->go($res);
    }

    /**删除图片
     * @return mixed
     */
    public function delete_img()
    {
        $ids=input('post.ids');
        $image=ImageModel::where(['id'=>$ids])->column('url');
        /*foreach ($image as $k=>$v){
            if(!unlink(ROOT.$v)){
                Log::error("删除失败");
            }
        }*/
        $res=ImageModel::where(['id'=>$ids])->delete();
        return app('json')->go($res);

    }

}