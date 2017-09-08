<?php

use think\Db;
use think\Session;

/**
 * 获取分类所有子分类
 * @param int $cid 分类ID
 * @return array|bool
 */
function get_category_children($cid)
{
    if (empty($cid)) {
        return false;
    }

    $children = Db::name('category')->where(['path' => ['like', "%,{$cid},%"]])->select();

    return array2tree($children);
}

/**
 * 根据分类ID获取文章列表（包括子分类）
 * @param int   $cid   分类ID
 * @param int   $limit 显示条数
 * @param array $where 查询条件
 * @param array $order 排序
 * @param array $filed 查询字段
 * @return bool|false|PDOStatement|string|\think\Collection
 */
function get_articles_by_cid($cid, $limit = 10, $where = [], $order = [], $filed = [])
{
    if (empty($cid)) {
        return false;
    }

    $ids = Db::name('category')->where(['path' => ['like', "%,{$cid},%"]])->column('id');
    $ids = (!empty($ids) && is_array($ids)) ? implode(',', $ids) . ',' . $cid : $cid;

    $fileds = array_merge(['id', 'cid', 'title', 'introduction', 'thumb', 'reading', 'publish_time'], (array)$filed);
    $map    = array_merge(['cid' => ['IN', $ids], 'status' => 1, 'publish_time' => ['<= time', date('Y-m-d H:i:s')]], (array)$where);
    $sort   = array_merge(['is_top' => 'DESC', 'sort' => 'DESC', 'publish_time' => 'DESC'], (array)$order);

    $article_list = Db::name('article')->where($map)->field($fileds)->order($sort)->limit($limit)->select();

    return $article_list;
}

/**
 * 根据分类ID获取文章列表，带分页（包括子分类）
 * @param int   $cid       分类ID
 * @param int   $page_size 每页显示条数
 * @param array $where     查询条件
 * @param array $order     排序
 * @param array $filed     查询字段
 * @return bool|\think\paginator\Collection
 */
function get_articles_by_cid_paged($cid, $page_size = 15, $where = [], $order = [], $filed = [])
{
    if (empty($cid)) {
        return false;
    }

    $ids = Db::name('category')->where(['path' => ['like', "%,{$cid},%"]])->column('id');
    $ids = (!empty($ids) && is_array($ids)) ? implode(',', $ids) . ',' . $cid : $cid;

    $fileds = array_merge(['id', 'cid', 'title', 'introduction', 'thumb', 'reading', 'publish_time'], (array)$filed);
    $map    = array_merge(['cid' => ['IN', $ids], 'status' => 1, 'publish_time' => ['<= time', date('Y-m-d H:i:s')]], (array)$where);
    $sort   = array_merge(['is_top' => 'DESC', 'sort' => 'DESC', 'publish_time' => 'DESC'], (array)$order);

    $article_list = Db::name('article')->where($map)->field($fileds)->order($sort)->paginate($page_size);

    return $article_list;
}

/**
 * 数组层级缩进转换
 * @param array $array 源数组
 * @param int   $pid
 * @param int   $level
 * @return array
 */
function array2level($array, $pid = 0, $level = 1)
{
    static $list = [];
    foreach ($array as $v) {
        if ($v['pid'] == $pid) {
            $v['level'] = $level;
            $list[]     = $v;
            array2level($array, $v['id'], $level + 1);
        }
    }

    return $list;
}

/**
 * 构建层级（树状）数组
 * @param array  $array          要进行处理的一维数组，经过该函数处理后，该数组自动转为树状数组
 * @param string $pid_name       父级ID的字段名
 * @param string $child_key_name 子元素键名
 * @return array|bool
 */
function array2tree(&$array, $pid_name = 'pid', $child_key_name = 'children')
{
    $counter = array_children_count($array, $pid_name);
    if (!isset($counter[0]) || $counter[0] == 0) {
        return $array;
    }
    $tree = [];
    while (isset($counter[0]) && $counter[0] > 0) {
        $temp = array_shift($array);
        if (isset($counter[$temp['id']]) && $counter[$temp['id']] > 0) {
            array_push($array, $temp);
        } else {
            if ($temp[$pid_name] == 0) {
                $tree[] = $temp;
            } else {
                $array = array_child_append($array, $temp[$pid_name], $temp, $child_key_name);
            }
        }
        $counter = array_children_count($array, $pid_name);
    }

    return $tree;
}

/**
 * 子元素计数器
 * @param array $array
 * @param int   $pid
 * @return array
 */
