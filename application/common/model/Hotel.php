<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/5/17
 * Time: 13:46
 */

namespace app\common\model;


use think\Model;

class Hotel extends Model
{

    protected $autoWriteTimestamp = true;

    public function getCreateTimeAttr($value){

        return date('Y-m-d H:i:s',$value);
    }

    protected function setContentAttr($value)
    {
        return htmlspecialchars_decode($value);
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

    //获取评论
    protected function getCommentsAttr($id,$data)
    {
        $amount= HotelComments::where(['status'=>1,'hotel_id'=>$data['id']])->count();
        return $amount;
    }

    //获取评分
    protected function getScoreAttr($id,$data)
    {
        $amount= HotelComments::where(['status'=>1,'hotel_id'=>$data['id']])->avg('score');
        if (is_null($amount)){
            $amount = '5.0';
        }
        return $amount;
    }
    //获取评分等级
    protected function getScoreLevelAttr($id,$data)
    {
        $avg_score= HotelComments::where(['status'=>1,'hotel_id'=>$data['id']])->avg('score');
        $level = '';
        switch ($avg_score){
            case null:
                $level = '暂无评分';
                continue;
            case $avg_score<=3:
                $level = '评价很差';
                break;
            case $avg_score<=4:
                $level = '评价一般';
                break;
            case $avg_score<=5:
                $level = '评价较好';
        }

        return $level;
    }

    protected function getManyiduAttr($id,$data)
    {
        $coment_amount = HotelComments::where('hotel_id',$data['id'])->count()?:1;
        $manyi_amount = HotelComments::where('hotel_id',$data['id'])->where('score','EGT',4)->count()?:1;

        $result = round(($manyi_amount/$coment_amount)*100);
        return $result;
    }
}