<?php
namespace app\admin\validate;

use think\Validate;

class   Car extends Validate
{
    protected $rule = [

        'name'      => 'require',
        'tel'       => 'require|number',
        'thumb'   => 'require',
        'zizhi'   => 'require',
        'address'     => 'require'
    ];

    protected $message = [
        'name.require'      => '请填写机构名称',
        'tel.require'       => '请输入联系电话',
        'tel.number'        => '电话只能填数字',
        'thumb.require'   => '请上传LOGO',
        'zizhi.require'   => '请上传资质证明',
        'address.require'      => '请输入详细地址',
    ];
}