<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap-theme.css" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
		<script language="javascript" src="__PUBLIC__/js/jquery-1.12.2.min.js"></script>
		<script language="javascript" src="__PUBLIC__/js/bootstrap.js"></script>
		
	<link rel="stylesheet" href="__PUBLIC__/css/index.css" />
	<link rel="stylesheet" href="__PUBLIC__/css/examShowProblemList.css" />

		<title>JxnuOJ</title>
	</head>	
	<body>
		
			<div class="container">
	<div class="">
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			  <a class="navbar-brand" href="__APP__/Index/index">江西师范大学 OJ</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			  <ul class="nav navbar-nav">
				<li class="active">
					<a href="__APP__/Index/index">主页
						<span class="sr-only">(current)</span>
					</a>
				</li>
				<li><a href="__APP__/Index/problem_list">题目</a></li>
				<li><a href="__APP__/Admin/sort_all_user">排名</a></li>
				<li><a href="__APP__/Judge/index">实时评测</a></li>
				<li><a href="__APP__/Exam/index">比赛</a></li>
				<?php if(($data["root"]) > "0"): ?><li class="dropdown">
				  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
				  <ul class="dropdown-menu">
					<li><a href="__APP__/Admin/showLoginMessage">登录管理</a></li>
					<li><a href="__APP__/Admin/showUserMessage">用户管理</a></li>
					<li><a href="#">比赛管理</a></li>
					<li><a href="__APP__/Admin/libraryIndex">题库管理</a></li>
				  </ul>
				</li><?php endif; ?>
			  </ul>
			  
			  <ul class="nav navbar-nav navbar-right">
				<?php if(($loginStatus) == "0"): ?><li><a href="__APP__/Login/index">登录</a></li>
					<li><a href="__APP__/Login/register_html">注册</a></li>
					<?php else: ?>
					 <li class="dropdown">
						 <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> <?php echo ($data["username"]); ?>
						 <span class="caret"></span></a>
						 <ul class="dropdown-menu">
						  
							<li><a href="__APP__/Index/usermes/username/<?php echo ($data["username"]); ?>"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							&nbsp;信息</a></li>
							<li><a href="__APP__/Index/show_usermes"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>&nbsp;&nbsp;设置</a></li>
							<li><a href="__APP__/Login/logout"><span class="glyphicon glyphicon-off" aria-hidden="true"></span>&nbsp;&nbsp;退出</a></li>
							<li role="separator" class="divider"></li>
					  </ul>
						  
					</li><?php endif; ?>
				
			  </ul>
			</div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
	</div>
		
		
		
        <div class="contest-body">
			<h1 class="list-title"><?php echo ($contest_list["name"]); ?></h1>
			<div class="contest-conditions">
				<div class="contest-time">
					<span class="start-time">开始时间：<?php echo (date("Y/m/d H:i",$contest_list["start_time"])); ?></span>
					<span class="end-time">结束时间：<?php echo (date("Y/m/d H:i",$contest_list["end_time"])); ?></span>
				</div>
				<div>当前状态:<?php echo ($contest_list["status"]); ?></div>
				<div id="showDate" class="now-time"></div>
			</div>
        	<table  class="table table-striped table-bordered mystyle">
			<tr>
				<th>已解决</th>
				<th>问题ID</th>
				<th>问题标题</th>
				<th>正确率 (正确/总数)</th>
			</tr>
			<?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
					<td>
						<?php if(($vo["acStatus"]) == "1"): ?>AC<?php endif; ?>
						<?php if(($vo["acStatus"]) == "0"): endif; ?>
						<?php if(($vo["acStatus"]) == "-1"): ?>WA<?php endif; ?>
						
					</td>
					<td> <?php echo ($vo["contest_problem_id"]); ?></td>
					<td> <a href='__APP__/Exam/showProblem/id/<?php echo ($vo["contest_problem_id"]); ?>'><?php echo ($vo["title"]); ?> </a></td>
					<td><?php echo getRatio($vo['accepted'],$vo['submissions']);?>% (<?php echo ($vo["accepted"]); ?>/<?php echo ($vo["submissions"]); ?>) </td>
				</tr><?php endforeach; endif; else: echo "" ;endif; ?>
			
			</table>
			
        </div>
		<div class="page"><?php echo ($page); ?></div>

		<script type="text/javascript"> 
			$(function(){ 
				setInterval("getTime();",1000); //每隔一秒执行一次 
				}) 
				//取得系统当前时间 
				function getTime(){ 
				var myDate = new Date(); 
				var date = myDate.toLocaleDateString(); 
				var hours = myDate.getHours(); 
				var minutes = myDate.getMinutes(); 
				var seconds = myDate.getSeconds(); 
				$("#showDate").html("当前时间：   "+date+" "+hours+":"+minutes+":"+seconds); //将值赋给div 
			} 
		</script>

		
			﻿	<div class="footer">
		<hr>
		<div class="row footer-bottom">
          <ul class="list-inline text-center">
            <li>江西师范大学ACM在线评测系统</li>
            <li><a href="http://www.miitbeian.gov.cn" target="view_window">赣ICP备16003914号</a></li>
			<li>Copyright &copy; 2016-  author:江西师范大学</li>
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