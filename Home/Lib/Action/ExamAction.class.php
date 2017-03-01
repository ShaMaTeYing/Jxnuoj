<?php
// 本类由系统自动生成，仅供测试用途
class ExamAction extends BaseAction {
	public function index(){

		$User = M('contest_list'); // 实例化User对象
		import('ORG.Util.Page');// 导入分页类
		$count = $User->count();// 查询满足要求的总记录数
		$Page  = new Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数
		$show  = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $User->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		
		//$list['username']=$userinfo;
		foreach($list as $key=>$value){
			
			if(intval($value['start_time'])<time() && time()<intval($value['end_time'])){
				$list[$key]['status']="正在比赛";
			}else if(time()<intval($value['start_time'])){
				$list[$key]['status']="等待开始";
			}else {
				$list[$key]['status']="比赛结束";
			}
		}
		
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
	
		$userinfo = session('userinfo');
		$this->myId = $userinfo['id'];
		$this->display(); // 输出模板
		
	}
	public function showProblemList(){
		
		$contest_problem=M('contest_problem')->where('contest_list_id='.$_GET['id'])->select();
		$contest_list=M('contest_list')->where('id='.$_GET['id'])->select();
		session('contestList',$contest_list[0]);
		
		foreach($contest_list as $key=>$value){
			
			if(intval($value['start_time'])<time() && time()<intval($value['end_time'])){
				$contest_list[$key]['status']="正在比赛";
			}else if(time()<intval($value['start_time'])){
				$contest_list[$key]['status']="等待开始";
			}else {
				$contest_list[$key]['status']="比赛结束";
			}
		}

		$userinfo=session('userinfo');
		$userSubmitData=M('contest_user_problem')
						->where(array('contest_list_id'=>$contest_list[0]['id'],
									  'contest_user_id'=>$userinfo['id']))
						->field('contest_problem_id,judge_status')
						->select();
		$acStatus=array();
		foreach($userSubmitData as $key => $value){
			if($acStatus[$userSubmitData[$key]['contest_problem_id']]==1 || $userSubmitData[$key]['judge_status']==0){
				$acStatus[$userSubmitData[$key]['contest_problem_id']]=1;
			}else if($userSubmitData[$key]['judge_status']){
				$acStatus[$userSubmitData[$key]['contest_problem_id']]=-1;
			}
		}
		
		foreach($contest_problem as $key => $value){
			if($acStatus[$contest_problem[$key]['contest_problem_id']]==1){
				$contest_problem[$key]['acStatus']=1;
			}else if($acStatus[$contest_problem[$key]['contest_problem_id']]==-1){
				$contest_problem[$key]['acStatus']=-1;
			}else {
				$contest_problem[$key]['acStatus']=0;
			}
		}
		$this->assign('contest_list',$contest_list[0]);// 赋值数据集
		$this->assign('list',$contest_problem);// 赋值数据集
		$this->display(); // 输出模板
	}
	/*显示问题*/
	public function showProblem(){
		$problemData=M('contest_problem')->where('contest_problem_id='.$_GET['id'])->find();
	
		$this->assign('problemData',$problemData);
		$this->display(); // 输出模板
	}
	public function showSubmit(){
		
		if(!session('loginStatus')){
			$this->redirect('Login/index');
		}
		$contestList=session('contestList');
		
		$problemId=$_GET['id'];
		$arr=M('contest_problem')
			->where(array('contest_list_id'=>$contestList['id'],'contest_problem_id'=>$problemId))
			->find();
		
		$this->assign('problemData',$arr);
		$this->display();
	}
	public function isAbnormal(){
		$userinfo=session('userinfo');
		
		$con['submit_time']=array('gt',time()-60);
		$con['contest_user_id']=$userinfo['id'];
		$cnt=M('contest_user_problem')->where($con)->count();
		
		$data['ip']=get_client_ip();
		if($cnt>=5){
			M('black_user')->add($data);
			$this->error('非法操作2333!');
		}
	}
	public function onlineJudge(){
		
		$this->isAbnormal();//判断恶意提交代码
		
		$contestList=session('contestList');
		$problemData=M('contest_problem')
			->where(array('contest_problem_id'=>$_POST['problemID'],'contest_list_id'=>$contestList['id']))
			->find();
		
		if(!$problemData){
			$this->error('非法操作1111!');
		}

		$number=intval($problemData['time_limit'],10);
		$timeLimit=$number/1000;
		$userinfo = session('userinfo');
		$code='contest/code';
		if(!file_exists('contest')) {
			mkdir('contest');
			chmod('contest', 0777);
		}
		if(!file_exists($code)) {
			mkdir($code);
			chmod($code, 0777);
		}
		if(!file_exists($code.'/'.$userinfo['username'])) {
			mkdir($code.'/'.$userinfo['username']);
			chmod($code.'/'.$userinfo['username'], 0777);
		}
		$lan=$_POST['language'];
		$ext='';
		if($lan=='C++'){
			$ext='.cpp';
		}else if($lan=='C'){
			$ext='.c';
		}else if($lan=='Java') {
			$ext='.java';
		}else if($lan=='PHP'){
			$ext='.php';
		}

		$condition['contest_user_id']=$userinfo['id'];
		$condition['contest_problem_id']=$_POST['problemID'];
		$submitSum=M('contest_user_problem')->where($condition)->Count();
		$submitSum=$submitSum+1;
		$filename = $code.'/'.$userinfo['username'].'/'.$_POST['problemID'].'_'.$submitSum.$ext;
		$word =$_POST['code'];
		file_put_contents($filename, $word);
		chmod($filename, 0777);
		
		$destFile=$filename;
		$file=$_POST['problemID'];
		
		$t1 = microtime(true);
		exec("./jxnuoj $destFile $file $timeLimit", $output, $verdict);
		$t2 = microtime(true);

		$resultData['contest_user_id']=$userinfo['id'];
		$resultData['contest_list_id']=$contestList['id'];
		$resultData['contest_problem_id']=$_POST['problemID'];
		$resultData['submit_time']=time();
		$resultData['judge_status']=$verdict;
		$resultData['exe_time']=intval(round($t2-$t1,3)*1000);
		$resultData['exe_memory']='';
		$resultData['code_len']=strlen($_POST['code'])/8;
		$resultData['language']=$_POST['language'];
		$resultData['username']=$userinfo['username'];
		$resultData['filepath']=$filename;

		
		
		
	
		$conditions['contest_problem_id']=$_POST['problemID'];
		$number=M('contest_problem')->where($conditions)->find();
		if($verdict==0) $number['accepted']=$number['accepted']+1;
		$number['submissions']=$number['submissions']+1;
		$updateNumber=M('contest_problem');
		$updateNumber->where($conditions)->save($number);
		$userinfo = session('userinfo');
		$resultData['contest_user_id']=$userinfo['id'];
		$message=M('contest_user_problem');
		$message->add($resultData);
		$this->redirect('Exam/showStatus'); 
	}
	public function showStatus(){
		
		$contestList=session('contestList');
		$_POST['contest_list_id']=$contestList['id'];
		//dump($_POST);
		$User = M('contest_user_problem'); // 实例化User对象
		import('ORG.Util.Page');// 导入分页类
		$count = $User->where($conditions)->count();// 查询满足要求的总记录数
		$Page  = new Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数
		$show  = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $User->order('id desc')
		->where($conditions)	
		->limit($Page->firstRow.','.$Page->listRows)->select();

		//$list['username']=$userinfo;
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$userinfo = session('userinfo');
		$this->myId = $userinfo['id'];
		$this->display(); // 输出模板
	}
	public function showCode(){
		$id=$_GET['id'];
		$condition['id']=$id;
		$data=M('contest_user_problem')->where($condition)->find();
		//dump($data);

		$filename = $data['filepath'];

		$contents=file_get_contents($filename);
		$contents = htmlspecialchars($contents);
		$this->assign('code',$contents);
		$this->display();
	}
}