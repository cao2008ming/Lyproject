<?php
namespace app\admin\validate;

use think\Validate;

class  Guidebook extends Validate
{
    protected $rule = [
        'id_photo_a'   => 'require',
        'id_photo_b'   => 'require',
        'name'      => 'require',
        'tel'       => 'require|number',
        'thumb'   => 'require',
        'birthday'   => 'require',
        'uid'     => 'require'
    ];

    protected $message = [
        'id_photo_a.require'   => '必须上传身份正面照片',
        'id_photo_a.require'   => '必须上传身份反面照片',
        'name.require'      => '请输入真实姓名',
        'tel.require'       => '请输入联系电话',
        'tel.number'        => '电话只能填数字',
        'thumb.require'   => '请上传个人照片',
        'birthday.require'   => '请选择出生日期',
        'uid.require'      => '请输入身份证号码',
        'uid.max'      => '身份证号码格式不对',
    ];
}