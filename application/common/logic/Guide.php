<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/11
 * Time: 13:28
 */

namespace app\common\logic;


class Guide extends LogicBase
{

    public function returnList($data)
    {
        foreach ($data as $key=>$value){
            $result[$key]['id']         = $value['id'];
            $result[$key]['name']   = $value['name'];
            $result[$key]['thumb']   = $value['thumb'];
            $result[$key]['level']   = $this->level($value['years']);  //导游等级判断
            $result[$key]['introducition'] = mb_substr($value['introduction'],0,40,'utf-8');
        }
        return $result;
    }

    public function level($years)
    {
        switch ($years){
            case $years<=4:
                $result = '初级导游';
                break;
            case $years>=5 ||$years<=10:
                $result ='中级导游';
                break;
        }
        return $result;
    }
}