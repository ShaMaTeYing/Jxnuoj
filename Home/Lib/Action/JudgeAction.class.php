<?php
// 本类由系统自动生成，仅供测试用途
class JudgeAction extends BaseAction {
	public function showRealTimeEvaluation(){
		//dump($_POST);
		
		
		
		$userinfo = session('userinfo');
		$problemId=$_POST['problemId'];
		$anthor=$_POST['anthor'];
		$language=$_POST['language'];
		$judgeResults=$_POST['status'];
		if($language) $where['language']=$language;
		if($judgeResults) $where['judge_results']=$judgeResults;
		if($problemId) $where['problem_id']  = $problemId;
		if($anthor) $where['nickname']  = array('like','%'.$anthor.'%');
		$where['_logic'] = 'and';
		//dump($where);
		$User = M('user_problem'); // 实例化User对象
		import('ORG.Util.Page');// 导入分页类
		$count = $User->where($where)->count();// 查询满足要求的总记录数
		$Page  = new Page($count,15);// 实例化分页类 传入总记录数和每页显示的记录数
		$show  = $Page->show();// 分页显示输出
		// 进行分页数据查询 注意limit方法的参数要使用Page类的属性
		$list = $User->where($where)->order('id desc')->limit($Page->firstRow.','.$Page->listRows)->select();
		//dump($count);
		//dump($Page);
	
		//$list['username']=$userinfo;
		$this->assign('list',$list);// 赋值数据集
		$this->assign('page',$show);// 赋值分页输出
		$userinfo = session('userinfo');
		$this->myId = $userinfo['id'];
		$this->myRoot=$userinfo['root'];
		$this->display(); // 输出模板
		
	}
	public function onlineJudge(){
		
		//$this->isAbnormal();
		//dump($_POST);
		//dump($_POST);
		
		$problemData=M('problem')->where('id='.$_POST['problemID'])->find();
		if(!$problemData){
			$this->error('非法操作!!!!!!!');
		}
		
		$number=intval($problemData['time_limit'],10);
//		$timeLimit=$number/1000;
		$timeLimit=$number;
		$memoryLimit=131072;
		$userinfo = session('userinfo');
		$code='code';
		if(!file_exists($code)) {
			mkdir($code);
			chmod($code, 0777);
		}
		if(!file_exists($code.'/'.$userinfo['username'])) {
			mkdir($code.'/'.$userinfo['username']);
			chmod($code.'/'.$userinfo['username'], 0777);
		}
		
		//dump($_POST);
		
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
		

		$condition['user_id']=$userinfo['id'];
		$condition['problem_id']=$_POST['problemID'];
		$submitSum=M('user_problem')->where($condition)->Count();
		$submitSum=$submitSum+1;
		//dump($submitSum);
		
		$filename = $code.'/'.$userinfo['username'].'/'.$_POST['problemID'].'_'.$submitSum.$ext;
		$word =$_POST['code'];
		file_put_contents($filename, $word);
		chmod($filename, 0777);

		$destFile=$filename;
		$file=$_POST['problemID'];
		//for example $destFile="code/wuying/1000_1.cpp"
		//for example $file="1000"
		//$t1 = microtime(true);
		//exec("./jxnuoj $destFile $file $timeLimit $memoryLimit", $output, $verdict);
		//$t2 = microtime(true);
		//$verdict=0;
		
		$verdict=8;//设置成待判状态

//		$resultStatus[0]='Accepted';
//		$resultStatus[1]='Wrong Answer';
//		$resultStatus[2]='Time Limit Exceeded';
//		$resultStatus[3]='Memory Limit Exceeded';
//		$resultStatus[4]='Runtime Error';
//		$resultStatus[5]='Compilation Error';
//		$resultStatus[6]='Output Limit Exceeded';
//		$resultStatus[7]='Input Limit Exceeded';
//		$resultStatus[8]='pending';
//		$resultStatus[9]='Compiling';
//		$resultStatus[10]='runing';
		
		//dump($resultStatus);
		
		$resultData['user_id']=$userinfo['id'];
		$resultData['problem_id']=$_POST['problemID'];
		$resultData['submit_time']=time();
		$resultData['judge_status']=$verdict;
		$resultData['exe_time']=0;
		$resultData['exe_memory']=0;
		$resultData['code_len']=strlen($_POST['code']);
		$resultData['language']=$_POST['language'];
		$resultData['nickname']=$userinfo['nickname'];
		$resultData['filepath']=$filename;
		//dump($resultData);
		
		
			
		$message=M('user_problem');
		

		$message->add($resultData);
	
		$this->redirect('Judge/showRealTimeEvaluation');
	}
	public function showUserCode(){
		$id=$_GET['id'];
		$condition['id']=$id;
		$data=M('user_problem')->where($condition)->find();
		//dump($data);

		$filename = $data['filepath'];

		$contents=file_get_contents($filename);
		$contents = htmlspecialchars($contents);
		$this->assign('code',$contents);
		$this->display();
	}
}