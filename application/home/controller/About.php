<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/10
 * Time: 21:02
 */

namespace app\home\controller;


use app\common\controller\HomeBase;
use app\common\model\Pages;

class About extends HomeBase
{

    public function aboutUs()
    {
        $content = Pages::where('name','aboutus')->find();
        $this->assign('info',$content);
        return $this->fetch('about');
    }

    //加入我们
    public function joinUs()
    {
        $content = Pages::where('name','joinus')->find();
        $this->assign('info',$content);
        return $this->fetch('join_us');

    }

    //联系我们
    public function contactUs()
    {
        $content = Pages::where('name','contactus')->find();
        $this->assign('info',$content);
        return $this->fetch('contact_us');

    }
    //法律声明
    public function notices()
    {
        $content = Pages::where('name','notices')->find();
        $this->assign('info',$content);
        return $this->fetch('notices');

    }
}