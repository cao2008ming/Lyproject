<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/4
 * Time: 17:34
 */

namespace app\home\controller;

use app\common\model\OrderCheckin;
use function PHPSTORM_META\type;
use Pingpp;
use app\common\controller\HomeBase;
use think\Request;
const APP_KEY = 'sk_test_HSibvTfHCCGK9GOu945yfHS0';
// app_id 获取方式：登录 [Dashboard](https://dashboard.pingxx.com)->应用卡片下方
const APP_ID = 'app_Sezzv5bXvP04evnT';
const WEB_URL = 'http://lvyou.juzhonghui.cn';

\Pingpp\Pingpp::setApiKey(APP_KEY);                                         // 设置 API Key
\Pingpp\Pingpp::setPrivateKeyPath(__DIR__ . '/rsa_private_key.pem');   // 设置私钥
\Pingpp\Pingpp::setAppId(APP_ID);

class Payment extends HomeBase
{

    public function _initialize()
    {
        parent::_initialize();

        vendor("Pingpp.init");

    }
    public function successed($result,$out_trade_no)
    {
        $this->assign('result',$result);
        $this->assign('orderNo',$out_trade_no);
        return $this->fetch();
    }

    //支付页面
    public function pay($type,$orderNo)
    {
        switch ($type){
            case 1:
                $model = new OrderCheckin();
                $this->assign('info',$model->getOrderInfo($orderNo));
                return $this->fetch('payment_hotel');

            case 2:
                return $this->fetch('payment_guide');
            case 3:
                return $this->fetch('payment_bus');
            case 4:
                return $this->fetch('payment_techan');
            case 5:
                return $this->fetch('payment_techan');
            case 6:
                return $this->fetch('payment_line');
        }
    }

    //支付成功回掉页面  Webhooks
    public function  webHooks()
    {
        $data =\request()->post();
        if ($data['type'] == 'charge.succeeded'){

            $orderNo = $data['data']['object']['order_no'];
            $channel = $data['data']['object']['channel'];
            $created = $data['data']['object']['created'];
            $front = substr($orderNo,0,2);
            $result='';
            switch ($front){
                case 'HT':
                    $model = new OrderCheckin();
                    $update_info = ['channel'=>$channel,'pay_time'=>$created,'status'=>1];
                    $result =$model->where('checkin_id',$orderNo)->update($update_info);
            }
            if ($result){
                return json_encode(['code'=>1,'msg'=>'success']);
            } else {
                return json_encode(['code'=>0,'msg'=>'failed']);
            }
        }
    }
    public function checkin()
    {
        // 此处为 Content-Type 是 application/json 时获取 POST 参数的示例
//        $input_data = json_decode(file_get_contents('php://input'), true);
        $input_data = request()->post();
        if (empty($input_data['channel']) || empty($input_data['orderNo']) ||empty($input_data['amount'])) {
            echo '支持方式或支付金额或订单号为空';
            exit();
        }
        $channel = strtolower($input_data['channel']);
        $amount  = $input_data['amount'] *100;
        $subject = $input_data['subject'];
//        $orderNo = substr(md5(time()), 0, 12);
        $orderNo = $input_data['orderNo'];

        /**
         * $extra 在使用某些渠道的时候，需要填入相应的参数，其它渠道则是 array()。
         * 以下 channel 仅为部分示例，未列出的 channel 请查看文档 https://pingxx.com/document/api#api-c-new；
         * 或直接查看开发者中心：https://www.pingxx.com/docs/server；包含了所有渠道的 extra 参数的示例；
         */
        $channel_extra = dirname(__FILE__) . '/channel_extra/' . $channel . '.php';
        $extra = file_exists($channel_extra) ? require_once $channel_extra : [];
        switch ($channel) {
            case 'alipay_wap':
                $extra = array(
                    'success_url' => WEB_URL.'/home/payment/successed',
                    'cancel_url'  => WEB_URL.'/home/payment/canceled',
                );
                break;
            case 'wx_pub':
                $extra = array(
                    'open_id' => 'Openid'
                );
                break;
            case 'wx_pub_qr':
                $extra = array(
                    'product_id' => 'Productid'
                );
                break;
        }
//            \Pingpp\Pingpp::setApiKey(APP_ID);
//        \Pingpp\Pingpp::setPrivateKey(APP_KEY);
        try {
            $ch = \Pingpp\Charge::create(
                array(
                    // 请求参数字段规则，请参考 API 文档：https://www.pingxx.com/api#api-c-new
                    'subject' => $subject,
                    'body' => '暂无',
                    'amount' => $amount,                 // 订单总金额, 人民币单位：分（如订单总金额为 1 元，此处请填 100）
                    'order_no' => $orderNo,                // 推荐使用 8-20 位，要求数字或字母，不允许其他字符
                    'currency' => 'cny',
                    'extra' => $extra,
                    'channel' => $channel,                // 支付使用的第三方支付渠道取值，请参考：https://www.pingxx.com/api#api-c-new
                    'client_ip' => $_SERVER['REMOTE_ADDR'], // 发起支付请求客户端的 IP 地址，格式为 IPV4，如: 127.0.0.1
                    'app' => array('id' => APP_ID)
                )
            );
            echo $ch;                                       // 输出 Ping++ 返回的支付凭据 Charge
        } catch (\Pingpp\Error\Base $e) {
            // 捕获报错信息
            if ($e->getHttpStatus() != null) {
                header('Status: ' . $e->getHttpStatus());
                echo $e->getHttpBody();
            } else {
                echo $e->getMessage();
            }
        }
    }
}