<?php

/**
 * 如花商城系统
 * =========================================================
 * 官方网址：http://www.ruhuashop.com
 * QQ 交流群：728615087
 * Version：1.2.0
 */

namespace app\http\middleware;

//中间件，验证token，检测权限

use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;
use think\facade\Request;
use qy\auth\Auth;
use think\facade\Log;
use app\model\AuthRule as AuthRuleModel;

class CheckCms
{
    public function handle($request, \Closure $next)
    {
        $aid = TokenService::getCurrentAid();
        $rule = Request::url();
        if(strchr($rule,'?'))
            $rule=substr($rule,0,strripos($rule,'?'));
       // $data = (new Auth())->check($rule,$aid);
        $rules=TokenService::getCurrentRules();
        $rules=json_decode($rules);
        $data=false;
        foreach ($rules as $k=>$v){
            if($v==$rule)
            {
                $data=true;
                break;
            }
        }
        $res=AuthRuleModel::where(['name'=>$rule])->find();
        $wq=config('setting.wq');
        if ( $data == true||!$res||$wq==1) {
            return $next($request);
        }
        return app('json')->fail('没有权限');

    }
}