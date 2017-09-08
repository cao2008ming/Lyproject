<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/4
 * Time: 15:21
 */

namespace app\home\controller;


use app\common\controller\HomeBase;

class Agreement extends HomeBase
{

    public function index($type=0){

        $content = '这里是客户协议这里是客户协议这里是客户协议这里是客户协议这里是客户协议这里是客户协议这里是客户协议这里是客户协议这里是客户协议这里是客户协议';
        $title = '《客户入住酒店协议书》';
        $this->assign(['content'=>$content,'title'=>$title]);
        return $this->fetch();
    }
}