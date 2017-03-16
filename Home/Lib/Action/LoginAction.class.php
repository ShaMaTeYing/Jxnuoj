<?php
// 本类由系统自动生成，仅供测试用途
class LoginAction extends BaseAction {
	public function showLogin(){
		$this->display();
	}
	//登录判断函数
	public function login(){
		$login_msg_data = array();//记录登录信息
		$login_msg_data['ip']=get_client_ip();//获取ip
		import('ORG.Net.IpLocation');// 导入IpLocation类
		$Ip = new IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
		$location= $Ip->getlocation(get_client_ip()); // 获取某个IP地址所在的位置
		$login_msg_data['area'] =  $location['country'].$location['area'];
		$login_msg_data['login_time']=time();
		$login_msg_data['username']=$_POST['username'];
		$login_msg_data['password']=$_POST['password'];
		$username = $_POST['username'];//获取POST传值
		$psw =$_POST['password'];
		
		
		$username=htmlspecialchars($username);//将HTML标签转义
		$psw=htmlspecialchars($psw);
		$user=M('user')->where(array('username'=>$username))->find();
		
		$login_msg=M('login_msg');
		//判断用户是否存在
		if(!$user){
			$login_msg_data['status']='用户不存在';
			$login_msg->add($login_msg_data);
			session('loginStatus',0);
			$this->error('用户不存在!');
		}
		//判断用户是否禁用
		if($user['status']==0){
			$login_msg_data['status']='用户已被禁用';
			session('loginStatus',0);
			$login_msg->add($login_msg_data);
			$this->error('用户已被禁用!');
		}
		//判断用户的邮箱是否验证
		if($user['status']==2){
			$login_msg_data['status']='用户邮箱未验证';
			session('loginStatus',0);
			$login_msg->add($login_msg_data);
			$this->error('用户邮箱未验证!');
		}
		//判断用户的密码是否一致
		if($user['password']==$psw){
			$login_msg_data['status']='登录成功';
			session('loginStatus',1);//显示登录成功的界面
			session('userinfo',$user);//设置userinfo的值，以便传值给模板
			//$this->success('登录成功',U('Index/index'));
			$ID=$login_msg->add($login_msg_data);
			if($ID){
				dump(ID);
			}else {
				$this->error('写入login_msg数据库失败!');
			}
			$this->redirect('Index/index');
		}else {
			$login_msg_data['status']='密码错误';
			session('loginStatus',0);//继续显示登录界面
			$login_msg->add($login_msg_data);
			$this->error('密码错误!');
		}
		
	}
	public function myMD5($value){
		$ans='';
		$value=md5($value);
		for($i=0;$i<strlen($value);$i++){
			if($i%2==0) {
				$ans=$ans.$value[$i];
			}
		}
		return $ans;
	}
	//退出登录函数
	public function logout(){
		session('loginStatus',null);
		$login_msg_data = array();
		$login_msg_data['ip']=get_client_ip();//获取ip
		import('ORG.Net.IpLocation');// 导入IpLocation类
		$Ip = new IpLocation('UTFWry.dat'); // 实例化类 参数表示IP地址库文件
		 
		$location= $Ip->getlocation(get_client_ip()); // 获取某个IP地址所在的位置
		$login_msg_data['area'] =  $location['country'].$location['area'];
		
		$login_msg_data['login_time']=time();
		$userinfo=session('userinfo');
		$login_msg_data['username']=$userinfo['username'];
		$login_msg_data['status']='退出成功';
		M('login_msg')->add($login_msg_data);
		//$this->success('退出成功！','index');
		$this->redirect('Index/index');
	}
	//显示注册页面
	public function showRegister(){
		$this->display();
	}
	//判断注册信息
	public function register(){
		//dump($_POST);
		//die;
		if(!session('regUser')){
			$regUser['ip'] = get_client_ip();
			$regUser['time'] = time();
			$regUser['miuCount'] = 1;
			$regUser['totalCount'] = 1;
			session('regUser',$regUser);
		}
		else {
			$regUser = session('regUser');
			$data['ip'] = get_client_ip();
			if($regUser['totalCount']>5){
				M('black_user')->add($data);
				$this->error('非法操作!');
			}
			if(time()-$regUser['time']<60){
				if($regUser['miuCount']>2){
					$this->error('非法操作,请稍后重试!');
				}else {
					$regUser['miuCount']++;
				}
			}else{
				$regUser['ip'] = get_client_ip();
				$regUser['time'] = time();
				$regUser['miuCount'] = 0;
			}
			$regUser['totalCount']++;
			session('regUser',$regUser);
		}
		if($_POST['username']==''){
			$this->error("用户名不能为空！");
		}else if($_POST['nickname']==''){
			$this->error("昵称不能为空！");
		}else if($_POST['password']==''){
			$this->error("密码不能为空！");
		}else if($_POST['repassword']==''){
			$this->error("确认密码不能为空！");
		}else if($_POST['realname']==''){
			$this->error("真实姓名不能为空！");
		}else if($_POST['mail']==''){
			$this->error("邮箱不能为空！");
		}else if($_POST['repassword']!=$_POST['password']){
			$this->error("两次密码不一致！");
		}else {
			$data=M('user')->where(array('username'=>$_POST['username']))->find();//用户名判重
			$data1=M('user')->where(array('mail'=>$_POST['mail']))->find();//邮箱判重
			if($data['status'] == 1){
				$this->error("该用户已经存在，请重新注册！");
			}
			if($data['status'] == 2)
				$this->error("该用户已提交注册申请，请进入邮箱进行注册认证！"); 

			if($data1['status'] == 1){
				$this->error("该邮箱已经存在，请重新注册！");
			}
			if($data1['status'] == 2)
				$this->error("该邮箱对应的用户已提交注册申请，请进入邮箱进行注册认证！"); 

			$_POST['register_time']=time();

			foreach($_POST as $key => $value){
				$_POST[$key]=htmlspecialchars($value);
			}

			$status = M('user')->add($_POST);
			if($status){
				$this->sendMail(0,$_POST['mail']);
				session('userRegId',$status);
				$this->success("邮箱验证已发送，请及时进入邮箱进行验证.",U("Index/index"));
			}
		}
	}

