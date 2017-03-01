<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap-theme.css" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
		<script language="javascript" src="__PUBLIC__/js/jquery-1.12.2.min.js"></script>
		<script language="javascript" src="__PUBLIC__/js/bootstrap.js"></script>
		
	<link rel="stylesheet" href="__PUBLIC__/css/index.css" />
	<link rel="stylesheet" href="__PUBLIC__/css/usermes.css" />

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
				<li><a href="__APP__/Index/showProblemList">题目</a></li>
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
		
		
	<div class="row" id="profile-heading">
			<div class="row text-center">
				<div class="col-sm-4 hidden-xs">
					<span class="text-muted">排名</span>
					<span class="bigggger"><?php echo ($myRank); ?></span>
				</div>
				<div class="col-sm-4">
					<h1 id="username"><?php echo ($user["username"]); ?><a href="#" id="add-friend" class="link-icon" title="Add Friend" style="display: none;"><span class="fa fa-star" style="color: #ccc;"></span></a><a href="#" id="remove-friend" class="link-icon" title="Remove Friend" style=""><span class="fa fa-star" style="color: glod;"></span></a></h1>
					<div class="hidden-xs" id="profile-school">
						<a href="#"><?php echo ($user["school"]); ?></a>
					</div>
				</div>
				<div class="col-sm-4 col-xs-12">
					<span class="text-muted">解决题目</span>
					<span class="bigggger"><?php echo ($user["solve_problem"]); ?></span>
				</div>
			</div>
					<blockquote class="col-xs-12">
				<p><?php echo ($user["motto"]); ?></p>
			</blockquote>
	</div>
	<div class="list">
		<h4 class="">已经完成的题目列表</h4>
		<table class="table table-bordered  mystyle">
			<?php if(is_array($problemData)): $i = 0; $__LIST__ = $problemData;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 10 );++$i; if(($mod) == "0"): ?><tr><?php endif; ?>
				<td>
					<a href="__APP__/Index/problem/id/<?php echo ($vo["problem_id"]); ?>">
						<?php echo ($vo["problem_id"]); ?>
					</a>
				</td>
				<?php if(($mod) == "9"): ?></tr><?php endif; endforeach; endif; else: echo "" ;endif; ?>
		</table>
	</div>

		
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