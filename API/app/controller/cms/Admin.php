<?php

namespace app\controller\cms;


use app\model\AuthGroupAccess;
use app\model\Teacher;
use app\service\ValidataService;
use ruhua\bases\BaseController;
use app\service\CmsTokenServe;
use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;
use app\model\Admin as AdminModel;


class Admin extends BaseController
{
    /**
     *管理员登录
     **/
    public function login()
    {
        $post = input('post.');
        $rule = [
            'username' => 'require',
            'password' => 'require',
        ];
        $this->validate($post, $rule);
        return (new CmsTokenServe())->loginService($post['username'],$post['password']);
    }

    /**管理员修改密码
     * @return mixed
     * @throws BaseException
     */
    public function edit_psw()
    {
        $aid=TokenService::getCurrentAId();
        $data=input('post.');
        (new ValidataService())->editpswValidata($data);
        $admin=AdminModel::find($aid);
        if($admin['password']!=password($data['old_password']))
            throw new BaseException(['msg'=>'旧密码错误']);
        $res=$admin->save(['password'=>password($data['new_password'])]);
        if($res)
        {
            return app('json')->success();
        }
        return app('json')->fail();
    }

    public function add_admin()
    {
        $data=input('post.');
        (new ValidataService())->adminValidata($data);
        $admin=AdminModel::where(['username'=>$data['username']])->find();
        if($admin)
            throw new BaseException(['msg'=>'账号已存在']);
        $res=AdminModel::createAdmin($data);
        return app('json')->go($res);

    }

    //获取所有管理员
    public function getAdmin_all()
    {
        $res=AdminModel::with(['autogroupaccess.autogroup','teacher'])->where('state',0)->select();
        $data=[];
        $i=0;
        foreach ($res as $v){
            $data[$i]=$v;
            $data[$i]['group_id']=$v['autogroupaccess']['group_id'];
            $data[$i]['group']=json_decode(json_encode($v['autogroupaccess']['autogroup']),TRUE);
            unset($data[$i]['autogroupaccess']);
            $i++;
        }
        if(!$data){
            return app('json')->fail('没有数据！');
        }
        return app('json')->go($data);
    }

    //删除管理员
    public function del_admin($id)
    {
        $data=AdminModel::deleteAdmin($id);
        return app('json')->go($data);
    }


    //更新管理员信息
    public function up_admin($form)
    {
        $data=AdminModel::updateAdmin($form);
        if($form['gid'])
            AuthGroupAccess::update(['group_id'=>$form['gid'],'nickname'=>$form['nickname']],['aid'=>$form['id']]);
        return app('json')->go($data);
    }

    public function getCmsIndexData()
    {
        $data=[
            'teacher'=>Teacher::count(),
            'student'=>\app\model\Student::count(),
            'class'=>\app\model\Classes::count(),
            'course'=>\app\model\Course::count()
        ];
        return app('json')->go($data);
    }


}