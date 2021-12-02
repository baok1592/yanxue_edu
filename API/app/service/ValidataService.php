<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/3/26 0026
 * Time: 16:28
 */

namespace app\service;




use ruhua\exceptions\BaseException;
use think\Validate;

class ValidataService
{
    protected $batchValidate = false;
    /**cms修改密码验证
     * @param $data
     */
    public function editpswValidata($data)
    {
        $rule=[
            'new_password'=>'require',
            'old_password'=>'require'
        ];
        $this->validate($data,$rule);
    }

    public function tuiformValidata($data)
    {
        $rule=[
            'tid'=>'require',
            'name'=>'require',
            'mobile'=>'require'
        ];
        $this->validate($data,$rule);
    }


    public function projectValidata($data)
    {
        $rule=[
            'name'=>'require',
            'pid'=>'require',
            'count'=>'require'
        ];
        $this->validate($data,$rule);
    }


    public function studentValidata($data)
    {
        $rule=[
            'name'=>'require'
        ];
        $this->validate($data,$rule);
    }


    public function courseValidata($data)
    {
        $rule=[
            'name'=>'require',
            'image'=>'require',
            'content'=>'require',
            'teacher'=>'require',
            'project'=>'require',
            'buy'=>'require'
        ];
        $this->validate($data,$rule);
    }


    public function BindValidata($data)
    {

    }


    public function OrderValidata($data)
    {
        $rule=[
            'id'=>'require',
            'price'=>'require'
        ];
        $this->validate($data,$rule);
    }


    public function bannerValidata($data)
    {
      $rule=[
          'name'=>'require',
          'img_id'=>'require'
      ];
      $this->validate($data,$rule);
    }


    public function pingceValidata($data)
    {
        $rule=[
            'uid'=>'require',
            'cid'=>'require',
            'content'=>'require',
            'class_id'=>'require'
        ];
        $this->validate($data,$rule);
    }

    public function articleValidata($data)
    {
        $rule=[
            'title'=>'require',
            'short_title'=>'require',
            'content'=>'require'
        ];
        $field=[
            'title',
            'short_title',
            'summary',
            'image',
            'content',
            'is_tui',
            'id'
        ];
        $this->validate($data,$rule);
        return $this->filter($data,$field);
    }

    private function filter($data,$field)
    {
        foreach ($data as $k=>$v){
            if(!in_array($k,$field))
                unset($data[$k]);
        }
        return $data;

    }

    public function adminValidata($data)
    {
        $rule=[
            'username'=>'require',
            'password'=>'require',
            'tid'=>'require'
        ];
        $this->validate($data,$rule);
    }




    protected function validate(array $data, $validate, array $message = [], bool $batch = false)
    {


        if (is_array($validate)) {
            $v = new Validate();

            $v->rule($validate);
        } else {
            if (strpos($validate, '.')) {
                // 支持场景
                list($validate, $scene) = explode('.', $validate);
            }
            $class = false !== strpos($validate, '\\') ? $validate : $this->app->parseClass('validate', $validate);
            $v     = new $class();
            if (!empty($scene)) {
                $v->scene($scene);
            }
        }
        $v->message($message);


        // 是否批量验证
        if ($batch || $this->batchValidate) {
            $v->batch(true);
        }

        $result=$v->check($data);
        if (!$result){

            throw new BaseException(['msg' => $v->getError()]);
        }else{
            return true;
        }
    }

}