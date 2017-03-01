<?php
// 本类由系统自动生成，仅供测试用途
class AdminAction extends BaseAction {
	/*显示题库管理主界面*/
	public function showProblemLibrary(){

		$User = M('problem'); // 实例化User对象
		import('ORG.Util.Page');// 导入分页类
		$condition['_logic'] = 'OR';
		$condition['title'] = array('like','%'.$_POST['id'].'%');
		$condition['id'] = array('like','%'.$_POST['id'].'%');
		$count = $User->where($condition)->count();
		$Page  = new Page($count,100);// 实例化分页类 传入总记录数和每页显示的记录数
		$show  = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $User->where($condition)->limit($Page->firstRow.','.$Page->listRows)->select();
		$this->assign('problemData',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$this->display();
	} 
	/*显示添加题目主界面*/
	public function showAddProblem(){
		$this->display();
	}
	/*添加题目*/
	public function creatProblemData(){
		
		$User = M("problem");
		foreach($_POST as $key=>$value){
			$_POST[$key]=htmlspecialchars($value);
		}
		
		$count=$User->add($_POST);
		if($count)
			$this->success('success','index');
		else $this->error('fail','index');
	}
	
	/*删除题目*/
	public function deleteProblem(){
		$id=$_GET['id'];
		$User = M("problem"); // 实例化User对象
		$count=$User->where('id='.$id)->delete(); // 删除id为5的用户数据
		if($count>0) $this->success('success');
		else $this->error('fail');
	}
	/*显示上传页面*/
	public function showUpload(){
		//dump($_GET);
		$this->assign('problemdata',$_GET);
		$this->display();
	}
	/*上传文件*/
	public function upload(){
		
		$problem_id=$_POST['id'];
		$path='problems/'.$problem_id;
		if(!file_exists($path)) 
		{
			mkdir($path);
			chmod($path, 0777);
		}
		import('ORG.Net.UploadFile');
		$upload = new UploadFile();// 实例化上传类
		$upload->maxSize  = 8388608 ;// 设置附件上传大小
		$upload->uploadReplace=true;
		$upload->savePath =  $path.'/';// 设置附件上传目录
		$upload->saveRule='';
		$_FILES['input_path']['name'] = 'in';
		$_FILES['output_path']['name'] = 'out';
		if(!$upload->upload()) {// 上传错误提示错误信息
			//$this->error($upload->getErrorMsg());
		}else{// 上传成功 获取上传文件信息
			$info =  $upload->getUploadFileInfo();
			$this->success('success!','index');
		}
	}
	/*显示修改题目界面*/
	public function showModifyProblem(){
		$id=$_GET['id'];
		$data=M('problem')->where('id='.$id)->find();
		$this->assign('data',$data);
		$this->display();
	}
	/*修改题目*/
	public function modifyProblemData(){
		foreach($_POST as $key=>$value){
			$_POST[$key]=htmlspecialchars($value);
		}
		$count=M('problem')->where('id='.$_POST['id'])->save($_POST);
		if($count>0){
			$this->success('success!','showProblemLibrary');
		}else {
			$this->error('fail','showProblemLibrary');
		}
	}
	/*显示所有用户*/
	public function showAllUserRank(){
		$sortParam = $_POST['sort_param'];
		
		$where['nickname']  = array('like','%'.$sortParam.'%');
		$where['solve_problem']  = array('like','%'.$sortParam.'%');
		$where['_logic'] = 'or';
		$map['_complex'] = $where;
		$map['status']  = 1;
		M('user')->where(array('register_time'=>array('lt',time()-60),'status'=>2))->delete();
		
		//M('user')->where('status='.'2')->delete();
		$problemData=M('user')->where($map)->order('solve_problem desc')->select();
		//dump($problemData);
		for($i=0;$i<count($problemData);$i++){
			$problemData[$i]['rank']=$i+1;
		}
		$this->assign('problemData',$problemData);
		$this->display();
		
	}
	/*显示所有登录信息*/
	public function showLoginMessage(){
		$value=$_POST['value'];
		$where['username']  = array('like','%'.$value.'%');
		$where['area']  = array('like','%'.$value.'%');
		$where['ip']  = array('like','%'.$value.'%');
		//$where['login_time']  = array('like','%'.$value.'%');
		$where['status']  = array('like','%'.$value.'%');
		$where['_logic'] = 'or';
	

		$loginMessage=M('login_msg')->order('id desc')->where($where)->select();
		$this->assign('loginMessage',$loginMessage);
		$this->display();
	}
	public function showUserMessage(){
		$value=$_POST['value'];
		$where['username']  = array('like','%'.$value.'%');
		$where['nickname']  = array('like','%'.$value.'%');
		$where['realname']  = array('like','%'.$value.'%');
		//$where['login_time']  = array('like','%'.$value.'%');
		$where['mail']  = array('like','%'.$value.'%');
		$where['status']  = array('like','%'.$value.'%');
		$where['root']  = array('like','%'.$value.'%');
		$where['school']  = array('like','%'.$value.'%');
		$where['major']  = array('like','%'.$value.'%');
		$where['_logic'] = 'or';
		

		$map['_complex'] = $where;
		//$map['status']  = 1;
		$userinfo=session('userinfo');
		$map['root']=array('lt',$userinfo['root']);

		$userMessage=M('user')->where($map)->select();
		//dump($userMessage);
		$this->assign('userMessage',$userMessage);
		$this->display();
	}
	public function operation(){
		if($_GET['type']==1){
			if(M('user')->where('id='.$_GET['id'])->setField('status',$_GET['status']))
			$this->success('success!',U('Admin/showUserMessage'));
		}else {
			if(M('user')->where('id='.$_GET['id'])->setField('root',$_GET['status']))
			$this->success('success!',U('Admin/showUserMessage'));
		}
	}
	
}