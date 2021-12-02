<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/26 0026
 * Time: 17:13
 */

namespace app\controller\cms;


use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use think\Exception;
use think\facade\Filesystem;
use app\model\Video as VideoModel;
use think\facade\Log;

class Video extends BaseController
{
    /**视频上传上传
     * @return mixed
     * @throws BaseException
     */
    public function upload_video()
    {

        $file=request()->file('file');
        $data=input('post.');
        $up_data['name']="视频";
        $filename=$file->getOriginalExtension();

        if($filename!="mp4"&&$filename!="avi"){
            throw new BaseException(['msg'=>'非视频文件']);
        }
        try{
            $savename=Filesystem::disk('public')->putFile('video',$file,'data');
            $savename= $img=str_replace("\\",'/',$savename);
            $up_data['url']="/uploads/".$savename;
            $res=VideoModel::create($up_data);
            return app('json')->go($res);
        }catch(\Exception $e){

            throw new BaseException(['msg'=>$e->getMessage()]);
        }
    }

    /**获取全部视频
     * @param string $cid
     * @return mixed
     */
    public function get_all_video()
    {

        $res=VideoModel::field('id,url,name')->select();
        return app('json')->go($res);
    }

    /**删除图片
     * @return mixed
     */
    public function delete_video()
    {
        $ids=input('post.ids');
        $image=VideoModel::where(['id'=>$ids])->column('url');
       /* foreach ($image as $k=>$v){
            if(!unlink(ROOT.$v)){
                Log::error("删除失败");
            }
        }*/
        $res=VideoModel::where(['id'=>$ids])->delete();
        return app('json')->go($res);

    }
}