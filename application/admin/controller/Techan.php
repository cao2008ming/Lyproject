<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/8/7
 * Time: 19:55
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Session;

class Techan extends AdminBase
{
    protected $model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Techan();
    }

    /*
     * 特产列表
     */
    public function index($keyword='',$page=1)
    {

        $map = [];
        if(is_administrator() == false){
            $map['user_id'] = Session::get('admin_id');
        }
        if (!empty($keyword)) {
            $map['title'] = ['like', "%{$keyword}%"];
        }
        $techan_list = $this->model->where($map)->paginate(15, false, ['page' => $page]);
        $this->assign('techan_list',$techan_list);

        $this->chandi();
        $this->assign('keyword',$keyword);
        return $this->fetch();
    }

    /*
     * 添加特产
     */
    public function add()
    {
        $this->chandi();
        get_admin_id();
        return $this->fetch();
    }

    protected function chandi()
    {
        $cityModel = new \app\common\model\City();
        $chandi_list = $cityModel->where('status',1)->select();
        $this->assign('chandi_list',$chandi_list);
    }


}