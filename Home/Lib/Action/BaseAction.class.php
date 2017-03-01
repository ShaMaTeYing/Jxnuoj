<?php
// 本类由系统自动生成，仅供测试用途
class BaseAction extends Action {
   function _initialize(){
		$is_black = M('black_user')->where(array('ip'=>get_client_ip(),'status'=>1))->count();
		if($is_black)
			$this->error('你已经被拉入黑名单，请联系管理员！');
		$userinfo=session('userinfo');
		$login=M('user')->where(array('id'=>$userinfo['id']))->find();
		$loginStatus=session('loginStatus');
		if(!$login['status']&&$loginStatus)
		{
			session('loginStatus','0');//退出登录
			$this->error('你已经被禁用，请联系管理员！',U('Index/index'));
		}
	   //控制切换登录窗口
		$this->assign('loginStatus',session('loginStatus')?session('loginStatus'):0);
		if(session('loginStatus'))//登录成功则传值给模板变量
		{
			$this->assign('data',session('userinfo'));
		}
   }
}