	/* 获取用户邮箱 */
	public function showGetMail(){
		$this->display();
	}

	/* 发送修改密码的验证邮件*/
	public function sendEmail(){
		$conditions['mail']=$_POST['mail_required'];
		$userData=M('user')->where($conditions)->find();
		
		if($userData){
			session('userinfo',$userData);
			$this->sendMail(1,$_POST['mail_required']);
			$this->success('发送成功！',U('Index/index'));
		}else{
			$this->error('此邮箱不存在，请重新输入！');
		}
	}
	/*修改密码*/
	public function showModifyPassword(){
		$authentication = session('authentication');
		if(time()-$authentication['time']>5*60){
			$this->error('认证链接失效，请重新注册.',U('Login/showGetMail'));
			
		}
		if($_GET['key'] == $authentication['key']){
			//dump(session('userinfo'));
			$this->assign('userData',session('userinfo'));
			$this->display();
		}else{
			$this->error('认证链接无效.',U('Login/index'));
		}
	}
	/*存储修改后的密码*/
	public function savePassword(){
		if($_POST['password']==''){
			$this->error("密码不能为空！");
		}else if($_POST['repassword']==''){
			$this->error("确认密码不能为空！");
		}else if($_POST['repassword']!=$_POST['password']){
			$this->error("两次密码不一致！");
		}else {
			$userData=session('userinfo');
		
			$userData['password']=$_POST['password'];
			$count=M('user')->where('id='.$userData['id'])->save($userData);
			if($count)
			$this->success('修改成功！',U('Index/index'));
		}
	}
	/*注册邮箱认证*/
	public function regCheckMail(){
		$authentication = session('authentication');
		if(time()-$authentication['time']>5*60){
			//dump(time());
			//dump($authentication['time']);
			//die;
			M('user')->where(array('id'=>session('userRegId')))->delete();
			$this->error('认证链接失效，请重新注册.',U('Login/showRegister'));
			
		}
		if($_GET['key'] == $authentication['key']){
			$status = M('user')->where(array('id'=>session('userRegId')))->getField('status');
			if($status == 1)
				$this->error('链接已被认证.',U('Index/index'));
			$status = M('user')->where(array('id'=>session('userRegId')))->setField('status',1);
			if($status)
				$this->success('邮箱验证已通过，注册成功.',U('Index/index'));
		}else{
			$this->error('认证链接无效.',U('Login/showRegister'));
		}
	}

	/*注册或者找回密码*/

	protected function sendMail($type,$userMail){
		$info = $type==0?'注册':'找回密码';
		$method = $type==0?'regCheckMail':'modifyPassword';
		$authentication['time'] = time();
		$authentication['key'] = $this->getRandChar(40);
		session('authentication',$authentication);
		$userMail = $userMail;
		$mailTitle = '江西师范大学OJ'.$info;
		$local='http://localhost/JxnuOJ';
		$online='http://119.29.147.50/JxnuOJ';
		$mailContent = $userMail.',您好，您正在通过邮箱认证完成'.$info.'，链接5分钟内有效，请点击认证链接：'.$online.'/index.php/Login/'.$method.'/key/'.$authentication['key'];
		import('ORG.Net.Mail');
		//发送方的邮箱信息需要在config.php里配置
		$status = SendMail($userMail,$mailTitle,$mailContent,'JXNU OJ 管理员');
	}
	/*
		生成随机字符串
	*/
	public function getRandChar($length){
	   $str = null;
	   $strPol = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
	   $max = strlen($strPol)-1;

	   for($i=0;$i<$length;$i++){
		$str.=$strPol[rand(0,$max)];//rand($min,$max)生成介于min和max两个数之间的一个随机整数
	   }
	   return $str;
	}
}