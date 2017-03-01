<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap-theme.css" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
		<script language="javascript" src="__PUBLIC__/js/jquery-1.12.2.min.js"></script>
		<script language="javascript" src="__PUBLIC__/js/bootstrap.js"></script>
		
	<link rel="stylesheet" href="__PUBLIC__/css/index.css" />
	<link rel="stylesheet" href="__PUBLIC__/css/problem.css" />

		<title>JxnuOJ</title>
	</head>	
	<body>
		
			<div class="container">
	<div class="">
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
			  <a class="navbar-brand" href="__APP__/Index/index">TCOJ</a>
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
		
		
<div class="body">
	<div class="upper">
		<h1> <?php echo ($problemData["title"]); ?> </h1>
		<div class="upper-message">
			<div class="mes-row">
				<span class="mes-row-item">Time Limit: <?php echo ($problemData["time_limit"]); ?> MS</span>
				<span class="mes-row-item">Memory Limit: <?php echo ($problemData["memory_limit"]); ?> K </span>
			</div>
			<div class="mes-row">
				<span class="mes-row-item">Total Submission(s): <?php echo ($problemData["submissions"]); ?></span>
				<span class="mes-row-item">Accepted Submission(s): <?php echo ($problemData["accepted"]); ?></span>
			</div>
		</div>
	</div>
	<div class="middle">
		<div class="list">
			<div class="list-group">问题描述</div>
			<div class="list-message"><pre><?php echo ($problemData["description"]); ?></pre></div>
		</div>
		<div class="list">
			<div class="list-group">输入格式</div>
			<div class="list-message"><pre><?php echo ($problemData["input"]); ?></pre></div>
		</div>
		<div class="list">
			<div class="list-group">输出格式</div>
			<div class="list-message"><pre><?php echo ($problemData["output"]); ?></pre></div>
		</div>
		<div class="list">
			<div class="list-group">样例输入 </div>
			<div class="list-message">
				<pre><?php echo ($problemData["sample_input"]); ?></pre>
			</div>
		</div>
		<div class="list">
			<div class="list-group">样例输出 </div>
			<div class="list-message">
				<pre><?php echo ($problemData["sample_output"]); ?></pre>
			</div>
		</div>
		<div class="list">
			<div class="list-group">作者 </div>
			<div class="list-message"> <?php echo ($problemData["author"]); ?></div>
		</div>
		<div class="list">
			<div class="list-group">来源 </div>
			<div class="list-message"> <?php echo ($problemData["source"]); ?></div>
		</div>
		
		<div class="submit">
		<a href="__APP__/Index/showSubmit/id/<?php echo ($problemData["id"]); ?>">提交代码</a>
		</div>
	</div>
</div>


		
			﻿	<div class="footer">
		<hr>
		<div class="row footer-bottom">
          <ul class="list-inline text-center">
            <li>童程教育OI在线评测系统</li>
            <li><a href="http://www.miitbeian.gov.cn" target="view_window" style="color: #337ab7;">赣ICP备16003914号</a></li>
			<li>Copyright &copy; 2016-  author:童程教育</li>
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