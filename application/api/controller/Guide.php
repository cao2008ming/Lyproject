<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/7/11
 * Time: 12:46
 */

namespace app\api\controller;


use app\common\controller\ApiBase;
use think\Loader;

class Guide extends ApiBase
{

    protected $model;
    protected $logic;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\api\model\Guide();
        $this->logic = Loader::model('Guide','logic');
    }

    public function getList($page=1)
    {
        $field = 'id,id as servered,id as score,name,thumb,shanchang,introduction,id as price';
        $data = $this->model->field($field)->paginate(10);
        return json($data);
    }
}