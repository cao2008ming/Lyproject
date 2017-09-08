<?php
namespace app\home\controller;

use app\common\controller\HomeBase;
use think\Db;

class Routes extends HomeBase
{
    protected $model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->get_slide();
        $this->model = new \app\common\model\Routes();
    }

    public function index()
    {
        return $this->fetch();
    }

    /*
     * 获取幻灯
     */
    protected function get_slide()
    {
        $data = db('slide')->where('status',1)->limit(3)->select();
        $this->assign('slide',$data);
    }

    /**
     * 路线详情
     * @param $id
     * @return mixed
     * @return
     */
    public function info($id)
    {
        $info = $this->model->where('id',$id)->find();
        $this->assign('info',$info);
        return $this->fetch();
    }

}
