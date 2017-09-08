<?php
namespace app\home\controller;

use app\common\controller\HomeBase;
use think\Db;

class Techan extends HomeBase
{
    protected $model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->get_slide();
        $this->model = new \app\common\model\Techan();
    }

    public function index()
    {
        return $this->fetch();
    }

    public function info($id)
    {

    }
    /*
     * 获取幻灯
     */
    protected function get_slide()
    {
        $data = db('slide')->where('status',1)->limit(3)->select();
        $this->assign('slide',$data);
    }



}
