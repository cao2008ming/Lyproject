<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/5/25
 * Time: 11:57
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;

class HotelCate extends AdminBase
{
    protected $model;
    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\HotelCate();
    }

    /**
     * 客房分类首页
     * @return mixed
     * @return
     */
    public function index()
    {
        $cate_list = $this->model->where('status',1)->select();
        return $this->fetch('index',['cate_list'=>$cate_list]);
    }


    public function add()
    {
        return $this->fetch();
    }
    /**
     * 保存客房分类信息
     * @return
     */
    public function save()
    {
        if (request()->isPost()){

            $data            = request()->param();
            $validate_result = $this->validate($data,'HotelCate');

            if ($validate_result !==true){

                $this->error($validate_result);

            } else {
               if ($this->model->allowField(true)->save($data)){

                   $this->success('添加成功','HotelCate/index');
               } else {
                   $this->error('添加失败');
               }
            }
        }
    }

    /**
     * 编辑客房分类信息
     * @param $id
     * @return mixed
     * @return
     */
    public function edit($id)
    {
        $cate = $this->model->where('id',$id)->find();

        return $this->fetch('edit',['cate'=>$cate]);
    }

    /**
     * 更新客房分类信息
     * @param $id
     * @return
     */
    public function update($id)
    {

        if (request()->isPost()){

            $data            = request()->param();
            $validate_result = $this->validate($data,'HotelCate');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->model->allowField(true)->save($data,$id)){

                    $this->success('更新成功','HotelCate/index');
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