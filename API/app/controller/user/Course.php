<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/29 0029
 * Time: 14:28
 */

namespace app\controller\user;


use ruhua\bases\BaseController;
use ruhua\services\TokenService;
use app\model\Course as CourseModel;

class Course extends BaseController
{
    /**教师获取课程
     * @return mixed
     */
    public function t_get_course()
    {
        $uid=TokenService::getCurrentUid();
        $res=CourseModel::with(['pro.chird','teachers','img'])->where('teacher',$uid)->select();
        return app('json')->go($res);

    }
}