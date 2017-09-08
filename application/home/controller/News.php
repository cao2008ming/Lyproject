<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/10
 * Time: 23:17
 */

namespace app\home\controller;


use app\common\controller\HomeBase;

class News extends HomeBase
{

    //新闻列表页
    public function index()
    {
        return $this->fetch('about/news');
    }

    //新闻详情
    public function detail($id)
    {
        $data = \app\common\model\Article::get($id);
        $this->assign('info',$data);
        return $this->fetch('about/news_info');
    }
}