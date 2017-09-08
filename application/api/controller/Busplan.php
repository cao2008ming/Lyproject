<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/13
 * Time: 14:40
 */

namespace app\api\controller;


use think\Controller;

class Busplan extends Controller
{

    public function getPlan($busid=1,$price='255')
    {
        $current = date('y-m-d',time());
        for($i = 0;$i<=30;$i++)
        {
            $data[$i]['title'] = '￥'.$price;
            $data[$i]['start'] = date('Y-m-d',strtotime("+ $i day"));
        }
        return json($data);
    }
}