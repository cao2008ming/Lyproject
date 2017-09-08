<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/19
 * Time: 15:00
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use think\Session;

class RoutesUser extends AdminBase
{

    protected $model;
    protected  $admin_id;

    protected function _initialize()
    {

        parent::_initialize();
        $this->model = new \app\common\model\RoutesUser();
        $this->admin_id = Session::get('admin_id');
    }

    /**
     *  车辆管理-首页
     * 如果是系统管理员，则显示车辆用户列表，
     * 车辆用户则判断是有填写基本信息且通过审核，
     * 有则显示基本信息，同时显示添加商品入口，
     * 否则显示提交信息页面
     * @return
     */
    public function index()
    {
        if ($this->admin_id == 1){
            $route_list = $this->model->select();
            return $this->fetch('index_admin',['route_list'=>$route_list]);

        } else {
            $route_info = $this->model->where('user_id',$this->admin_id)->find();
            if ( empty($route_info) ) {
                return $this->fetch('index_user');
            } else {
                return $this->fetch('index',['route_info'=>$route_info]);
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
            $route_info = $this->model->where('user_id',$this->admin_id)->find();
            if ( empty($route_info) ) {
                return $this->fetch('add');
            } else {
                $this->error('您已经添加过该信息，不能重复添加');
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
            $validate_result = $this->validate($data, 'RoutesUser');

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
            $data = $this->model->where('routes_user_id',$id)->find();
            return $this->fetch('edit',['data'=>$data]);
        }else {
            //判断是否为自己发布的商品
            $data = $this->model->where(['user_id'=>$this->admin_id,'routes_user_id'=>$id])->find();
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

            $validate_result = $this->validate($data, ' route');
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
        $result = $this->model->where('routes_user_id',$id)->delete();

        if ($result){
            $this->success('删除成功');
        } else {
            $this->error('删除失败');
        }
    }

    /*
     * 用户信息
     */
    public function info($id=0)
    {
        $info = $this->model->where('routes_user_id',$id)->find();

        return $this->fetch('info',['info'=>$info]);
    }
    /**
     * 审核
     * @param $id
     * @return
     */
    public function  open($id)
    {
        $result = $this->model->where('routes_user_id',$id)->setField('status',1);

        if ($result){
            $this->success('审核通过');
        } else {
            $this->error('审核失败');
        }
    }

    /**
     * 禁用
     * @param $id
     * @return
     */
    public function  close($id)
    {
        $result = $this->model->where('routes_user_id',$id)->setField('status',0);

        if ($result){
            $this->success('已禁用该账户');
        } else {
            $this->error('禁用失败');
        }
    }

    public function open_recommend($id=0)
    {
        $result = $this->model->where('routes_user_id',$id)->setField('is_recommend',1);

        if ($result){
            $this->success('推荐成功');
        } else {
            $this->error('推荐失败');
        }
    }

    public function close_recommend($id=0)
    {
        $result = $this->model->where('routes_user_id',$id)->setField('is_recommend',0);

        if ($result){
            $this->success('已取消推荐');
        } else {
            $this->error('取消推荐失败');
        }
    }
}