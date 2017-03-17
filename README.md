# 江西师范大学ACM在线评测系统
本系统基于Web，使用B/S架构，实现了对用户提交的程序设计语言代码在线编译，运行，以及最后的判定的工作。本系统的前端使用当前比较流行的BootStrap框架，后台使用了ThinkPHP框架。
本系统只负责将用户提交的相关信息保存至数据库。
然后判题部分是用python语言实现的。python不断查询数据库，看是否有未判题的记录。如果有，则执行判题。并更新数据库。
python在Ubuntu14.04的环境下运行。
Ubuntu需要实现安装lamp和各种语言编译器。
没时间解释啦，我要上车啦，至于具体怎么部署，以及一步步安装环境，以后会说得惹！！！

------------
项目结构，随便写写

----.git .settings  git自动生成的文件夹

	code 存放用户题库提交代码的文件夹
		|---admin 用户admin的代码文件
		|---wuying 用户wuying的代码文件
			
	contest 存放用户比赛提交代码的文件夹
		|---code 存放用户比赛提交代码的文件夹
	Home 项目文件夹
		|---Common 存放全局函数的文件夹
			|---common.php 自己编写的全局函数的存放在这里
		|---Conf 配置文件夹
			|---config.php 配置文件喽，比如设置数据库连接的一些信息
		|---Lang 不懂干嘛的，木有用过它
		|---Lib 很重要的文件夹
			|---Action 后台全在这里操控
				|---AdminAction.class.php 后台管理模块
				|---BaseAction.class.php 基础类，所有人继承它
				|---ExamAction.class.php 比赛类
				|---IndexAction.class.php 题库类
				|---JudgeAction.class.php 评测类
				|---LoginAction.class.php 登录类
			|---Behavior 没用过，不清楚干嘛的
			|---Model 据说是用来写MVC中的M的，李晓科大大没教我，说是Action够用了，所以，我也不会用
			|---ORG 不懂
			|---Widget 不懂这个文件
		|---Runtime 缓存文件夹，不用管它
		|---Tpl 前端页面文件夹
			|---Admin 	管理模块的所有页面
				|---showAddproblem.html 显示添加问题页面
				|---showAllUserRank.html 显示所有用户排名的页面
				|---showLoginMessage.html 显示登录信息的页面
				|---showModifyProblem.html 显示修改问题的页面
				|---showProblemLibrary.html 显示所有问题的页面
				|---showUpload.html 显示上传数据的页面	
				|---showUserMessage.html 显示用户信息的页面
			|---Exam 比赛模块的所有页面
				|---index.html 比赛主页，显示比赛列表
				|---showCode.html 显示代码的页面
				|---showProblem.html 显示问题详情的页面
				|---showProblemList.html 显示问题列表的页面
				|---showStatus.html 显示比赛实时评测的页面
				|---showSubmit.html 显示提交问题的页面
			|---Index 题库模块的所有页面
				|---index.html 显示主页
				|---showModifyUserMessage.html 显示修改用户信息的页面
				|---showProblem.html 显示问题详情的页面
				|---showProblemList.html 显示问题列表的页面
				|---showSubmit.html 显示提交问题的页面
				|---showUserMessage.html 显示用户信息的页面
			|---Judge 评测模块的所有页面
				|---showRealTimeEvaluation.html 显示评测页面
				|---showUserCode.html 显示用户代码
			|---Login 登录模块的所有页面
				|---showGetMail.html 显示输入邮箱
				|---showLogin.html 显示登录页面
				|---showModifyPassword.html 显示修改密码页面
				|---showRegister.html 显示注册页面
			|---Public 公共页面
				|---base.html 基础公共模板,所有页面都可以继承重载它。
				|---footer.html 模板底部页面
				|---header.html 模板头部页面,旧的
				|---head1.html 模板头部页面
		
	problems 存放题目评测数据的文件夹
		|---1000 题目ID为1000的文件
				|---in 输入文件
				|---out 输出文件
		|---XXXX 题目ID为XXXX的文件
				|---in 输入文件
				|---out 输出文件
			......
	Public 存放js,css,fonts等文件的文件夹
		|---css 存放项目的所有css文件
		|---fonts 所有字体文件
		|---images 存放项目的所有图片
		|---js 存放项目的所有js文件
	ThinkPHP ThinkPHP包，不用看它，相当于里面都是库函数
	.buildpath .project 项目自动生成的，我也不知道什么意思，不用管它
	index.php 项目入口文件，第一次运行会生成项目名称之类的。
	judge.py 判题服务程序
	judge111.py 旧版本的判题服务程序
	jxnuoj  旧版本的判题服务程序
	jxnuoj.sql 数据库备份文件
	jxnuoj1  旧版本的判题服务程序
	log.txt 也许是日志文件吧，我也不知道，不用管它
	README.md 你现在看的东西就是我


	

	
 


----------

如何部署呀？
如果不考虑判题的话，可以运行在Windows上。需要先安装wamp，把JxnuOJ整个文件夹放在www目录下。接着再下载个navicat管理数据库。比如要运行这个项目，先要创建数据库，首先打开navicat,新建个数据库叫做"jxnuoj"，然后就可以把jxnuoj.sql导入进去了。然后在浏览器里输入localhost/JxnuOJ就可以了。
整个项目要完全运行的话，就要在Linux环境下跑。先说下大概的流程吧，坑点很多，以后再细说。我这里用的是Ubuntu 14.04.然后装个lamp，lamp自己去看教程。把项目拷贝到www/html目录下(注意跟Windows的差异，Windows是www目录下)，再装个phpmyadmin。同样要先创建数据库。然后在浏览器输入localhost/JxnuOJ即可。如果发现没有用，那就打开配置文件config.php编辑下数据库的密码之类的信息。config.php在哪里可以看下下面的项目结构。然后再运行下judge.py，开启判题服务，就可以判题了。

