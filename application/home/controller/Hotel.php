<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/26
 * Time: 17:11
 */

namespace app\home\controller;


use app\api\controller\City;
use app\common\controller\HomeBase;
use app\common\model\Cate;
use app\common\model\HotelCate;
use app\common\model\HotelComments;
use app\common\model\HotelRooms;
use app\common\model\OrderCheckin;

class Hotel extends HomeBase
{

    protected $model;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Hotel();
        $this->get_slide();
    }

    public function index()
    {
        $citys = new City();
        $this->assign('citys',$citys->index());
        return $this->fetch();
    }

    //酒店搜索
    public function search($page=1,$city='',$strat_s='',$start_e='',$keywords='',$price='0,5000',$star='')
    {

        $citys = new City();
        $this->assign('citys',$citys->index());
        //酒店星级
        $this->assign('star_list',Cate::where(['status'=>1,'model_id'=>1])->select());
        //获取浏览记录
        $this->history();
        //获取酒店列表
        $map = [];
        if(!empty($city)){
            $map['city_id'] = $city;
        }
        if(!empty($keywords)){
            $map['name|address|content'] = ['like', "%{$keywords}%"];
        }
        if(!empty($star)){
            $map['cate_id'] = $star;
        }
        if(!empty($price)){
            $price = explode(',',$price);
            $map['price'] = ['between', $price];
        }
        $hotel_list = $this->model->where($map)->order('price ASC')->paginate(10, false, ['page' => $page]);;
        $this->assign('hotel_list',$hotel_list);
        return $this->fetch();
    }
    /*
     * 酒店信息
     */
    public function info($id = 0)
    {

        $info = $this->model->where(['status' => 1, 'id' => $id])->find();
        //浏览记录
        cookie_history($id,$info['name']);
        //获取浏览记录
        $this->history();
        $last_comment = HotelComments::where(['hotel_id'=>$id,'status' => 1, 'score' => ['EGT', 4]])->find();
        if (is_null($last_comment)) {
            $last_comment['user_id'] = null;
            $last_comment['content'] = '<p style="font-size: 22px; text-align: center">暂无推荐评价</p>';
        }
        $result = [
            'info' => $info,
            'last_comment' => $last_comment,
        ];
        $this->assign($result);
        return $this->fetch();
    }

    /*
     * 获取酒店页面幻灯
     */
    protected function get_slide()
    {
        $data = db('slide')->where('status', 1)->limit(3)->select();
        $this->assign('slide', $data);
    }

    /*
     * 入住登记页面
     */
    public function checkIn($hotel_id = 0, $room_id = 0, $user_id = 0)
    {
        $unit = HotelRooms::where('id', $room_id)->value('price');

        if (request()->isPost()) {
            $model = new OrderCheckin();

            $data = request()->post();

            $data['checkin_days'] = get_days($data['checkin_start'], $data['checkin_end']); //计算时间差
            $data['user_id'] = $user_id;
            $data['amount'] = $unit * $data['checkin_num'] * $data['checkin_days'];
            $data['checkin_id'] = create_order_no(1);
            $result = $model->allowField(true)->save($data);
            if ($result) {
                return $this->redirect('Payment/pay', ['type'=>1,'orderNo' => $model->checkin_id]);
            } else {
                $this->error('提交失败，稍后重试');
            }

        } else {
            $this->assign('hotel_id', $hotel_id);
            $this->assign('hotel_name', get_hotel_name($hotel_id));

            $this->assign('unit', $unit);
            $this->assign('room_id', $room_id);
            $this->assign('room_name', get_room_name($room_id));

            $checkin_time = [
                'checkin_start' => date('Y-m-d'),
                'checkin_end' => date('Y-m-d', strtotime("+1 day")),
            ];
            $this->assign($checkin_time);
            return $this->fetch();
        }
    }

    public function history()
    {

        //获取浏览记录
        $this->assign('history',cookie_history_read());
    }


}