function array_children_count($array, $pid)
{
    $counter = [];
    foreach ($array as $item) {
        $count = isset($counter[$item[$pid]]) ? $counter[$item[$pid]] : 0;
        $count++;
        $counter[$item[$pid]] = $count;
    }

    return $counter;
}

/**
 * 把元素插入到对应的父元素$child_key_name字段
 * @param        $parent
 * @param        $pid
 * @param        $child
 * @param string $child_key_name 子元素键名
 * @return mixed
 */
function array_child_append($parent, $pid, $child, $child_key_name)
{
    foreach ($parent as &$item) {
        if ($item['id'] == $pid) {
            if (!isset($item[$child_key_name]))
                $item[$child_key_name] = [];
            $item[$child_key_name][] = $child;
        }
    }

    return $parent;
}

/**
 * 循环删除目录和文件
 * @param string $dir_name
 * @return bool
 */
function delete_dir_file($dir_name)
{
    $result = false;
    if (is_dir($dir_name)) {
        if ($handle = opendir($dir_name)) {
            while (false !== ($item = readdir($handle))) {
                if ($item != '.' && $item != '..') {
                    if (is_dir($dir_name . DS . $item)) {
                        delete_dir_file($dir_name . DS . $item);
                    } else {
                        unlink($dir_name . DS . $item);
                    }
                }
            }
            closedir($handle);
            if (rmdir($dir_name)) {
                $result = true;
            }
        }
    }

    return $result;
}

/**
 * 判断是否为手机访问
 * @return  boolean
 */
function is_mobile()
{
    static $is_mobile;

    if (isset($is_mobile)) {
        return $is_mobile;
    }

    if (empty($_SERVER['HTTP_USER_AGENT'])) {
        $is_mobile = false;
    } elseif (strpos($_SERVER['HTTP_USER_AGENT'], 'Mobile') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Android') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Silk/') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Kindle') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'BlackBerry') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mini') !== false
        || strpos($_SERVER['HTTP_USER_AGENT'], 'Opera Mobi') !== false
    ) {
        $is_mobile = true;
    } else {
        $is_mobile = false;
    }

    return $is_mobile;
}

/**
 * 手机号格式检查
 * @param string $mobile
 * @return bool
 */
function check_mobile_number($mobile)
{
    if (!is_numeric($mobile)) {
        return false;
    }
    $reg = '#^13[\d]{9}$|^14[5,7]{1}\d{8}$|^15[^4]{1}\d{8}$|^17[0,6,7,8]{1}\d{8}$|^18[\d]{9}$#';

    return preg_match($reg, $mobile) ? true : false;
}


function get_model_name($model_id){

    $result =  db('model')->where('id',$model_id)->find();
    return $result['name'];
}

function get_cate_name($cate_id){

    $result =  db('cate')->where('id',$cate_id)->find();
    return $result['name'];
}

function isAdministrator(){

    $uid = \think\Session::get('admin_id');
    if ($uid = 1){
        return true;
    } else {
        return false;
    }
}

/**
 * 获取酒店名称
 * @param $value
 * @return mixed
 * @return
 */
function get_hotel_name($value){

    $data = \app\common\model\Hotel::get($value);
    return $data['name'];
}

/**
 * 获取当前登录的管事员id
 * @return int
 */
function get_current_admin_id(){
   return Session::get('admin_id');
}
/*
 * 获取中文状态
 */
function get_status_info($value)
{
    $status = ['0'=>'待审核','1'=>'已审核','2'=>'未通过','3'=>'被禁用'];
    return $status[$value];
}

/*
 * 获取车型（自/手动挡）
 */
function get_dangwei_info($value)
{
    $status = ['1'=>'手动挡','2'=>'自动挡'];
    return $status[$value];
}

//获取普通用户名字
function get_user_name($value)
{
    return  \app\common\model\User::get($value)->value('username');
}

//获取用户头像
function get_user_avatar($value)
{
    $avatar = \app\common\model\User::get($value)->value('thumb');
    if (is_null($avatar)){
        $avatar= '/public/static/images/default_avatar.png';
    }

    return $avatar;
}

//获取酒店客房名称
function get_room_name($value)
{
    $data = \app\common\model\HotelRooms::get($value);
    return $data['name'];
}

//生成订单号
function create_order_no($type){
    $front = ['1'=>'HT','2'=>'DY'];
    //todo:添加更多订单号前缀

    return $front[$type].date('mds',time()).substr(md5(time()),0,4);
}

