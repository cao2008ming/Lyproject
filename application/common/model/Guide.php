<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/6
 * Time: 15:11
 */

namespace app\common\model;



use think\Model;

class Guide extends Model
{

    protected $autoWriteTimestamp = true;

    protected function setAboutAttr($value)
    {
        return htmlspecialchars_decode($value);
    }

    protected function getSexyAttr($value)
    {
        $sex = ['0'=>'未知','1'=>'男','2'=>'女'];
        return $sex[$value];
    }
}