<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/5/24
 * Time: 11:40
 */

namespace app\common\model;


use think\Model;

class HotelRooms extends Model
{
    protected $autoWriteTimestamp = true;
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';


    public function getCreateTimeAttr($value){

        return date('Y-m-d H:i:s',$value);
    }
    /**
     * 序列化photo图集
     * @param $value
     * @return string
     */
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

    /**
     * @return string
     */
    public function getStatusAttr($value)
    {
       $status = ['0'=>'待审核','1'=>'已经通过审核','2'=>'审核为通过','3'=>'已被禁用'];
       return $status[$value];
    }

    /*
     * 床型
     */
    public function getBedTypeAttr($bed_type,$data)
    {
        $status = ['1'=>'大床','2'=>'双人床','3'=>'多床','4'=>'单人床'];
        return $status[$data['bed_type']];
    }

    /*
     * 是否提供早点
     */
    public function getBreakfastAttr($value)
    {
        $status = ['0'=>'有早','1'=>'无早'];
        return $status[$value];
    }

    /*
     * 是否有窗
     */
    public function getWindowAttr($value)
    {
        $status = ['0'=>'无窗','1'=>'有窗'];
        return $status[$value];
    }

    public function getCateIdAttr($value)
    {
        $cate_name = HotelCate::where('id',$value)->value('name');
        return $cate_name;
    }
}