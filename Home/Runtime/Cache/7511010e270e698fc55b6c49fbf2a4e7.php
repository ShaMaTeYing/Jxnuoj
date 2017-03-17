<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap-theme.css" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
		<script language="javascript" src="__PUBLIC__/js/jquery-1.12.2.min.js"></script>
		<script language="javascript" src="__PUBLIC__/js/bootstrap.js"></script>
		
	<link rel="stylesheet" href="__PUBLIC__/css/index.css" />
	<link rel="stylesheet" href="__PUBLIC__/css/judge.css" />

		<title>江西师范大学OJ</title>
	</head>	
	<body>
		
			<div class="container">
	<div class="">
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			  <a class="navbar-brand" href="__APP__/Index/index">江西师范大学OJ</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			  <ul class="nav navbar-nav">
				<li class="active">
					<a href="__APP__/Index/index">主页
						<span class="sr-only">(current)</span>
					</a>
				</li>
				<li><a href="__APP__/Index/showProblemList">题目</a></li>
				<li><a href="__APP__/Admin/showAllUserRank">排名</a></li>
				<li><a href="__APP__/Exam/index">比赛</a></li>
				<li><a href="__APP__/Judge/showRealTimeEvaluation">实时评测</a></li>
			  </ul>
			  
			  <ul class="nav navbar-nav navbar-right">
				<?php if(($loginStatus) == "0"): ?><li><a href="__APP__/Login/showLogin">登录</a></li>
					<li><a href="__APP__/Login/showRegister">注册</a></li>
					<?php else: ?>
					 <li class="dropdown">
						 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <?php echo ($data["username"]); ?>
						 <span class="caret"></span></a>
						 <ul class="dropdown-menu">
						  
							<li><a href="__APP__/Index/showUserMessage/id/<?php echo ($data["id"]); ?>"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							&nbsp;信息</a></li>
							<?php if(($data["root"]) > "0"): ?><li><a href="__APP__/Admin/showProblemLibrary"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;题目管理</a></li>
							<li><a href="__APP__/Admin/showLoginMessage"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>&nbsp;&nbsp;登录管理</a></li><?php endif; ?>
							<li><a href="__APP__/Admin/showUserMessage"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;&nbsp;设置</a></li>
							<li><a href="__APP__/Login/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;&nbsp;退出</a></li>
							<li role="separator" class="divider"></li>
					  </ul>
						  
					</li><?php endif; ?>
				
			  </ul>
			</div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</div>
		
		
	<div class="judge">
		<div class="judge-status">实时评测状态</div>
		<div class="search">
			<form action="__APP__/Judge/showRealTimeEvaluation" method="post"> 
				问题ID<input type="text" name="problemId" />
				昵称<input type="text" name="anthor" />
				语言：
				<select name="language">
					<option value="C++">C++</option>
					<option value="C">C</option>
					<option value="Java">Java</option>
					<option value="PHP">PHP</option>
				</select>
				状态:
				<select name="status">
					<option value="0">Accepted</option>
					<option value="2">Wrong Answer</option>
					<option value="1">Compile Error</option>
					<option value="3">Time Limit Exceeded</option>
				</select>
				<input class="submit" type="submit" value="搜索"> 
			</form>
		</div>
		<div class="list">
			<table class="table table-bordered mystyle">
				<tr>
					<th>运行ID</th>
					<th>提交时间</th>
					<th>评测结果</th>
					<th>问题ID</th>
					<th>运行时间</th>
					<th>运行内存</th>
					<th>代码长度</th>
					<th>语言</th>
					<th>昵称</th>
				</tr>
				<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
						<td><?php echo ($vo["id"]); ?></td>
						<td><?php echo (date("Y-m-d H:i",$vo["submit_time"])); ?></td>
						<td>
		<!--$resultStatus[0]='Accepted';
		$resultStatus[1]='Wrong Answer';
		$resultStatus[2]='Time Limit Exceeded';
		$resultStatus[3]='Memory Limit Exceeded';
		$resultStatus[4]='Runtime Error';
		$resultStatus[5]='Compilation Error';
		$resultStatus[6]='Output Limit Exceeded';
		$resultStatus[7]='Input Limit Exceeded';
		$resultStatus[8]='pending';
		$resultStatus[9]='Compiling';
		$resultStatus[10]='Runing';-->
							
							<?php if(($vo["judge_status"]) == "0"): ?><span class="accepted">Accepted</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "1"): ?><span class="wrong-answer">Wrong Answer</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "2"): ?><span class="time-limit-exceeded">Time Limit Exceeded</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "3"): ?><span class="memeory-limit-exceeded">Memory Limit Exceeded</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "4"): ?><span class="runtime-error">Runtime Error</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "5"): ?><span class="compilation-error">Compilation Error</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "6"): ?><span class="output-limit-exceeded">Output Limit Exceeded</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "7"): ?><span class="input-limit-exceeded">Input Limit Exceeded</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "8"): ?><span class="pending">Pending</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "9"): ?><span class="compiling">Compiling</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "10"): ?><span class="runing">Runing</span><?php endif; ?>
							<?php if(($vo["judge_status"]) == "11"): ?><span class="runing">Presentation Error</span><?php endif; ?>
						</td>
						
						<td>
							<a href="__APP__/Index/showProblem/id/<?php echo ($vo["problem_id"]); ?>">
							<?php echo ($vo["problem_id"]); ?>
							</a>
						</td>
						
						<td><?php echo ($vo["exe_time"]); ?> MS</td>
						<td><?php echo ($vo["exe_memory"]); ?> KB</td>
						<td>
							<!--<?php if(($vo["user_id"]) == $myId): ?><a href="__APP__/Judge/showUserCode/id/<?php echo ($vo["id"]); ?>"><?php echo ($vo["code_len"]); ?>B</a>
							<?php else: ?>
							
								<?php if(($$myRoot) == "2"): ?><a href="__APP__/Judge/showUserCode/id/<?php echo ($vo["id"]); ?>"><?php echo ($vo["code_len"]); ?>B</a><?php endif; ?>
								<?php if(($$myRoot) < "2"): echo ($vo["code_len"]); ?>B<?php endif; endif; ?>-->
							<?php if(($vo["user_id"] == $myId) OR ($myRoot == 2) ): ?><a href="__APP__/Judge/showUserCode/id/<?php echo ($vo["id"]); ?>"><?php echo ($vo["code_len"]); ?>B</a>
							<?php else: ?> <?php echo ($vo["code_len"]); ?>B<?php endif; ?>

						</td>
						<td><?php echo ($vo["language"]); ?></td>
						<td>
							<a href="__APP__/Index/showUserMessage/id/<?php echo ($vo["user_id"]); ?>">
							<?php echo ($vo["nickname"]); ?>
							</a>
						</td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>	
			</table>
				
		</div>
		<div ><?php echo ($page); ?></div>
	</div>

		
			﻿	<div class="footer">
		<hr>
		<div class="row footer-bottom">
          <ul class="list-inline text-center">
            <li>江西师范大学ACM在线评测系统</li>
            <li><a href="http://www.miitbeian.gov.cn" target="view_window" style="color: #337ab7;">赣ICP备16003914号</a></li>
			<li>Copyright &copy; 2016-  author:吴迎</li>
          </ul>
        </div>
	</div>
	<script>
		/*导航*/
		(function(){
			if(window.sessionStorage){

				var nav = $('.navbar-nav');
				nav.find('li')
					.on('click',function(){
						sessionStorage.activeIndex = $(this).index();
						$(this).addClass('active')
							.siblings()
							.removeClass('active');
					})
					.eq(sessionStorage.activeIndex)
					.addClass('active')
					.siblings()
					.removeClass('active');
			}
		})();
	</script>
</div>
		
	</body>
</html>