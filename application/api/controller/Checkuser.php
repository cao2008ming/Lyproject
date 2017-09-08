<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/9
 * Time: 00:50
 */

namespace app\api\controller;


use app\common\model\User;
use think\Controller;

class Checkuser extends Controller
{

    protected $model;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new User();
    }

    /*
     * 检查用户是否被注册
     */
    public function username($username)
    {
        $result = $this->model->where('username', $username)->value('id');
        if (empty($result)) {
            return json(['code' => 1, 'msg' => '恭喜你，该账号可以注册']);
        } else {
            return json(['code' => 0, 'msg' => '抱歉，该账号已经被注册']);
        }
    }

    /*
     * 检查手机号是否可以注册
     */
    public function mobile($mobile)
    {
        $result = $this->model->where('mobile', $mobile)->value('id');
        if (empty($result)) {
            return json(['code' => 1, 'msg' => '恭喜你，该手机号可以注册']);
        } else {
            return json(['code' => 0, 'msg' => '抱歉，该手机已经被注册，您可以通过找回密码功能重置密码']);
        }
    }
}