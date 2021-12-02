<?php
// 应用公共文件
/**
 * 管理员密码加密方式
 * @param $password  密码
 * @param $password_code 密码额外加密字符
 * @return string
 */
function password($password)
{
    $password_code=config('setting.psw_code');
    return md5(md5($password) . md5($password_code));
}

function getDateFromRange($startdate, $enddate){

    $stimestamp = is_numeric($startdate)?$startdate:strtotime($startdate);
    $etimestamp = is_numeric($enddate)?$enddate:strtotime($enddate);

    // 计算日期段内有多少天
    $days = ($etimestamp-$stimestamp)/86400;

    // 保存每天日期
    $date = array();

    for($i=0; $i<=$days; $i++){
        $date[$i]['date']=date('Y-m-d', $stimestamp+(86400*$i));
        $date[$i]['week']=date('w', $stimestamp+(86400*$i));
    }

    return $date;
}