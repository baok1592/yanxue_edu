<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/27 0027
 * Time: 9:34
 */

namespace app\controller\common;


use app\service\XcxService;
use ruhua\bases\BaseController;
use ruhua\exceptions\BaseException;
use think\facade\Db;
use think\facade\Log;
use app\model\Course as CourseModel;
use app\model\User as UserModel;
use app\model\Article as ArticleModel;
use app\model\SysConfig as SysConfigModel;
use app\model\Message as MessageModel;
use app\model\Teacher as TeacherModel;
use Uedit\controller as Contro;

class Common extends BaseController
{
    private $table=[
        'article',
        'teacher',
        'course'
    ];

    private $field=[
      'is_hidden',
        'is_tui',
        'buy'
    ];


    public function cms_set_state($table,$field,$state,$id)
    {
        if(in_array($table,$this->table)&&in_array($field,$this->field))
            $res=Db::name($table)->where('id',$id)->update([$field=>$state]);
        else
            throw new BaseException(['msg'=>'错误']);
        return app('json')->go($res);
    }


    /**课程搜索
     * @param $key
     */
    public function search_course($key)
    {
        $res=CourseModel::with(['pro','teachers','img'])->where('name','like',"%$key%")->where(['is_down'=>0])->select();
        return app('json')->go($res);
    }
    
      /**
     *
     * @return mixed
     */
    public function ue_uploads()
    {
        $ue = new Contro;

        $res = $ue->show();
        return $res;
    }


    /**
     * 前端获取配置信息
     */
    public function get_sys()
    {
        $res=SysConfigModel::where(['key'=>['merge_mode','title','copyright']])->field('key,value,desc')->select();
        return app('json')->go($res);
    }



    /**
     * 获取首页信息
     */
    public function get_index_data()
    {
        $data['teacher']=TeacherModel::with('labels')->where(['is_tui'=>1])->select();
        $data['course']=CourseModel::with(['pro','teachers','img'])->where(['is_tui'=>1,'is_down'=>0])->select();
        $data['article']=ArticleModel::with('img')->where(['is_tui'=>1,'is_hidden'=>0])->order('create_time desc')->select();
        return app('json')->go($data);

    }

    public function get_xcx_code()
    {
        $res=(new XcxService())->get_xcx_code();
        return app('json')->go($res);
    }

    public function message_read($id)
    {
        $res=MessageModel::update(['read'=>1],['id'=>$id]);
        return app('json')->go($res);
    }

    /**
     * 获取评测信息
     */
    public function get_pc_xls()
    {

    }








}