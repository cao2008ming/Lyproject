<?php
namespace app\home\controller;

use app\api\controller\City;
use app\common\controller\HomeBase;
use think\Db;

class Bus extends HomeBase
{
    protected $model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->get_slide();
        $this->model = new \app\common\model\Bus();
    }


    /*
     * 车辆首页
     */
    public function index()
    {
        $citys = new City();
        $this->assign('citys',$citys->index());

        $data = $this->model->limit(6)->select();
        $this->assign('buses',$data);

        return $this->fetch();
    }

    //获取幻灯
    protected function get_slide()
    {
        $data = db('slide')->where('status',1)->limit(3)->select();
        $this->assign('slide',$data);
    }

    /*
     * 车辆信息
     */
    public function info($bus_id =0)
    {
        $data = $this->model->where('bus_id',$bus_id)->find();

        $this->assign('info',$data);

        return $this->fetch();
    }

    /*
     * 车辆搜索
     */
    public function search($page=1,$city='',$start='',$end='')
    {
        $map = [];
        if(!empty($city)){
            $map['city'] =$city;
        }
        $result = $this->model->where($map)->order('bus_price ASC')->paginate(15, false, ['page' => $page]);

        $this->assign('bus_list',$result);
        return $this->fetch();
    }

}
