<?php
// 本类由系统自动生成，仅供测试用途
class IndexAction extends BaseAction {
	public function index(){
		$this->display();
	}
	
	
    public function showProblemList(){
		$userinfo = session('userinfo');
		$value=$_POST['value'];
		$where['title']  = array('like','%'.$value.'%');
		$where['id']  = array('like','%'.$value.'%');
		$where['_logic'] = 'or';
		//$problemData=M('problem')->select();
		//$this->assign('problemData',$problemData);
		
		$User = M('problem'); // 实例化User对象
		import('ORG.Util.Page');// 导入分页类
		$count = $User->where($where)->count();// 查询满足要求的总记录数
		$Page  = new Page($count,50);// 实例化分页类 传入总记录数和每页显示的记录数
		$show  = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $User->where($where)->limit($Page->firstRow.','.$Page->listRows)->select();
		$listIds = $User
			->where($where)
			->limit($Page->firstRow.','.$Page->listRows)
			->getField('id',true);
		$userDo = M('user_problem')
			->where(array('problem_id'=>array(IN,$listIds),'user_id'=>$userinfo['id']))
			->distinct('judge_status')
			->order('problem_id')
			->field('problem_id,judge_status')
			->select();
		$userDoNew = array();
        foreach($userDo as $k => $v){
			if($v['judge_status'] == 0 || $userDoNew[$v['problem_id']] > 0 
				|| $userDoNew[$v['problem_id']] == null){
				$userDoNew[$v['problem_id']] = $v['judge_status'];
			}
		}
		foreach($list as $k1 => $v1){
			$list[$k1]['judge_status'] = $userDoNew[$v1['id']];
		}
		$this->assign('problemData',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出

		
		$this->display();
		
		//$this->display();
	}
	
	public function replace($arr){
		//dump($arr);
		$arr['sample_input']=str_replace('\n', '<br>', $arr['sample_input']);
		
		$arr['sample_output']=str_replace('\n', '<br>', $arr['sample_output']);
		
		$arr['input']=str_replace('\n', '<br>', $arr['input']);
		$arr['output']=str_replace('\n', '<br>', $arr['output']);
	
		$arr['description']=str_replace('\n', '<br>', $arr['description']);
		return $arr;
	}
	public function showProblem(){
		$problemId=$_GET['id'];
		//echo "problemId".$problemId;
		$arr=M('problem')->find($problemId);
		$arr=$this->replace($arr);
		$this->assign('problemData',$arr);
		$this->display();
	}
	public function showSubmit(){
		if(!session('loginStatus')){
			$this->redirect('Login/showLogin');
		}
		$problemId=$_GET['id'];
		$arr=M('problem')->find($problemId);
		$this->assign('problemData',$arr);
		$this->display();
	}
	public function isAbnormal(){
		$userinfo=session('userinfo');
		
		$con['submit_time']=array('gt',time()-60);
		$con['user_id']=$userinfo['id'];
		$cnt=M('user_problem')->where($con)->count();
		
		$data['ip']=get_client_ip();
		if($cnt>=5){
			M('black_user')->add($data);
			$this->error('非法操作!');
		}
	}
	
	public function showUserMessage(){
		$con['id']=$_GET['id'];
		$userInfo = M('user')
			->where($con)
			->find();
		$myRank = M('user')
			->where(array('solve_problem'=>array('gt',$userInfo['solve_problem'])))
			->count()+1;
		$conditions['user_id']=$_GET['id'];
		$conditions['judge_status']='0';
		//dump($conditions);
		$problemData=M('user_problem')->distinct('true')->where($conditions)->field('problem_id')->order('problem_id asc')->select();
		//dump($userInfo);
		$this->assign('user',$userInfo);
		$this->assign('myRank',$myRank);
		//dump($problemData);
		$this->assign('problemData',$problemData);
		$this->display();
	
	}
	public function showModifyUserMessage(){
		$this->display();
	}
	public function modifyUserMessage(){
		$userdata=session('userinfo');
		if($userdata['password']!=$_POST['lastpassword']){
			$this->error("旧密码错误,请重新输入!");
		}
		$data['password']=$_POST['newpassword'];
		$data['school']=$_POST['school'];
		$data['motto']=$_POST['motto'];
		$count=M('user')->where('id='.$userdata['id'])->save($data);
		if($count>0){
			$this->success('修改成功',U('Index/problem_list'));
		}
	}
	
}