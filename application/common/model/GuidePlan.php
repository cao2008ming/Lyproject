<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/12
 * Time: 14:59
 */

namespace app\common\model;


use think\Model;

class GuidePlan extends Model
{

    protected $autoWriteTimestamp = true;


    //返回颜色值
    public function getColorAttr($value)
    {

        $colors = ['1'=>'green','2'=>'red'];
        return $colors[$value];
    }

    public function getTitleAttr($value)
    {

        $colors = ['1'=>' 正常','2'=>'休息'];
        return $colors[$value];
    }

}