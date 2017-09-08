<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/5/17
 * Time: 10:07
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use app\common\model\Model;

class Cate extends AdminBase
{

    protected $model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Cate();
    }

    /*
     * 分类列表
     */
    public function index()
    {

        $cate_list = $this->model->select();

        return $this->fetch('index',['cate_list'=>$cate_list]);


    }

    /*
     * 添加分类
     */

    public function add()
    {
        $modelModel = new Model();
        $model_list = $modelModel->where('status',1)->select();

        return $this->fetch('add',['model_list'=>$model_list]);
    }

    /*
     * 保存分类
     */
    public function save()
    {
        if (request()->isPost()){
            $data            = request()->post();

            $validate_result = $this->validate($data,'Cate');
            if ($validate_result !== true){

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


    /*
     * 编辑分类
     */
    public function edit($id)
    {
        $modelModel = new Model();
        $model_list = $modelModel->where('status',1)->select();

        $result = $this->model->find($id);
        return $this->fetch('edit',['cate'=>$result,'model_list'=>$model_list]);
    }


    /*
     * 更新分类
     */
    public function update($id)
    {
        if (request()->isPost()){
            $data            = request()->post();
            $validate_result = $this->validate($data,'Model');
            if ($validate_result !== true){
                $this->error($validate_result);
            } else {
                if ($this->model->allowField(true)->save($data,$id)) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }

        }
    }


    /*
     * 删除分类
     */
    public function delete($id)
    {
        if ($this->model->destroy($id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}