----------
这里仔细说下判题部分的实现，判题可是这个系统的核心，但是实现这个功能的资料很难找啊！！！别人家OJ上也没有仔细说啊！！！之前写OJ的时候是各种找人家的开源项目想找判题部分的源码出来观摩，可惜往往连人家判题代码写在哪个文件都找不到！！！很无助，很可怜啊，有木有！！！下面我就说得仔细点，给大家借鉴借鉴，少走弯路。下面切入正题！！！

----------
## 判题部分 ##
判题大致是一个这样的流程

1. **用户提交代码**，然后后台就把用户提交的代码存档到文件(路径为:code/用户名/题目ID_提交次数.cpp，比如有个叫wuying的用户第11次提交题目ID为1000的题，提交的语言是C++,那么构造的路径就为:code/wuying/1000\_11.cpp)里面，并将用户提交的信息写入到数据库的评测表(user\_problem)中，比如用户的ID，题目的ID，代码提交时间，题目时间和内存的限制，存储代码文件的路径等等信息，并且将评测状态置为Pending(待判定)。
2. **python程序轮询数据库**，python每隔一定的时间(比如0.5s一次)查询一次数据库，查看评测表是否有评测状态为Pending的记录。如果有，则开始程序判断工作。
3. **判断输入代码是否过长**，根据记录中的代码文件的路径，读出代码文件的内容，保存至字符串变量中，判断代码是否过长，即等价于判断代码所占空间是否过大，即等价于判断字符串长度是否过长。如果长度超过一个定值(比如50000)，就判定为“Input Limit Exceeded”，结束判定工作。否则继续接下来的判定。
4. **判断是否编译错误**，根据文件路径，就可以提取出文件后缀名，根据后缀名，就可以构造相应的编译命令。比如后缀名是cpp，可以构造`compile = "g++ -lm %s -o %s 2> /dev/null" % (sourcefile, path + "/a.out")`，其中sourcefile是源文件的路径，path+"a.out" 是编译后文件存放的路径。不过要实现对某个语言的编译，必须事先安装好相应语言的编译器，以及事先了解好编译指令。据我了解，Ubuntu系统只是自带gcc，没有自带g++，要使用g++必须先安装它。构造好编译指令，只要用shell执行就可以了，python模拟shell执行只需要`os.system(compile)`就ok了，如果返回值为0就代表编译成功，继续下面的判断工作，否则判定为“Compilation Error”,即为编译错误。
5. **运行编译好的可执行程序**，测试数据分为输入和输出，题目的测试数据是这样存放的，比如题目ID为1000的输入文件的路径是：problems/1000/in，输出文件的路径是：problems/1000/out，所以根据题目ID便可以构造相应文件路径，从而找到测试数据，假设测试数据输入文件的路径存放在infile变量中，假设用户程序利用输入文件跑出的输出数据文件的路径存放在outfile中，编译好了的可执行程序文件的路径存放在runid中。那现在只需要创建一个进程。` p = subprocess.Popen( runid,stdin=open(infile,"r"),stdout=open(outfile,"w"),stderr=open("/dev/null","w"),cwd=path)`，stdin为重定向文件输入，stdout为重定向文件输出，stedrr为错误句柄，cwd为设置这个被创建的子进程的当前目录。然后记录下此刻的时间戳。存放到变量start中。然后不断地检测进程是否执行完毕。`while p.poll() == None`上述语句即可实现，如果没有执行完毕。则判断程序执行的时间有没有超出题目要求的时间限制，如果超出了，则结束程序。报错“Time Limit Exceeded”。同时也判断程序的运行内存有没有超过题目要求的内存限制，如果超过了，就结束程序。报错“Memory Limit Exceeded”。判断时间有没有超出限制很简单，只需要把当前的时间减去开始的时间就可以得到程序的运行时间了，即`tt = int((time.time()-start)*1000)`，至于判断程序的运行内存是否超过限制，获得程序的运行内存是个头疼的问题，想要自己写貌似很难，不过幸好，Ubuntu系统会把每个正在运行的程序所占用的内存写入到路径为： /proc/进程ID/status 的文件的VmRSS字段后面，所以只需要读文件再查找就行了，代码如下：`s=open("/proc/"+str(p.pid)+"/status").read()
        s=s[s.find('RSS')+6:]
        s=s[:s.find('kB')-1]`，
这样就可以得到程序的运行内存。如果程序没有超过时间和内存限制，那么进程就会执行结束。然后获取进程结束时的返回值，如果返回值不为0，说明创建的进程异常退出，就结束程序，报错“Runtime Error”。用代码`r = p.returncode`即可获取进程返回值。否则，程序正常执行完毕，会把输出的数据写入outfile中。
6. **判断用户程序输出文件**先判断用户输出数据文件是否过大，和判断代码文件是否过大是一样的做法，如果过大，就结束程序，报错“Output Limit Exceeded”。否则继续执行接下来的程序，把测试数据的输出文件和用户程序的输出文件比较，如果完全一致，就结束程序，返回“Accepted”,否则就把两个文件的空格，制表符，换行，回车，都替换了，再判断两个文件是否一致，如果一致，就报错“Presentation Error”，否则报错“Wrong Answer”。
7. **写回数据库**，然后把评测状态，所用时间，所用内存等状态写回数据库对应的记录即可。