//计算时间差（日）
function get_days($start,$end){
    $difference = strtotime($end)-strtotime($start);
    return ($difference/(24*3600));

}

//获取租车公司名称
function get_car_name($value)
{
    return \app\common\model\Car::where('id',$value)->value('name');
}

//根据生日计算年龄
function get_age_by_birthday($value)
{
    $birth=$value;
    list($by,$bm,$bd)=explode('-',$birth);
    $cm=date('n');
    $cd=date('j');
    $age=date('Y')-$by-1;
    if ($cm>$bm || $cm==$bm && $cd>$bd) $age++;
    return $age;
}

//判断是否为管理员
function is_administrator()
{
    if(Session::get('admin_id') == 1){
        return true;
    } else {
        return false;
    }
}

function get_admin_id()
{
    $admin_id  = Session::get('admin_id');
    return $admin_id;
}

/**
+----------------------------------------------------------
 * 浏览记录按照时间排序
+----------------------------------------------------------
 */
function my_sort($a, $b){
    $a = substr($a,1);
    $b = substr($b,1);
    if ($a == $b) return 0;
    return ($a > $b) ? -1 : 1;
}

/**
+----------------------------------------------------------
 * 网页浏览记录生成
+----------------------------------------------------------
 */
function cookie_history($id,$title){
    $dealinfo['title'] = $title;
    $dealinfo['id'] = $id;
    $time = 't'.time();
    $cookie_history = array($time => json_encode($dealinfo));  //设置cookie
    if (!cookie('history')){//cookie空，初始一个
        cookie('history',$cookie_history);
    }else{
        $new_history = array_merge(cookie('history'),$cookie_history);//添加新浏览数据
        uksort($new_history, "my_sort");//按照浏览时间排序
        $history = array_unique($new_history);
        if (count($history) > 4){
            $history = array_slice($history,0,4);
        }
        cookie('history',$history);
    }
}
/**
+----------------------------------------------------------
 * 网页浏览记录读取
+----------------------------------------------------------
 */
function cookie_history_read(){
    $arr = cookie('history');
    $list = [];
    foreach ((array)$arr as $k => $v){
        $list[$k] = json_decode($v,true);
    }
    return $list;
}

function mdate($time = NULL) {

    $text = '';

    $time = $time === NULL || $time > time() ? time() : intval($time);

    $t = time() - $time; //时间差 （秒）

    $y = date('Y', $time)-date('Y', time());//是否跨年

    switch($t){

        case $t == 0:

            $text = '刚刚';

            break;

        case $t < 60:

            $text = $t . '秒前'; // 一分钟内

            break;

        case $t < 60 * 60:

            $text = floor($t / 60) . '分钟前'; //一小时内

            break;

        case $t < 60 * 60 * 24:

            $text = floor($t / (60 * 60)) . '小时前'; // 一天内

            break;

        case $t < 60 * 60 * 24 * 3:

            $text = floor($time/(60*60*24)) ==1 ?'昨天 ' . date('H:i', $time) : '前天 ' . date('H:i', $time) ; //昨天和前天

            break;

        case $t < 60 * 60 * 24 * 30:

//            $text = date('m月d日 H:i', $time); //一个月内
            $text = '一个月内'; //一个月内

            break;

        case $t < 60 * 60 * 24 * 365&&$y==0:

//            $text = date('m月d日', $time); //一年内
            $text = '一年内'; //

            break;

        default:

//            $text = date('Y年m月d日', $time); //一年以前
            $text = '一年以前'; //一年以前

            break;

    }



    return $text;

}
/*
 * 获取酒店平均评分
 */
function get_hotel_avg_score($id)
{
    $model = new \app\common\model\HotelComments();
    $score = $model->where('hotel_id',$id)->avg('score');
    if(is_null($score)){
        $score = '暂无评分';
    }
    return $score;
}

/*
 * 获取酒店评论总数
 */
function get_hotel_comments_total($id){
    $model = new \app\common\model\HotelComments();
    $sum = $model->where('hotel_id',$id)->count();
    return $sum;
}
/*
 * 获取酒店最新下单时间
 */
function get_hotel_checkin_newsttime($id)
{
    $model = new \app\common\model\OrderCheckin();
    $newst = $model->where('hotel_id',$id)->order('create_time DESC')->limit(1)->value('create_time');
    if(is_null($newst)){
        $newst = time() - 30*24*3600;
    }
    return $newst;
}
