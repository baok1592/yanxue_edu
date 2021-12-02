<?php


namespace app\model;



use ruhua\auth\Auth;
use ruhua\exceptions\BaseException;
use ruhua\bases\BaseModel;
use think\facade\Log;

class AuthGroup extends BaseModel
{
    public static function getGroupAll()
    {
        $res=self::select();
        
        $data=[];
        if(!$res){
            throw new BaseException(['msg'=>'获取失败']);
        }
        foreach ($res as $v){
            $rules=(new Auth())->getGroupAuthList($v['id']);
            $v['rules']=$rules;
            $data[]=$v;
        }
        return $data;
    }

    public static function createGroup($form)
    {
        $data['title']=$form['title'];
        Log::error($form);
        $data['rules']=implode(',',$form['rules']);
        $res=self::create($data);
        if (!$res)
        {
            throw new BaseException(['msg'=>'添加失败']);
        }
        return 1;
    }

    public static function updateGroup($form)
    {
        $form['rules']=implode(',',$form['rules']);
        $group=self::find($form['id']);
        if(!$group)
            throw new BaseException(['msg'=>'没有这个组！']);
        $res=$group->save($form);
        if (!$res)
        {
            throw new BaseException(['msg'=>'更新失败']);
        }
        return 1;
    }

}