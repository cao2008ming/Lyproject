<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/6
 * Time: 15:11
 */

namespace app\api\model;

use app\common\model\GuideComments;
use app\common\model\OrderGuide;
use think\Model;

class Guide extends ApiBase
{

    protected $autoWriteTimestamp = true;


    //隐藏身份证号
    public function getUidAttr($value)
    {
        return '***';
    }


    //已服务次数
    public function getServeredAttr($value)
    {
        $servered = OrderGuide::where('guide_id',$value)->count()?:0;
        return $servered;
    }

    //获得评分
    public function getScoreAttr($value)
    {
        $score = GuideComments::where('guide_id',$value)->avg('score')?:0;
        return $score;
    }

    //
    public function getIntroductionAttr($value)
    {
        return mb_substr($value,0,45,'UTF-8').'...';
    }



}