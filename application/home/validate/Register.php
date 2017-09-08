<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/9
 * Time: 00:43
 */

namespace app\home\validate;


use think\Validate;

class Register extends Validate
{

    protected $rule = [
        'username'  => 'require',
        'password'  => 'require',
        'password1' => 'require',
        'mobile' => 'require',
//        'verify'   => 'require|captcha'
    ];

    protected $message = [
        'username.require' => '请输入用户名',
        'password.require' => '请输入密码',
        'mobile.require' => '请输入手机号码',
//        'verify.require'   => '请输入验证码',
//        'verify.captcha'   => '验证码不正确'
    ];
}