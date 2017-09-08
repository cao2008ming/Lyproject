<?php
namespace app\admin\validate;

use think\Validate;

class Hotel extends Validate
{
    protected $rule = [
        'cate_id'   => 'require',
        'name'      => 'require',
        'tel'       => 'require|number',
        'address'   => 'require',
        'content'   => 'require',
        'price'     => 'require|number'
    ];

    protected $message = [
        'cate_id.require'   => '请选择酒店类型',
        'name.require'      => '请输入酒店名称',
        'tel.require'       => '请输入酒店联系电话',
        'tel.number'        => '客服电话只能填数字',
        'address.require'   => '请输入酒店地址',
        'content.require'   => '请输入酒店介绍',
        'price.number'      => '价格只能填写数字'
    ];
}