<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/30
 * Time: 17:37
 */

namespace app\common\model;


use think\Model;

class HotelComments extends Model
{

    protected $autoWriteTimestamp = true;

    public function getCreateTimeAttr($value){

        return date('Y-m-d H:i:s',$value);
    }


    protected function setPhotoAttr($value)
    {
        return serialize($value);
    }

    /**
     * 反序列化photo图集
     * @param $value
     * @return mixed
     */
    protected function getPhotoAttr($value)
    {
        return unserialize($value);
    }

    /*
     * 评价等级
     */
    public function getScoreLevelAttr($value)
    {
        switch ($value){
            case null:
                $level = '暂无评分';
                continue;
            case $value<=3:
                $level = '评价很差';
                break;
            case $value<=4:
                $level = '评价一般';
                break;
            case $value<=5:
                $level = '评价较好';
        }
        return $level;
    }

    //获取用户名
    public function getUserNameAttr($value)
    {
        return get_user_name($value);
    }

    //获取头像
    public function getAvatarAttr($value)
    {
        return get_user_avatar($value);
    }
}