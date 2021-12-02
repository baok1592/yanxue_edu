<?php


namespace app\controller\cms;
use app\model\CardNumber as CardNumberModel;
use think\facade\Log;

class CardNumber
{


    public function rand($len)
    {
        $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
        $string=time();
        for(;$len>=1;$len--)
        {
            //获取一个计算过后的随机数
            $position=rand()%strlen($chars);
            $position2=rand()%strlen($string);
            //根据随机得到的一个数字作为下标取出一个值并插入到字符串中
            $string=substr_replace($string,substr($chars,$position,1),$position2,0);
        }
        return $string;
    }

}