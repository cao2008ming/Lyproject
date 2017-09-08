<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/5/25
 * Time: 12:09
 */

namespace app\admin\validate;


use think\Validate;

class HotelCate extends Validate
{

    protected $rule = [
        'name'  =>'require',
    ];

    protected $message = [
        'require.name' =>'分类名称不能为空'
    ];
}