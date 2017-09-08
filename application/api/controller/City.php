<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/13
 * Time: 10:43
 */

namespace app\api\controller;


use think\Controller;

class City extends Controller
{

    public function index()
    {
       $model = new \app\common\model\City();
       $data = $model->where(['status'=>1,'cid'=>1])->select();
       return $data;
    }

}