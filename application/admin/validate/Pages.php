<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/21
 * Time: 10:50
 */

namespace app\admin\validate;


use think\Validate;

class Pages extends Validate
{
    protected $rule = [
        'title'   => 'require',
        'name'    => 'require',
        'content' => 'require'
    ];

    protected $message = [
        'title.require'   => '请输入页面标题',
        'name.require'    => '请输入单页名称',
        'content.require' => '内容不能为空',
    ];
}