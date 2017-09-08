<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/11
 * Time: 11:06
 */

namespace app\api\controller;


use app\common\controller\ApiBase;
use app\common\model\Article;

class News extends ApiBase
{

    protected $model;

    public function _initialize(){
        parent::_initialize();
        $this->model = new Article();
    }
    public function getList($page=1)
    {
        $condition['status'] =1;
        $data = $this->model->where($condition)->field('id,thumb,title,introduction,publish_time')->order('id DESC')->paginate(10);
        return json($data);
    }
}