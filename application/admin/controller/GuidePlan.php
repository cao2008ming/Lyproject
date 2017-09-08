<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/12
 * Time: 14:58
 */

namespace app\admin\controller;


use app\common\controller\AdminBase;

class GuidePlan extends AdminBase
{

    protected $model;

    //初始化
    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\GuidePlan();
    }


    //我的计划日程
    public function getMyPlan($id=0)
    {
        $Today = date("Y-m-d",time());
        $admin_id = get_current_admin_id();
        if ($admin_id !=1){
            $id = $admin_id;
        }
        $conditon = [
            'guide_id' =>$id,
            'date'     =>['>=',$Today]
        ];
        $data = $this->model->where($conditon)->field('date as start, status as color,status as title')->select();

        return json($data);
    }

    public function changePlan()
    {
        if (request()->isPost()){
            $data  = request()->post();

            $condition = [];
            $condition['guide_id'] = $data['guide_id'] = get_current_admin_id();
            $condition['date']     = $data['date'];

            $chkPlan = $this->model->where($condition)->find();

            if (!is_null($chkPlan) && $chkPlan['status'] ==1){
                $data['status'] = 2;
                $result = $this->model->where($condition)->update($data);
                $backgroundColor = '#e53935';
            }
            elseif (!is_null($chkPlan) && $chkPlan['status'] ==2){
                $data['status'] = 1;
                $result = $this->model->where($condition)->update($data);
                $backgroundColor = '#4CAF50';
            }
            else {
                $data['status'] = 1;
                $result = $this->model->save($data);
                $backgroundColor = '#4CAF50';

            }
           if ($result){
               return json(['code'=>201,'backgroundColor'=>$backgroundColor,'message'=>'操作成功']);
           } else {
               return json(['code'=>500,'backgroundColor'=>$backgroundColor,'message'=>'操作失败']);
           }
        }
    }
}