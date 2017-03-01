<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap-theme.css" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
		<script language="javascript" src="__PUBLIC__/js/jquery-1.12.2.min.js"></script>
		<script language="javascript" src="__PUBLIC__/js/bootstrap.js"></script>
		
	<link rel="stylesheet" href="__PUBLIC__/css/index.css" />
	<link rel="stylesheet" href="__PUBLIC__/css/loginIndex.css" />

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
		
		
	
	<div class="login">
			<div class="lonin-title">
				<h1>注册</h1>
			</div>
			<form class="form-horizontal">
				<!--用户名-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<span class="required">*</span>
			    	<span class="glyphicon glyphicon-user"></span>
			    </label>
			    <div class="col-sm-10">
			      <input minlength="1" maxlength="20" required type="text" class="form-control" id="inputEmail3" placeholder="用户名" name="username">
			    </div>
			  </div>
			    <!--昵称-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<span class="required">*</span>
			    	<span class="glyphicon glyphicon-heart"></span>
			    </label>
			    <div class="col-sm-10">
			      <input minlength="1" maxlength="20" required type="text" class="form-control" id="inputEmail3" placeholder="昵称" name="nickname">
			    </div>
			  </div>
			<!-- 密码-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<span class="required">*</span>
			    	<span class="glyphicon glyphicon-lock"></span>
			    </label>
			    <div class="col-sm-10">
			      <input minlength="6" maxlength="40" required type="password" class="form-control" id="inputEmail3" placeholder="密码" name="password">
			    </div>
			  </div>
			  <!-- 重复密码-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<span class="required">*</span>
			    	<span class="glyphicon glyphicon-lock"></span>
			    </label>
			    <div class="col-sm-10">
			      <input minlength="6" maxlength="40" required type="password" class="form-control" id="inputEmail3" placeholder="重复密码" name="repassword">
			    </div>
			  </div>
			  <!--真实姓名-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<span class="required">*</span>
			    	<span class="glyphicon glyphicon glyphicon-user"></span>
			    </label>
			    <div class="col-sm-10">
			      <input minlength="2" maxlength="20" required type="text" class="form-control" id="inputEmail3" placeholder="真实姓名" name="realname">
			    </div>
			  </div>
			  <!--邮箱-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<span class="required">*</span>
			    	<span class="glyphicon glyphicon-envelope"></span>
			    </label>
			    <div class="col-sm-10">
			      <input minlength="8" maxlength="40" required type="email" class="form-control" id="inputEmail3" placeholder="邮箱" name="email">
			    </div>
			  </div>
			  <!--学校-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<!--<span class="required">*</span>-->
			    	<span class="glyphicon glyphicon-certificate"></span>
			    </label>
			    <div class="col-sm-10">
			      <input maxlength="40" type="text" class="form-control" id="inputEmail3" placeholder="学校" name="school">
			    </div>
			  </div>
			  <!--专业-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<!--<span class="required">*</span>-->
			    	<span class="glyphicon glyphicon-book"></span>
			    </label>
			    <div class="col-sm-10">
			      <input maxlength="40" type="text" class="form-control" id="inputEmail3" placeholder="专业" name="major">
			    </div>
			  </div>
			  <!--座右铭-->
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">
			    	<!--<span class="required">*</span>-->
			    	<span class="glyphicon glyphicon-menu-hamburger"></span>
			    </label>
			    <div class="col-sm-10">
			      <input maxlength="255" type="text" class="form-control" id="inputEmail3" placeholder="座右铭" name="motto">
			    </div>
			  </div>
			  <!--提交-->
			  <div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			      <button type="submit" class="btn btn-default">提交</button>
			    </div>
			  </div>
			</form>
			
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