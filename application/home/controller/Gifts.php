<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/29
 * Time: 11:59
 */

namespace app\home\controller;


use app\common\controller\HomeBase;

class Gifts extends HomeBase
{

    protected $model;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Gifts();
    }

    /*
     * 首页
     */
    public function index()
    {
        return $this->fetch();
    }
}