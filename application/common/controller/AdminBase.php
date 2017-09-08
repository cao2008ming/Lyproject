<?php
namespace app\common\controller;

use org\Auth;
use think\Loader;
use think\Cache;
use think\Controller;
use think\Db;
use think\Session;

/**
 * 后台公用基础控制器
 * Class AdminBase
 * @package app\common\controller
 */
class AdminBase extends Controller
{
    protected $admin_id;

    protected function _initialize()
    {
        parent::_initialize();

        $this->checkAuth();
        $this->getMenu();
        $this->admin_id = Session::get('admin_id');

        $admin_id = Session::get('admin_id');
        $this->assign('admin_id',$admin_id);

        // 输出当前请求控制器（配合后台侧边菜单选中状态）
        $this->assign('controller', Loader::parseName($this->request->controller()));
    }

    /**
     * 权限检查
     * @return bool
     */
    protected function checkAuth()
    {

        if (!Session::has('admin_id')) {
            $this->redirect('admin/login/index');
        }

        $module     = $this->request->module();
        $controller = $this->request->controller();
        $action     = $this->request->action();

        // 排除权限
        $not_check = ['admin/Index/index', 'admin/AuthGroup/getjson', 'admin/System/clear'];

        if (!in_array($module . '/' . $controller . '/' . $action, $not_check)) {
            $auth     = new Auth();
            $admin_id = Session::get('admin_id');
            if (!$auth->check($module . '/' . $controller . '/' . $action, $admin_id) && $admin_id != 1) {
                $this->error('没有权限');
            }
        }
    }

    /**
     * 获取侧边栏菜单
     */
    protected function getMenu()
    {
        $menu     = [];
        $admin_id = Session::get('admin_id');
        $auth     = new Auth();

        $auth_rule_list = Db::name('auth_rule')->where('status', 1)->order(['sort' => 'DESC', 'id' => 'ASC'])->select();

        foreach ($auth_rule_list as $value) {
            if ($auth->check($value['name'], $admin_id) || $admin_id == 1) {
                $menu[] = $value;
            }
        }
        $menu = !empty($menu) ? array2tree($menu) : [];

        $this->assign('menu', $menu);
    }

    /**
     * 判断是否是系统管理员
     * @param mixed $uid
     * @return bool
     */



    protected function isAdministrator( $uid = '' ){
        $adminConf = config('base')['USER_ADMINISTRATOR'];
        $uid = empty($uid) ? session('uid') : $uid;
        if( is_array($adminConf) ){
            if( is_array( $uid ) ){
                $m = array_intersect( $adminConf, $uid );
                if( count($m) ){
                    return TRUE;
                }
            }else{
                if( in_array( $uid, $adminConf ) ){
                    return TRUE;
                }
            }
        }else{
            if( is_array( $uid ) ){
                if( in_array($adminConf,$uid) ){
                    return TRUE;
                }
            }else{
                if( $uid == $adminConf){
                    return TRUE;
                }
            }
        }
        return FALSE;
    }


}