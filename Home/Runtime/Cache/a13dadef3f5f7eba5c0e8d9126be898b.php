<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap-theme.css" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
		<script language="javascript" src="__PUBLIC__/js/jquery-1.12.2.min.js"></script>
		<script language="javascript" src="__PUBLIC__/js/bootstrap.js"></script>
		
	<link rel="stylesheet" href="__PUBLIC__/css/index.css" />
	<link rel="stylesheet" href="__PUBLIC__/css/creatproblem.css" />

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
		
		
	<form action='<?php echo U("Admin/modifyProblemData");?>' method='post' enctype="multipart/form-data">
		<div class="content">
			
			<div class="creat">修改问题</div>
			<div class="text">
				<input type="hidden" name="id" value="<?php echo ($data["id"]); ?>">
			</div>
			 
			<div class="Limit"> 
				
				时间限制<input type="text" name="time_limit" value="<?php echo ($data["time_limit"]); ?>"/>ms
				内存限制<input type="text" name="memory_limit" value="<?php echo ($data["memory_limit"]); ?>"/>K
				输出限制<input type="text" name="output_limit" value="<?php echo ($data["output_limit"]); ?>"/>K
			</div>
			<div class="text">作者<input type="text" name="author" value="<?php echo ($data["author"]); ?>"/>
			</div>
			<div class="text">来源<input type="text" name="source" value="<?php echo ($data["source"]); ?>"/>
			</div>
			<div class="text">标题<input type="text" name="title" value="<?php echo ($data["title"]); ?>"/>
			</div>
			<div class="text">标签<input type="text" name="label" value="<?php echo ($labelData); ?>"/>
			</div>
			<div class="textarea"> 
				问题描述
				<textarea name="description" ><?php echo ($data["description"]); ?></textarea>
			</div>
			<div class="textarea"> 
				输入格式
				<textarea name="input" ><?php echo ($data["input"]); ?></textarea>
			</div>
			<div class="textarea"> 
				输出格式
				<textarea name="output" ><?php echo ($data["output"]); ?></textarea>
			</div>
			<div class="textarea"> 
				输入样例
				<textarea name="sample_input"><?php echo ($data["sample_input"]); ?></textarea>
			</div>
			<div class="textarea"> 
				输出样例
				<textarea name="sample_output" ><?php echo ($data["sample_output"]); ?></textarea>
			</div>


			<div class="btn">
				<input type="submit" value="提交" />
				<input type="reset" value="重置" />
			</div>
		</div>
	</form>

		
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