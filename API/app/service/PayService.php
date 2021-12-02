<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/2/20 0020
 * Time: 9:36
 */

namespace app\service;
use app\model\Order as OrderModel;
use app\model\PtItem;
use EasyWeChat\Factory;
use app\model\SysConfig as SysConfigModel;
use ruhua\exceptions\BaseException;
use app\model\User as UserModel;
use think\facade\Log;
use ruhua\services\TokenService;

class PayService
{
    private $config=[];
    private $app;
    public function __construct()
    {

        $this->config=[
            'app_id'             =>SysConfigModel::get('wx_app_id'),
            'mch_id'             => SysConfigModel::get('pay_num'),
            'key'                => SysConfigModel::get('pay_key'),   // API 密钥
            'notify_url'         => '/vip/vip_pay_back',     // 你也可以在下单时单独设置来想覆盖它
        ];
        $app = Factory::payment($this->config);
        $this->app=$app;
    }
    

    
    
    public function gzh_playConfig(){
        $arr['gzh_appid']=SysConfigModel::get('gzh_appid');
        $arr['pay_num']=SysConfigModel::get('pay_num');
        $arr['pay_key']=SysConfigModel::get('pay_key');
        $arr['api_url']=SysConfigModel::get('api_url');
        //dump($system);
        $config = [
            // 必要配置

            'app_id'             => $arr['gzh_appid'],
            'mch_id'             => $arr['pay_num'],
            'key'                => $arr['pay_key'],   // API 密钥

            // 如需使用敏感接口（如退款、发送红包等）需要配置 API 证书路径(登录商户平台下载 API 证书)
            'cert_path'          => '/cert/apiclient_cert.pem', // XXX: 绝对路径！！！！
            'key_path'           => '/cert/apiclient_key.pem',      // XXX: 绝对路径！！！！
            //'sandbox' => true,//沙盒模式
            'notify_url'         => $arr['api_url'].'/order/order_back',     // 你也可以在下单时单独设置来想覆盖它
        ];

        $payment =Factory::payment($config);
        //$jssdk = $payment->jssdk;
        return $payment;
    }



    public function playConfig_back(){


        $this->config=[
            'app_id'             =>SysConfigModel::get('wx_app_id'),
            'mch_id'             => SysConfigModel::get('pay_num'),
            'key'                => SysConfigModel::get('pay_key'),   // API 密钥
            'notify_url'         => '/vip/vip_pay_back',     // 你也可以在下单时单独设置来想覆盖它
        ];
        $payment =Factory::payment($this->config);

        //$jssdk = $payment->jssdk;
        return $payment;
    }





}