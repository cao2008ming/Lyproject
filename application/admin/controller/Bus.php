<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/14
 * Time: 17:14
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Session;

class Bus extends AdminBase
{

    protected $model;

    //初始化
    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Bus();
    }

    //车辆列表
    public function index()
    {
        if (get_current_admin_id() !=1){
            $data = $this->model->where(['car_id'=>get_current_admin_id()])->order('bus_id DESC')->select();
        } else {
            $data = $this->model->order('bus_id DESC')->select();
        }
        return $this->fetch('index',['bus_list'=>$data]);
    }

    //添加车辆信息
    public function add()
    {
        return $this->fetch('add');
    }

    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $data['car_id'] = Session::get('admin_id');
            $validate_result = $this->validate($data, 'Bus');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->model->allowField(true)->save($data)) {
                    $this->success('保存成功');
                } else {
                    $this->error('保存失败');
                }
            }
        }
    }

    public function edit($id)
    {
        //车辆信息
        $data = [];
        $data = $this->model->where('bus_id',$id)->find();

        $array = [
            'data'          => $data
        ];
        return $this->fetch('edit',$array);
    }

    /*
     * 更新车辆信息
     */
    public function update($bus_id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $validate_result = $this->validate($data, 'Bus');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->model->allowField(true)->save($data,$bus_id)) {
                    $this->success('更新成功','bus/index');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /*
     * 删除车辆
     */
    public function delete($id)
    {
        $result = $this->model->where('bus_id',$id)->delete();

        if ($result){
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}