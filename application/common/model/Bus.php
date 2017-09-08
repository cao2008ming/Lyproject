<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/14
 * Time: 17:14
 */

namespace app\common\model;


use think\Model;

class Bus extends Model
{
    protected  $autoWriteTimestamp = true;

    public function setShuoming1Attr($value)
    {
        return htmlspecialchars_decode($value);
    }

    public function setShuoming2Attr($value)
    {
        return htmlspecialchars_decode($value);
    }


    public function setShuoming3Attr($value)
    {
        return htmlspecialchars_decode($value);
    }

    public function setShuoming4Attr($value)
    {
        return htmlspecialchars_decode($value);
    }

    public function setShuoming5Attr($value)
    {
        return htmlspecialchars_decode($value);
    }
}