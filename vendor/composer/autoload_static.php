<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit03c3364a4f1922a40ddcc934d3140c97
{
    public static $files = array (
        '1cfd2761b63b0a29ed23657ea394cb2d' => __DIR__ . '/..' . '/topthink/think-captcha/src/helper.php',
        '44620e139b31c5f247f2825fea85991f' => __DIR__ . '/..' . '/oakhope/aliyun-sms/src/AliyunSMS.php',
    );

    public static $prefixLengthsPsr4 = array (
        't' => 
        array (
            'think\\composer\\' => 15,
            'think\\captcha\\' => 14,
            'think\\' => 6,
        ),
        'P' => 
        array (
            'Pingpp\\' => 7,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'think\\composer\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-installer/src',
        ),
        'think\\captcha\\' => 
        array (
            0 => __DIR__ . '/..' . '/topthink/think-captcha/src',
        ),
        'think\\' => 
        array (
            0 => __DIR__ . '/../..' . '/thinkphp/library/think',
        ),
        'Pingpp\\' => 
        array (
            0 => __DIR__ . '/..' . '/pingplusplus/pingpp-php/lib',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit03c3364a4f1922a40ddcc934d3140c97::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit03c3364a4f1922a40ddcc934d3140c97::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
