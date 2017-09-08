<?php
namespace app\admin\validate;

use think\Validate;

/**
 * 模型管理验证器
 * Class Link
 * @package app\admin\validate
 */
class Cate extends Validate
{
    protected $rule = [
        'name' => 'require',
        'model_id' => 'require'
    ];

    protected $message = [
        'name.require' => '请输入名称',
        'model_id.require' => '请选择关联模型'
    ];
}