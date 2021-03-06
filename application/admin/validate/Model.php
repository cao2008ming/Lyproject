<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 模型管理验证器
 * Class Link
 * @package app\admin\validate
 */
class Model extends Validate
{
    protected $rule = [
        'name' => 'require'
    ];

    protected $message = [
        'name.require' => '请输入名称'
    ];
}