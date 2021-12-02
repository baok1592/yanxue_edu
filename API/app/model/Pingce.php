<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2021/4/1 0001
 * Time: 9:36
 */

namespace app\model;


use ruhua\bases\BaseModel;
use PHPExcel_IOFactory;
use ruhua\exceptions\BaseException;
use app\model\Student as StudentModel;

class Pingce extends BaseModel
{


    public static function add_pc($url)
    {
        $reader = PHPExcel_IOFactory::createReader('Excel5');

        $field=[
            'A'=>'username',
            'B'=>'password',
            'C'=>'name',
            'D'=>'sex',
            'E'=>'cid',
            'F'=>'mobile',
            'G'=>'age'
        ];
        $excel = PHPExcel_IOFactory::load($url);
        $data = array();
        $SheetNamas = $excel->getSheetNames();
        for($i = 0; $i < count($SheetNamas); $i++){
            //获取当前工作表名
            $SheetName = $SheetNamas[$i];
            //根据表名切换当前工作表
            $excel->setActiveSheetIndexByName($SheetName);
            //得到当前工作表对象
            $curSheet = $excel->getActiveSheet();
            //获取当前工作表最大行数
            $rows = $curSheet->getHighestRow();
            //获取当前工作表最大列数,返回的是最大的列名，如：B
            $cols = $curSheet->getHighestColumn();

            //将当前工作表名当键，内容为值存入数组
            $data[$SheetName] = array();
            $post=input('post.');
            //大写字母A的ASCII值是65 A-Z对应65-90
            for($j = 'A'; $j <= $cols; $j++ ){
                for($k = 1; $k <= $rows; $k++){
                    $key = $j.$k;
                    $value = $curSheet->getCell($key)->getValue();
                    $data[$k][$field[$j]]=$value;
                    $data[$k]['index']=$post['index'];
                    $data[$k]['class_id']=$post['class_id'];
                    //$data[$SheetName][$key] = $value;

                }
            }

        }
        $data=self::check_validata($data);
        $res=(new Pingce())->saveAll($data);
        if(file_exists($url))
            unlink($url);
        return $res;

    }

    private static function check_validata($data)
    {
        $names=[
            'name'=>'账号',
            'password'=>'密码',
            'name'=>'姓名',
            'sex'=>'性别',
            'cid'=>'班级',
            'mobile'=>'电话',
            'age'=>'年龄'
        ];


        if(count($data)<2)
            throw new BaseException(['msg'=>'暂无数据']);

        foreach ($data[1] as $k=>$v){
            if($k!="index"&&$k!="class_id"){
                if($names[$k]!=$v)
                    throw new BaseException(['msg'=>'标题错误']);
            }

        }
        $student=new StudentModel();
        $arr=array();

        foreach ($data as $k=>$v){

            if($k!=1){
                if($v){
                    $stu=$student->with('classesstu')->where(['name'=>$v['name']])->find();
                    if(!$stu)
                        continue;
                    foreach ($stu['classesstu'] as $key=>$value){
                        if($value['cid']==$v['class_id']){
                            $v['uid']=$stu['id'];
                            $arr[]=$v;
                            break;
                        }

                    }

                }



            }

        }
        return $arr;
    }





}