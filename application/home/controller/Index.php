<?php
namespace app\home\controller;

use app\common\controller\HomeBase;
use think\Db;

class Index extends HomeBase
{
    protected function _initialize()
    {
        parent::_initialize();
        $this->get_slide();
        $this->get_ad();
    }

    public function index()
    {
        $newsModel = new \app\common\model\Article();
        $news =$newsModel->where('status',1)->limit(7)->select();
        $this->assign('news',$news);
        return $this->fetch();
    }

    /*
     * 首页幻灯
     */
    protected function get_slide()
    {
        $data = db('slide')->where('status',1)->limit(3)->select();
        $this->assign('slide',$data);
    }

    protected function get_ad()
    {
        $data = db('slide')->where(['status'=>1,'cid'=>2])->limit(1)->find();
        $this->assign('ad',$data);
    }

}
