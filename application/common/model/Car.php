<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/13
 * Time: 15:35
 */

namespace app\common\model;


use think\Model;

class Car extends Model
{

    protected $autoWriteTimestamp = true;


    /**
     * 反转义HTML实体标签
     * @param $value
     * @return string
     */
    protected function setAboutAttr($value)
    {
        return htmlspecialchars_decode($value);
    }

    /**
     * 格式化时间
     * @param $value
     * @return false|string
     * @return
     *
     */
    public function getCreateTimeAttr($value){

        return date('Y-m-d H:i:s',$value);
    }

    /**
     * 格式化时间
     * @param $value
     * @return false|string
     * @return
     *
     */
    public function getUpdateTimeAttr($value){

        return date('Y-m-d H:i:s',$value);
    }

}