<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/4
 * Time: 16:27
 */

namespace app\common\model;


class OrderCheckin extends \think\Model
{

    protected $autoWriteTimestamp=true;

    protected function setCheckinInfoAttr($value)
    {
        return serialize($value);
    }

    public function getOrderInfo($orderNo)
    {
        $orderInfo= OrderCheckin::where('checkin_id',$orderNo)->find();

        /*$info['user_name']   = get_user_name($orderInfo['user_id']);
        $info['hotel_name']  = get_hotel_name($orderInfo['hotel_id']);
        $info['room_name']   = get_room_name($orderInfo['hotel_id']);
        $info['room_num']    = $orderInfo['checkin_num'];
        $info['checkin_start']    = $orderInfo['checkin_start'];
        $info['checkin_end']    = $orderInfo['checkin_end'];
        $info['checkin_days']    = $orderInfo['checkin_days'];*/

        return $orderInfo;
     }
}