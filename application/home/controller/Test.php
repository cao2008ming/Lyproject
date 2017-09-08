<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/29
 * Time: 19:01
 */

namespace app\home\controller;


use app\common\controller\Chrome;
use app\common\controller\HomeBase;

class Test extends HomeBase
{

    public function index()
    {

        return $this->engine($_POST);
    }
}