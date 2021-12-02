<?php


namespace app\model;

use ruhua\bases\BaseModel;
use ruhua\exceptions\BaseException;
use ruhua\services\TokenService;

/**
 * @mixin \think\Model
 */
class Admin extends BaseModel
{
    public function autogroupaccess(){
        return $this->hasOne('AuthGroupAccess','aid','id');
    }

    public static function createAdmin($form)
    {
        $user = self::where('username',$form['username'])->find();
        if($user){
            throw new BaseException(['msg'=>'用户名已存在']);
        }
        $form['password'] = password($form['password']);
        $res = self::create($form);
        if($res){
            AuthGroupAccess::create(['aid'=>$res['id'],'group_id'=>$form['gid']]);
            return 1;
        }else{
            throw new BaseException(['msg'=>'注册失败']);
        }
    }


    public static function deleteAdmin($id)
    {
        $aid=TokenService::getCurrentAId();
        $admin=self::find($aid);
        if($admin['tid']!=0)
            throw new BaseException(['msg'=>'暂无权限'.$admin['tid']]);
        if($id<=1){
            throw new BaseException(['msg'=>'不能删除最高管理员']);
        }
        $res = self::destroy($id);
        if(!$res){
            throw new BaseException(['msg'=>'删除失败']);
        }else{
            return 1;
        }
    }

    public function teacher()
    {
        return $this->belongsTo('Teacher','tid','id');
    }

    /**管理员信息更新
     * @param $form
     * @return int
     */
    public static function updateAdmin($form)
    {
        $res=self::update($form);
        return $res?1:0;
    }


}
