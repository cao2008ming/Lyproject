<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/8
 * Time: 11:21
 */

namespace app\api\controller;

use app\common\model\SmsLog;
use think\Controller;
use think\Session;

class Sms extends Controller
{
    protected $accessId;
    protected $accessKey;
    protected $endPoint;
    protected $topicName;
    protected $signName;
    public function __construct()
    {
        $this->accessId  = config('aliyunsms.accessId');
        $this->accessKey = config('aliyunsms.accessKey');;
        $this->endPoint  = config('aliyunsms.endPoint');;
        $this->topicName = config('aliyunsms.topicName');;
        $this->signName  = config('aliyunsms.signName');;
    }

    public function send_code($mobile,$token=0,$type) {
        $sms_type =['1'=>'SMS_76555056'];
        //todo:添加更多模板类型
        if ($token === config('aliyunsms.token')){
            $code = mt_rand(1000,9999);
            $aliyunSms = new \Oakhope\AliyunSMS($this->accessId, $this->accessKey, $this->endPoint, $this->topicName, $this->signName);

            $sms_id = 0;
            if($aliyunSms->sendOne($sms_type[$type], $mobile, ['code' => $code])){
                //储存验证码
                $sms_model = new SmsLog();
                $data = ['code'=>$code,'create_time'=>time(),'type'=>$type,'mobile'=>$mobile];

                if ($sms_model->allowField(true)->save($data)){
                    $sms_id = $sms_model->sms_id;
                }
                return json(['code'=>1,'msg'=>'success','sms_id'=>$sms_id]);
            } else {
                return json(['code'=>0,'msg'=>'failed','sms_id'=>$sms_id]);
            }
        }else{
            echo '非法请求';
        }
    }


    public function checkSms($sms_id){
        $result = SmsLog::where('sms_id',$sms_id)->value('code');
        if($result){
            $code = $result;
        } else {
            $code = md5(time().config('salt'));
        }
        return $code;
    }
}
