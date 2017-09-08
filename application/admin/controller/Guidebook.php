<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/6
 * Time: 13:19
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use app\common\model\Guide;
use think\Session;

/**
 * 导游端粒
 * Class Guidebook
 * @package app\admin\controller
 */
class Guidebook extends AdminBase
{


    protected $model;
    protected  $admin_id;

    protected function _initialize()
    {

        parent::_initialize();
        $this->model = new Guide();
        $this->admin_id = Session::get('admin_id');
    }

    /**
     * 导游管理-首页
     * 如果是系统管理员，则显示导游列表，
     * 导游用户则判断是有填写基本信息且通过审核，
     * 有则显示基本信息，同时显示添加商品入口，
     * 否则显示提交信息页面
     * @return
     */
    public function index()
    {
        if ($this->admin_id == 1){
            $guidebook_list = $this->model->select();
            return $this->fetch('index_admin',['guidebook_list'=>$guidebook_list]);

        } else {
            $guidebook_info = $this->model->where('user_id',$this->admin_id)->find();
            if ( empty($guidebook_info) ) {
                return $this->fetch('index_user');
            } else {
                return $this->fetch('index',['guidebook_info'=>$guidebook_info]);
            }
        }
    }

    /**
     * 添加个人信息
     * @return mixed|void
     * @return
     */
    public function add()
    {
        if ($this->admin_id == 1){
            return $this->fetch('add');
        } else {
            $guidebook_info = $this->model->where('user_id',$this->admin_id)->find();
            if ( empty($guidebook_info) ) {
                return $this->fetch('add');
            } else {
                $this->error('您已经添加过个人信息，不能重复添加');
            }

        }
    }

    /**
     * 保存信息
     * @return
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $data['user_id'] = Session::get('admin_id');
            $validate_result = $this->validate($data, 'Guidebook');

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

    /**
     * 编辑导游信息
     * 如果为系统管理员，则可以修改任意商品
     * 否则只能编辑自己发布的商品
     * @param $id
     * @return
     */
    public function edit($id)
    {
        if ($this->admin_id == 1){
            $data = $this->model->where('id',$id)->find();
            return $this->fetch('edit',['data'=>$data]);
        }else {
            //判断是否为自己发布的商品
            $data = $this->model->where(['user_id'=>$this->admin_id,'id'=>$id])->find();
            if (!empty($data)){
                return $this->fetch('edit',['data'=>$data]);
            } else {
                $this->error('您不能编辑该信息');
            }
        }
    }


    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();

            $validate_result = $this->validate($data, ' Guidebook');
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

    public function plan()
    {
        return $this->fetch();
    }
    /**
     * 删除导游信息
     * @param $id
     * @return
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