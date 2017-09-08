<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/5/17
 * Time: 13:45
 */

namespace app\admin\controller;


use app\common\model\AddressProvince;
use app\common\model\Cate;
use app\common\controller\AdminBase;
use think\Session;

class Hotel extends AdminBase
{

    protected $model;

    /*
     * 初始化
     */
    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Hotel();
    }

    public function index()
    {
        $admin_id = Session::get('admin_id');

        if ($admin_id == 1){
            $hotel_list = $this->model->select();
            return $this->fetch('index_admin',['hotel_list'=>$hotel_list]);

        } else {
            $hotel_info = $this->model->where('user_id',$admin_id)->find();
            if ( empty($hotel_info) ) {
                return $this->fetch('index_user');
            } else {
                return $this->fetch('index',['hotel_info'=>$hotel_info]);
            }

        }
    }

    /*
     * 添加酒店
     */
    public function add()
    {
        //分类
        $cateModel = new Cate();
        $cate_list = $cateModel->where(['status'=>1,'model_id'=>1])->select();

        $array = [
            'cate_list'     => $cate_list,
        ];
        return $this->fetch('add',$array);
    }

    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $data['user_id'] = Session::get('admin_id');

            $validate_result = $this->validate($data, 'Hotel');

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
        //分类
        $cateModel = new Cate();
        $cate_list = $cateModel->where(['status'=>1,'model_id'=>1])->select();

        //酒店信息
        $data = [];
        $data = $this->model->where('id',$id)->find();

        $array = [
            'cate_list'     => $cate_list,
            'data'          => $data
        ];
        return $this->fetch('edit',$array);
    }

    /*
     * 更新酒店信息
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $validate_result = $this->validate($data, 'Hotel');
            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->model->allowField(true)->save($data,$id)) {
                    $this->success('更新成功','hotel/index');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /*
     * 删除酒店
     */
    public function delete($id)
    {
        $result = $this->model->where('id',$id)->delete();

        if ($result){
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}