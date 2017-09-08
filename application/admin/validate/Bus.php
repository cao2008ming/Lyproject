<?php
namespace app\admin\validate;

use think\Validate;

class   Bus extends Validate
{
    protected $rule = [

        'bus_name'      => 'require',

    ];

    protected $message = [
        'bus_name.require'      => '请填写标题',

    ];
}