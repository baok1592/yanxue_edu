<?php


namespace app\controller\common;


use app\model\Image;
use ruhua\bases\BaseController;
use app\model\SysConfig as Sys;
use ruhua\exceptions\BaseException;
use think\facade\Log;

class Gj extends BaseController
{
    private $url="https://openapi.youdao.com/ocr_question_page";
    private $app_key;
    private $sec_key;
    private $curl_timeout=2000;

    public function __construct()
    {
        $this->app_key=Sys::get('yd_id');
        $this->sec_key=Sys::get('yd_key');
    }


    public function main($id)
    {
        $image_url=Image::where(['id'=>$id])->value('url');
        if(!$image_url)
            throw new BaseException(['msg'=>'错误']);
        $image_url=ROOT.$image_url;
        $fp = fopen($image_url, "r") or die("Can't open file");

        $q = base64_encode(fread($fp, filesize($image_url)));
        fclose($fp);
        $res=$this->do_request($q);
        Log::error($res);
        return app('json')->go($res['data']);

    }

    public function search_main($id)
    {
        $image_url=Image::where(['id'=>$id])->value('url');
        if(!$image_url)
            throw new BaseException(['msg'=>'错误']);
        $image_url=ROOT.$image_url;
        $fp = fopen($image_url, "r") or die("Can't open file");

        $q = base64_encode(fread($fp, filesize($image_url)));
        fclose($fp);
        $res=$this->search_item($q);
        return app('json')->go($res);
    }



    function search_item($q)
    {
        $url="https://openapi.youdao.com/ocrquestionapi";
        $salt = $this->create_guid();
        $args = array(
            'appKey' => $this->app_key,
            'salt' => $salt,
        );
        $args['q'] = $q;
        $args['signType'] = 'v2';
        $curtime = strtotime("now");
        $args['curtime'] = $curtime;
        $signStr = $this->app_key . $this->truncate($q) . $salt . $curtime . $this->sec_key;
        $args['sign'] = hash("sha256", $signStr);
        $ret = $this->call($url, $args);
        $ret = json_decode($ret, true);
        return $ret;
    }

    private function do_request($q)
    {
        $salt = $this->create_guid();
        $args = array(
            'appKey' => $this->app_key,
            'salt' => $salt,
        );
        $args['detailType'] = '1';
        $args['q'] = $q;
        $args['docType'] = 'json';
        $args['signType'] = 'v3';
        $curtime = strtotime("now");
        $args['curtime'] = $curtime;
        $signStr = $this->app_key . $this->truncate($q) . $salt . $curtime . $this->sec_key;
        $args['sign'] = hash("sha256", $signStr);
        $ret = $this->call($this->url, $args);
        $ret = json_decode($ret, true);
        return $ret;
    }




    // 发起网络请求
    private function call($url, $args=null, $method="post", $testflag = 0, $timeout = 2000, $headers=array())
    {
        $ret = false;
        $i = 0;
        while($ret === false)
        {
            if($i > 1)
                break;
            if($i > 0)
            {
                sleep(1);
            }
            $ret = $this->callOnce($url, $args, $method, false, $timeout, $headers);
            $i++;
        }
        return $ret;
    }

    private function callOnce($url, $args=null, $method="post", $withCookie = false, $timeout = 2000, $headers=array())
    {
        $ch = curl_init();
        if($method == "post")
        {
            $data = $this->convert($args);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_POST, 1);
        }
        else
        {
            $data = $this->convert($args);
            if($data)
            {
                if(stripos($url, "?") > 0)
                {
                    $url .= "&$data";
                }
                else
                {
                    $url .= "?$data";
                }
            }
        }
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        if(!empty($headers))
        {
            curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        }
        if($withCookie)
        {
            curl_setopt($ch, CURLOPT_COOKIEJAR, $_COOKIE);
        }
        $r = curl_exec($ch);
        curl_close($ch);
        return $r;
    }

    private function convert(&$args)
    {
        $data = '';
        if (is_array($args))
        {
            foreach ($args as $key=>$val)
            {
                if (is_array($val))
                {
                    foreach ($val as $k=>$v)
                    {
                        $data .= $key.'['.$k.']='.rawurlencode($v).'&';
                    }
                }
                else
                {
                    $data .="$key=".rawurlencode($val)."&";
                }
            }
            return trim($data, "&");
        }
        return $args;
    }

    // uuid generator
    private function create_guid(){
        $microTime = microtime();
        list($a_dec, $a_sec) = explode(" ", $microTime);
        $dec_hex = dechex($a_dec* 1000000);
        $sec_hex = dechex($a_sec);
        $this->ensure_length($dec_hex, 5);
        $this->ensure_length($sec_hex, 6);
        $guid = "";
        $guid .= $dec_hex;
        $guid .= $this->create_guid_section(3);
        $guid .= '-';
        $guid .=  $this->create_guid_section(4);
        $guid .= '-';
        $guid .=  $this->create_guid_section(4);
        $guid .= '-';
        $guid .=  $this->create_guid_section(4);
        $guid .= '-';
        $guid .= $sec_hex;
        $guid .=  $this->create_guid_section(6);
        return $guid;
    }

    private function truncate($q) {
        $len = $this->abslength($q);
        return $len <= 20 ? $q : (mb_substr($q, 0, 10) . $len . mb_substr($q, $len - 10, $len));
    }

    private function abslength($str)
    {
        if(empty($str)){
            return 0;
        }
        if(function_exists('mb_strlen')){
            return mb_strlen($str,'utf-8');
        }
        else {
            preg_match_all("/./u", $str, $ar);
            return count($ar[0]);
        }
    }

    private function ensure_length(&$string, $length){
        $strlen = strlen($string);
        if($strlen < $length)
        {
            $string = str_pad($string, $length, "0");
        }
        else if($strlen > $length)
        {
            $string = substr($string, 0, $length);
        }
    }

    private function create_guid_section($characters){
        $return = "";
        for($i = 0; $i < $characters; $i++)
        {
            $return .= dechex(mt_rand(0,15));
        }
        return $return;
    }



}