<?php
/** 单页面控制器
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/21
 * Time: 10:06
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Db;

class Pages extends AdminBase
{


    protected $model;

    /**
     * 初始化
     * @return
     */
    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\Pages();
    }

    /**
     * 单页列表
     * @return mixed
     * @return
     */
    public function index()
    {
        $data = $this->model->select();
        $this->assign('data',$data);
        return $this->fetch();
    }
    /**
     * 添加单页
     * @return mixed
     * @return
     */
    public function add()
    {
        return $this->fetch();
    }

    /**
     *  保存信息
     */
    public function save()
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Pages');

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
     * 编辑文章
     * @param $id
     * @return mixed
     */
    public function edit($id)
    {
        $info = $this->model->find($id);

        return $this->fetch('edit', ['info' => $info]);
    }

    /**
     * 更新文章
     * @param $id
     */
    public function update($id)
    {
        if ($this->request->isPost()) {
            $data            = $this->request->param();
            $validate_result = $this->validate($data, 'Pages');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($this->model->allowField(true)->save($data, $id) !== false) {
                    $this->success('更新成功');
                } else {
                    $this->error('更新失败');
                }
            }
        }
    }

    /**
     * 删除单页
     * @param int   $id
     */
    public function delete($id = 0)
    {
        if ($id) {
            if ($this->model->destroy($id)) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        } else {
            $this->error('请选择需要删除的单页');
        }
    }
}