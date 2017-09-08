<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/5/24
 * Time: 11:31
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;
use app\common\model\Hotel;
use think\Session;

/**
 * Class HotelRooms
 * @package app\admin\controller
 */
class HotelRooms extends AdminBase

{
    protected $model;
    protected $uid;

    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\HotelRooms();
        $this->uid   = Session::get('admin_id');
    }

    /*
     * 客房列表
     */
    public function index()
    {
        if (isAdministrator()){
            $room_list = $this->model->select();
            return $this->fetch('index_admin',['room_list'=>$room_list]);
        }else{
            $room_list = $this->model->where('user_id',$this->uid)->select();
            return $this->fetch('index_user',['room_list'=>$room_list]);
        }
    }

    /*
     * 创建客房
     */
    public function add()
    {

        //客房类型
        $room_cate_model = new \app\common\model\HotelCate();
        $room_cate = $room_cate_model->where('status',1)->select();
        $array = [
            'cate_list' => $room_cate,
            'admin_id'  => $this->uid,
            'hotel_list'=> Hotel::all()
        ];

        return $this->fetch('add',$array);
    }

    public function save()
    {
        if (request()->isPost()){
            $data            = request()->post();

            $validate_result = $this->validate($data,'HotelRooms');
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
     * 编辑
     */
    public function edit($id)
    {

        //客房类型
        $room_cate_model = new \app\common\model\HotelCate();
        $room_cate = $room_cate_model->where('status',1)->select();
        $room_info = $this->model->where('id',$id)->find();
        $array = [
            'cate_list' => $room_cate,
            'admin_id'  => $this->uid,
            'hotel_list'=> Hotel::all(),
            'data'      => $room_info
        ];

        return $this->fetch('edit',$array);
    }

    /**
     * 更新客房信息
     * @param $id
     * @return
     */
    public function update($id)
    {
        if (request()->isPost()){
            $data            = request()->post();

            $validate_result = $this->validate($data,'HotelRooms');
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
