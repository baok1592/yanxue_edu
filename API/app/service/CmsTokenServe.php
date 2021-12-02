<?php
namespace app\service;

use app\model\Admin as AdminModel;
use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;
use think\facade\Log;
use think\facade\Request;
use ruhua\enum\ScopeEnum;
use app\model\AuthGroupAccess as AuthGroupAccessModel;
use app\model\AuthRule as AuthRuleModel;

class CmsTokenServe extends TokenService
{
    private $rule;
    //登陆，并返回token
    public function loginService($user,$pwd){
        $password = password($pwd);    //common文件的函数
        $where['username']=$user;
        $where['password']=$password;
        $user = AdminModel::where($where)->find();
        if(!$user){
            throw new BaseException(['msg'=>'账号或密码错误！']);
        }
        if($user->state == 1){
            throw new BaseException(['msg'=>'已禁用']);
        }
        $cachedValue = $this->setWxCache($user);
        $res['token'] = $this->saveCache($cachedValue);
        $res['nickname']=$user->nickname;
        $res['rule']=$this->rule;
        $wq=config('setting.wq');
        if($wq==1){
            $res['rule']=AuthRuleModel::where(['name'=>null])->column('brief');  //如果是微擎版本赋予全部权限
        }
        $user->save(['ip'=>Request::ip(),'login_time'=>time()]);
        return app('json')->go($res);
    }

    //组合uid，username，权限
    private function setWxCache($user){
        $cache['admin_id'] = $user['id'];
        $auth=AuthGroupAccessModel::with(['autogroup'])->where(['aid'=>$user['id']])->find();
        $rules=$auth['autogroup']['rules'];
        $rules_name=explode(',',$rules);
        $rules=AuthRuleModel::where(['id'=>$rules_name])->column('name');
        $rule=AuthRuleModel::where(['id'=>$rules_name,'name'=>null])->column('brief');
        $this->rule=$rule;
        $rules=json_encode($rules);
        $cache['rules']=$rules;
        $cache['ucid']=$user['ucid'];
        $cache['username'] = $user['username'];
        $cache['uniacid'] = $user['uniacid'];
        $cache['tid']=$user['tid'];
        $cache['scope'] = ScopeEnum::Root;  // scope=16 代表App用户的权限数值

        return $cache;
    }
}