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

class Model extends AdminBase
{

    protected $model;

    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Model();
    }

    /*
     * 模型列表
     */
    public function index()
    {

        $model_list = $this->model->select();

        return $this->fetch('index',['model_list'=>$model_list]);


    }

    /*
     * 添加模型
     */

    public function add()
    {

        return $this->fetch();
    }

    /*
     * 保存模型
     */
    public function save()
    {
        if (request()->isPost()){
            $data            = request()->post();
            $validate_result = $this->validate($data,'Model');
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
     * 编辑模型
     */
    public function edit($id)
    {

        $result = $this->model->find($id);
        return $this->fetch('edit',['model'=>$result]);
    }


    /*
     * 更新模型
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


    public function delete($id)
    {
        if ($this->model->destroy($id)) {
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }
}