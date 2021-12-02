<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 8:56
 */

namespace app\controller\cms;


use app\service\ValidataService;
use ruhua\bases\BaseController;
use app\model\Article as ArticleModel;
use ruhua\exceptions\BaseException;
use think\facade\Db;

class Article extends BaseController
{


    /**发布文章
     * @return mixed
     */
    public function add_article()
    {
        $data=input('post.');
        $data=(new ValidataService())->articleValidata($data);
        $res=ArticleModel::create($data);
        return app('json')->go($res);

    }

    /**编辑文章
     * @return mixed
     */
    public function edit_article()
    {
        $data=input('post.');
        if(isset($data['create_time']))
            unset($data['create_time']);
        (new ValidataService())->articleValidata($data);
        $res=ArticleModel::update($data,['id'=>$data['id']]);
        return app('json')->go($res);

    }

    /**删除文章
     * @param $id
     */
    public function del_article($id)
    {
        $res=ArticleModel::destroy($id);
        return app('json')->go($res);
    }

    /**查询文章
     * @param string $id
     */
    public function get_article($id="",$tui="",$type="")
    {
        if($tui!=""){
            $res=ArticleModel::with('img')->where(['is_tui'=>1])->select();
            return app('json')->go($res);
        }

        if($type!=""){
            $res=ArticleModel::with('img')->where(['type'=>$type])->select();
            return app('json')->go($res);
        }


        if($id=="")
            $res=ArticleModel::with('img')->order('id desc')->select();
        else{
            $res=ArticleModel::with('img')->where(['id'=>$id])->find();
            ArticleModel::update(['reading_volume'=>($res['reading_volume']+1)],['id'=>$id]);
        }

        return app('json')->go($res);
    }

    /**获取回收站文章
     * @return mixed
     */
    public function get_delete_article()
    {
        $res=ArticleModel::onlyTrashed()->select();
        return app('json')->go($res);
    }

    /**恢复被删除文章
     * @param $id
     */
    public function recieve_article()
    {
        $id=input('post.');

        Db::startTrans();// 启动事务
        try {
            foreach ($id as $k=>$v){
                $res=ArticleModel::onlyTrashed()->find($v);
                $res=$res->restore();
            }

            Db::commit();
        } catch (\Exception $e) {
            Db::rollback(); // 回滚事务
            throw new BaseException(['msg'=>$e->getMessage()]);
            //return false;
        }
        return app('json')->go($res);

    }




}