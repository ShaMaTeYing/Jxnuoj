<?php
return array(
	//'配置项'=>'配置值'
	//define('__PUBLIC__','Home/Public');
	'__PUBLIC__'=>'Home/Public',
	
	'TMPL_L_DELIM'=>'<{', //修改左定界符
	'TMPL_R_DELIM'=>'}>', //修改右定界符
	
	
	'DB_TYPE'=>'mysql',   //设置数据库类型
	'DB_HOST'=>'localhost',//设置主机
	'DB_NAME'=>'jxnuoj',//设置数据库名
	'DB_USER'=>'root',    //设置用户名
	'DB_PWD'=>'',        //设置密码
	'DB_PORT'=>'3306',   //设置端口号
	'DB_PREFIX'=>'',  //设置表前缀
	
	//'SHOW_PAGE_TRACE' =>true, // 显示页面Trace信息

	/*Mail config*/
	'MAIL_ADDRESS'=>'13027217007@163.com', // 邮箱地址
	'MAIL_SMTP'=>'smtp.163.com', // 邮箱SMTP服务器
	'MAIL_LOGINNAME'=>'13027217007', // 邮箱登录帐号
	'MAIL_PASSWORD'=>'WuYing19931116', // 邮箱密码
	'MAIL_CHARSET'=>'UTF-8',//编码
	'MAIL_AUTH'=>true,//邮箱认证
	'MAIL_HTML'=>true,//true HTML格式 false TXT格式
);
?>