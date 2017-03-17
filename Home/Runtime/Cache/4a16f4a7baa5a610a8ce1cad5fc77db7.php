<?php if (!defined('THINK_PATH')) exit();?>﻿<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap-theme.css" />
	    <link rel="stylesheet" href="__PUBLIC__/css/bootstrap.css" />
		<script language="javascript" src="__PUBLIC__/js/jquery-1.12.2.min.js"></script>
		<script language="javascript" src="__PUBLIC__/js/bootstrap.js"></script>
		
	<link rel="stylesheet" href="__PUBLIC__/css/index.css" />
	<link rel="stylesheet" href="__PUBLIC__/css/showProblemList.css" />

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
		
		
        <div class="body">
			<div class="search">
				<form action="__APP__/Index/showProblemList" method="post">
					 <div class="col-lg-6">
						<div class="input-group">
						  <input type="text" class="form-control" placeholder="Search for..." name="value">
						  <span class="input-group-btn">
							<button class="btn btn-default" type="submit">搜索</button>
						  </span>
						  <br>
						</div><!-- /input-group -->
					  </div><!-- /.col-lg-6 -->
					</div><!-- /.row -->
				</form>
			</div>
			<div class="problem">
	        	<table  class="table table-striped table-bordered mystyle">
				<tr>
					<th>我的状态</th>
					<th>问题ID</th>
					<th style="text-align:left;">问题标题</th>
					<th>正确率 (正确/总数)</th>
				</tr>
				<?php if(is_array($problemData)): $i = 0; $__LIST__ = $problemData;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
						<td class="tCenter">
							<?php if(($vo["judge_status"]) == "0"): ?><span class="glyphicon glyphicon-ok success" aria-hidden="true"></span>
							<?php else: ?>
								<?php if(($vo["judge_status"]) > "0"): ?><span class="glyphicon glyphicon-remove error" aria-hidden="true"></span><?php endif; endif; ?>
						</td>
						<td><?php echo ($vo["id"]); ?> </td>
						<td style="text-align:left;"> <a href='__APP__/Index/showProblem/id/<?php echo ($vo["id"]); ?>'> <?php echo ($vo["title"]); ?> </a> </td>
						<td><?php echo getRatio($vo['accepted'],$vo['submissions']);?>% (<?php echo ($vo["accepted"]); ?>/<?php echo ($vo["submissions"]); ?>) </td>
					</tr><?php endforeach; endif; else: echo "" ;endif; ?>
				
				</table>
			</div>
			<div class="mylabel">
				<div class="label-heading">
					<h3 class="label-title">
						<span class="glyphicon glyphicon-tag" aria-hidden="true"></span>
						分类
					</h3>
				</div>
				<table class="table table-hover">
					<?php if(is_array($labelData)): $i = 0; $__LIST__ = $labelData;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><tr>
						<?php if(($vo["problem_number"]) > "0"): ?><td>
								<a href="__APP__/Index/showProblemList/label_id/<?php echo ($vo["label_id"]); ?>">
									<?php echo ($vo["label_name"]); ?>
								</a>
							</td>
							
							<td><?php echo ($vo["problem_number"]); ?></td><?php endif; ?>
						</tr><?php endforeach; endif; else: echo "" ;endif; ?>
				</table>
			</div>
			
        </div>
		<div class="page"><?php echo ($page); ?></div>

		
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