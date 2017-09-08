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

class Guide extends HomeBase
{

    protected $model;

    public function _initialize(){
        parent::_initialize();
        $this->model = new \app\common\model\Guide();


    }

    public function index()
    {
        $citys = new City();
        $this->assign('citys',$citys->index()); //城市列表

        $count = $this->model->count();
        $this->assign('count',$count);
        return $this->fetch();
    }

    public function info($id)
    {
        $data = $this->model->where('id',$id)->find();
        $this->assign('info',$data);
        return $this->fetch();
    }

    public function check($id)
    {
        $data = $this->model->where('id',$id)->find();
        $this->assign('info',$data);
        return $this->fetch();
    }
}