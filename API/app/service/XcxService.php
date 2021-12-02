<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/2/27 0027
 * Time: 8:39
 */

namespace app\service;
use app\model\SysConfig as SysConfigModel;
use app\model\SysConfig;
use app\model\User;
use EasyWeChat\Factory;
use ruhua\services\TokenService;
use think\facade\Log;
use think\facade\Request;

class XcxService
{
    private $config=[
        'app_id' => '',
        'secret' => '',

    ];

    public function __construct($ucid=0)
    {
        $wq=config('setting.wq');

        if($wq==0){
            $config=[
                'app_id'=>SysConfigModel::get('wx_app_id'),
                'secret'=>SysConfigModel::get('wx_app_secret'),
                'response_type'=>'array',
                'log' => [
                    'level' => 'debug',
                    'file' => __DIR__.'/wechat.log',
                ],
            ];
        }else{
            $config=[
                'app_id'=>SysConfigModel::wqGet('wx_app_id',$ucid),
                'secret'=>SysConfigModel::wqGet('wx_app_secret',$ucid),
                'response_type'=>'array',
                'log' => [
                    'level' => 'debug',
                    'file' => __DIR__.'/wechat.log',
                ],
            ];
        }

        $this->config=$config;
    }

    public function login($code)
    {
        Log::error($this->config);
        $app = Factory::miniProgram($this->config);
        return $app->auth->session($code);
    }
    
    public function gzh($ucid){
        $wq=config('setting.wq');
        if($wq==0){
            $appid = SysConfig::where('key', 'gzh_appid')->value('value');
            $secret = SysConfig::where('key', 'gzh_secret')->value('value');
            $url='/weixin/get_gzh_token';
        }else{
            $appid = SysConfig::where(['key'=>'gzh_appid','ucid'=>$ucid])->value('value');
            $secret = SysConfig::where(['key'=> 'gzh_secret','ucid'=>$ucid])->value('value');
            $url='/addons/qy_wmdcs/tp6/public/index.php/weixin/get_gzh_token?ucid='.$ucid;
        }

        $config = [
        'app_id' => $appid,
        'secret' => $secret,
            // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
        'response_type' => 'array',
        'oauth' => [
            'scopes'   => ['snsapi_userinfo'],
            'callback' => $url,
            ],
        ];

        $app = Factory::officialAccount($config);
        return $app;
    }

    public function xcx_code($code,$uid="")
    {
        $wx_appid=SysConfigModel::get('wx_app_id');

        if($uid=="")
            $uid=TokenService::getCurrentUid();
        $name=User::where(['id'=>$uid])->value('name');

        if($wx_appid){
            $app=Factory::miniProgram($this->config);
            //教师分销功能
            $xcx=$app->app_code->getQrCode('/pages/details/teachercms/form/index?type=teacher_code&code='.$code."&id={$uid}&name={$name}");
            if ($xcx instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
                $filexcx = $xcx->saveAs(ROOT.'/uploads/img', $code."xcxcode.png");
                $code_url="/uploads/img/".$code."xcxcode.png";
            }
        }else{
            $code_url="";
        }
        return $code_url;
    }

    public function get_xcx_code()
    {

        $app = Factory::miniProgram($this->config);
        $response = $app->app_code->get('pages/index/index');
        if ($response instanceof \EasyWeChat\Kernel\Http\StreamResponse) {
            $filename = $response->saveAs(ROOT."/uploads/img", 'xcx_code.png');
        }
        return ['url'=>Request::domain()."/uploads/img/".$filename];
    }



}