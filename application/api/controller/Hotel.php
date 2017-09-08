<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/30
 * Time: 13:28
 */

namespace app\api\controller;


use app\common\controller\ApiBase;
use app\common\model\HotelComments;
use app\common\model\HotelRooms;
use think\Controller;

class Hotel extends ApiBase
{

    protected $model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Hotel();
    }

    public function index()
    {

    }

    /*
     * 酒店列表
     */
    public function lists($page=1,$city=null)
    {
        $condition['status']=1;
        if(!is_null($city)){
            $condition['city_id']=$city;
        }
        $data = $this->model->where($condition)->field('id,id as comments,id as score,name,user_id,cate_id,price,thumb,info,address')->paginate(2);

        return json($data);
    }

    //获取酒店评论列表
    public function get_hotel_comments($page=1,$id=2)
    {
        $data = HotelComments::where('hotel_id',$id)->order('create_time DESC')->field('comment_id ,user_id as user_name,content,create_time,score,score as score_level,user_id as avatar,photo')->paginate(2);

        return json($data);
    }

     public function get_rooms_by_bedType($hotel_id,$bed_type)
     {
         $data = HotelRooms::where(['bed_type'=>$bed_type,'hotel_id'=>$hotel_id,'status'=>1])->order('update_time DESC')->select();
         return json($data);
     }
}