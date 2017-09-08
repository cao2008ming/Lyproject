<?php
/**
 * $desc
 * Created by PhpStorm.
 * User: torans <321870617@qq.com>
 * Date: 17/6/30
 * Time: 11:44
 */

namespace app\home\controller;


use app\common\controller\HomeBase;
use app\home\validate;
use think\Config;
use think\Session;

class User extends HomeBase
{

    protected $model;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\common\model\User();
    }

    /*
     * 用户登录
     */
    public function login()
    {
        if ($this->request->isPost()) {
            $data = $this->request->only(['username', 'password']);
            $validate_result = $this->validate($data, 'Login');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                $where['username'] = $data['username'];
                $where['password'] = md5($data['password'] . Config::get('salt'));

                $user = $this->model->field('id,username,status')->where($where)->find();

                if (!empty($user)) {
                    if ($user['status'] != 1) {
                        $this->error('当前用户已禁用');
                    } else {
                        Session::set('user_id', $user['id']);
                        Session::set('user_name', $user['username']);
                        $this->model->update(
                            [
                                'last_login_time' => date('Y-m-d H:i:s', time()),
                                'last_login_ip' => $this->request->ip(),
                                'id' => $user['id']
                            ]
                        );
                        $this->success('恭喜！登录成功', '');
                    }
                } else {
                    $this->error('抱歉！用户名或密码错误');
                }
            }
        }
    }

    /**
     * 退出登录
     */
    public function logout()
    {
        Session::delete('user_id');
        Session::delete('user_name');
        $this->success('退出成功', '/');
    }

    /*
     * 用户注册
     */
    public function register()
    {
        if (request()->isPost()) {
            $data = request()->post();
            $validate_result = $this->validate($data, 'Register');

            if ($validate_result !== true) {
                $this->error($validate_result);
            } else {
                if ($data['password'] == $data['password1']) {
                    $data['password'] = md5($data['password'].Config::get('salt'));
                }
                if ($this->model->allowField(true)->save($data)) {
                    $this->success('注册成功');
                } else {
                    $this->error('注册失败');
                }
            }

        } else {
            return $this->fetch();
        }
    }
}