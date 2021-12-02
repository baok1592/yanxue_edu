<?php
namespace app\controller\user;
use app\model\BindTeacher;
use app\model\Student;
use ruhua\bases\BaseController;
use app\service\XcxService;
use app\model\User as UserModel;
use ruhua\services\TokenService;
use think\facade\Log;
use WxCode\demoWxCode;
use app\model\Teacher as TeacherModel;
use app\service\XcxService as app;
use app\model\SysConfig as SysConfigModel;
use app\model\SysConfig;
use Firebase\JWT;

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/29 0029
 * Time: 8:46
 */
class Auth extends BaseController
{
    
    
    //公众号获取code
    public function getcode($ucid=0){
        $response = (new app())->gzh($ucid)->oauth->redirect();
        return $response->send();
    }
    
    
        //公众号登录
    public function gzhLogin(){
        $token['token']=$this->gzh_Login();
        $api_url = SysConfig::where('key', 'api_url')->value('value');
        $api_url.="/h5";
        $wq=config('setting.wq');
        if($wq==1){
            $api_url=str_replace("index.php/","",$api_url);
        }
        return "<script>localStorage.setItem('token','{$token['token']}');window.location.href='$api_url';</script>";
    }
    
    public function gzh_Login()
    {
        $user=(new app())->gzh()->oauth->user();
        $data['openid']=$user->getId();
        return $this->gzh_grantToken($user);
    }
    
    public function gzh_grantToken($user)
    {
        $openid=$user->getId();
        $dt=UserModel::where('openid_gzh',$openid)->find();
        if(!$dt){
            $data=[
                'openid_gzh'=>$openid,
                'openid'=>$openid,
                'nickname'=>$user->getNickname(),
                'headpic'=>$user->getAvatar(),
                'invite_code'=>rand(1000000,9999999)
            ];
            $dt=UserModel::create($data);
        }
        $user['openid']=$openid;
        $cachedValue = $this->setWxCache($user, $dt['id']);
        $token = (new TokenService())->saveCache($cachedValue);
        return $token;
    }
    
        //组合uid，openid，权限
    private function setWxCache($wxResult, $uid)
    {
        $user=UserModel::find($uid);
        $cache['uid'] = $uid;
        $cache['web_auth']=$user['web_auth'];
        $cache['scope'] = 9;
        $cache['openid']=$wxResult['openid'];
        /*if($user['web_auth']>0){
            $rule=$this->get_rule_auth($user['group_id']);
            $cache['rule']=$rule['rule'];
            $cache['group']=$user['group_id'];
        }*/
        return $cache;
    }
    
        //放入缓存
    public function saveCache($cachedValue)
    {
        $key = '344'; //key，唯一标识
        $time = time(); //当前时间
        $token = [
            'iat' => $time, //签发时间
            'nbf' => $time , //(Not Before)：某个时间点后才能访问，比如设置time+30，表示当前时间30秒后才能使用
            'exp' => $time+7200, //过期时间,这里设置2个小时
            'data' => $cachedValue
        ];
        $token = JWT\JWT::encode($token, $key,'HS256'); //签发token
        //Cache::put($token,$data);
        return $token;
    }
    
    
    /********************  小程序 ↓  ************************/
    /*
        * 用途：将“openid，uid，权限”存入缓存value，生成一个token做缓存的key并返回
        * 1、获取code
        * 2、组合code,Appid与Secret生成URL，
        * 3、curl方式向微信服务器提交，获取openid;注意一个code只能使用一次
        * 4、判断openid，数据库不存在则写入；从数据库获取该openid的用户UID
        * 5、生成token，token是一个随机字符串，它是缓存的key；将“openid，uid，权限”存入缓存value
        * 6、返回token
        */
    public function getXcxToken($code,$ucid=0)
    {
        $xcx=(new XcxService($ucid))->login($code);
        Log::error($xcx);
        $user=UserModel::where('openid',$xcx['openid'])->find();
        if(!$user){
            $user=UserModel::create($xcx);
        }
        $teacher=TeacherModel::where(['uid'=>$user['id']])->find();
        $student=Student::where(['uid'=>$user['id']])->find();



        $cache=[
            'uid'=>$user['id'],
            'job'=>$user['job'],
            'session_key'=>$xcx['session_key']
        ];
        if($ucid!=''){
            $wxResult['ucid']=$ucid;
        }else{
            $wxResult['ucid']="";
        }
        if($teacher){
            $cache['tid']=$teacher['id'];
        }else{
            $cache['tid']=0;
        }

        if($student){
            $cache['stu_id']=$student['id'];
        }else{
            $cache['stu_id']=0;
        }
        $token=(new TokenService())->saveCache($cache);
        //教师分销
        $xcx['invite_code']=$this->create_code();
        $xcx['qrcode_xcx']=(new XcxService($ucid))->xcx_code($xcx['invite_code'],$user['id']);
        $user->save(['invite_code'=>$xcx['invite_code'],'qrcode_xcx'=>$xcx['qrcode_xcx']]);

        return app('json')->go(['token'=>$token]);
    }

    public function xcx_upinfo($nickname, $headpic)
    {
        $uid = TokenService::getCurrentUid();
        $res=UserModel::update(['nickname' => $nickname, 'headpic' => $headpic],['id'=>$uid]);

        return app('json')->go($res);
    }

    public function is_token($token)
    {
        $res=TokenService::verifyToken($token);
        return app('json')->go(['data'=>$res]);
    }


    public function bindwWxMobile()
    {
        $post=input('post.');
        $uid=TokenService::getCurrentUid();
        $session_key = TokenService::getCurrentTokenVar('session_key');
        $data = (new demoWxCode())->decryptData($post['encryptedData'], $post['iv'], $session_key);
        if (isset($data['phoneNumber'])) {
            $data['mobile']=$data['phoneNumber'];

            $bind_teacher=BindTeacher::where(['mobile'=>$data['phoneNumber']])->find();
            if($bind_teacher){
                $bind_teacher->save(['uid'=>$uid]);
               $data['job']=1;
            }
            $res=UserModel::update($data,['id'=>$uid]);
            return app('json')->go($res);
        }
        return app('json')->success($data);
    }

    /**
     * 生成身份码
     */
    public function create_code()
    {
        $codes=UserModel::column('invite_code');
        while(true){
            $code=rand(1000000,9999999);
            if(!in_array($code,$codes))
                return $code;
        }

    }

}