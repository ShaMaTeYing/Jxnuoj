#coding:utf8
import sys, signal, os, subprocess, time,string,MySQLdb,syslog
reload(sys)
sys.setdefaultencoding('utf-8')
def debug(msg):
	print msg
	syslog.syslog(msg)

# check if two files are the same
def file_same(a,b):

	fileA = open(a,'r')
	fileB = open(b,'r')
	value = False
	fa=fileA.read()
	fb=fileB.read()
	fa=fa.replace('\r','')
	fb=fb.replace('\r','')
	if fa == fb:
		value=True
	# if fileA.readlines() == fileB.readlines():
	# 	value = True
	fileA.close()
	fileB.close()


	return value
def old_file_same(a, b):
	fileA = open(a, "r")
	fileB = open(b, "r")

	linesA = fileA.readlines()
	linesB = fileB.readlines()

	fileA.close()
	fileB.close()

	if(len(linesA) != len(linesB)):
		return False

	for i in range(0, len(linesA)):
		lineA = linesA[i].strip()
		lineB = linesB[i].strip()
		if(lineA != lineB):
			return False

	return True
# if two files are almost the same
def compare_files(a,b):
	fileA = open(a,'r')
	fileB = open(b,'r')

	linesA = str(fileA.read())
	linesB = str(fileB.read())
	sa=linesA
	sb=linesB
	sa = sa.replace('\r', '')
	sa = sa.replace('\n','')
	sa = sa.replace('\t', '')
	sa = sa.replace(' ', '')
	sb = sb.replace('\r', '')
	sb = sb.replace('\n', '')
	sb = sb.replace('\t', '')
	sb = sb.replace(' ', '')
	fileA.close()
	fileB.close()
	# debug("A = \n" + linesA)
	# debug("B = \n" + linesB)
	if sa == sb:

		debug("file is same")
		return True
	debug("file not same")
	return False
def ModifyStatus(id,status):

    # 打开数据库连接
    db = MySQLdb.connect("localhost","root","WuYing","jxnuoj",charset="utf8")
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    # SQL 更新语句
    sql = "UPDATE user_problem SET judge_status = '%d' WHERE id = '%d'" % (status,id)
    try:
       # 执行SQL语句
       cursor.execute(sql)
       # 提交到数据库执行
       db.commit()
    except:
       # 发生错误时回滚
       db.rollback()

    # 关闭数据库连接
    db.close()
def ModifyTimeAndMemoryAndStatus(id,time,memory,status):

    # 打开数据库连接
    db = MySQLdb.connect("localhost","root","WuYing","jxnuoj",charset="utf8")
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    # SQL 更新语句
    sql = "UPDATE user_problem SET judge_status = '%d',exe_time='%d',exe_memory='%d' WHERE id = '%d'" % (status,time,memory,id)
    try:
       # 执行SQL语句
       cursor.execute(sql)
       # 提交到数据库执行
       db.commit()
    except:
       # 发生错误时回滚
       db.rollback()

    # 关闭数据库连接
    db.close()

def ModifyProblemInformation(problem_id):
    # 打开数据库连接
    db = MySQLdb.connect("localhost", "root", "WuYing", "jxnuoj", charset="utf8")
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    sql1 = "select * from user_problem where judge_status = '%d' and problem_id = '%d' " % (0, problem_id)
    # submissions
    sql2 = "select * from user_problem where problem_id = '%d'  " % (problem_id)
    try:
       # 执行SQL语句
       acceptedNumber=cursor.execute(sql1)
       allsubmissionsNumber = cursor.execute(sql2)

       # 提交到数据库执行
       db.commit()

    except:
       # 发生错误时回滚
       db.rollback()

    # 关闭数据库连接
    sql="UPDATE problem SET accepted = '%d',submissions='%d' WHERE id = '%d'" % (acceptedNumber,allsubmissionsNumber,problem_id)
    try:
       # 执行SQL语句
       cursor.execute(sql)
       # 提交到数据库执行
       db.commit()
    except:
       # 发生错误时回滚
       db.rollback()

    # 关闭数据库连接
    db.close()
def ModifyUserInformation(user_id):
    acceptedNumber=0
    allsubmissionsNumber=0
    solveNumber=0
    submissionsProblemNumber=0
    # 打开数据库连接
    db = MySQLdb.connect("localhost","root","WuYing","jxnuoj",charset="utf8")
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    # SQL 更新语句
    # update accepted
    sql1 = "select * from user_problem where judge_status = '%d' and user_id = '%d' " % (0,user_id)
    #submissions
    sql2 = "select * from user_problem where user_id = '%d'  " % (user_id)
    #solve_problem
    sql3 = "select  distinct problem_id from user_problem where judge_status = '%d' and user_id = '%d'" % (0, user_id)
    #submissions_problem
    sql4 = "select  distinct problem_id from user_problem where user_id = '%d' " % (user_id)
    try:
       # 执行SQL语句
       acceptedNumber=cursor.execute(sql1)
       allsubmissionsNumber = cursor.execute(sql2)
       solveNumber = cursor.execute(sql3)
       submissionsProblemNumber = cursor.execute(sql4)
       # 提交到数据库执行
       db.commit()

    except:
       # 发生错误时回滚
       db.rollback()

    # 关闭数据库连接
    sql="UPDATE user SET accepted = '%d',submissions='%d',solve_problem='%d',Submitted_problem='%d' WHERE id = '%d'" % (acceptedNumber,allsubmissionsNumber,solveNumber,submissionsProblemNumber,user_id)
    try:
       # 执行SQL语句
       cursor.execute(sql)
       # 提交到数据库执行
       db.commit()
    except:
       # 发生错误时回滚
       db.rollback()

    # 关闭数据库连接
    db.close()
def Judge(contest_id,sourcefile,problem,TIME_LIMIT,MEMORY_LIMIT):
    answer={'exe_time':0,'exe_mem':0,'judge_status':0}

    problem=str(problem)
    PROBLEMDIR = 'problems'
    # CODEDIR = 'codes'

    # Verdicts
    verdict = { 'ACCEPTED' : 0 ,'WA' : 1,'TLE' : 2,'MLE' : 3,'RE' : 4,'CE' : 5,'OLE' : 6,'ILE' : 7,'PE' : 8 }

    # TIME_LIMIT = string.atoi(sys.argv[3],10)
    # TIME_LIMIT = int(sys.argv[3])
    # MEMORY_LIMIT = int(sys.argv[4])



    # Parse commandlines options
    # //for example $destFile="problems/wuying/1000_1.cpp"
    # sourcefile = sys.argv[1]
    debug("sourcefile"+sourcefile)
    # problem = sys.argv[2]
    # path = "."+os.sep+"tmp"
    # ext = sourcefile.split(".")[1]
    path = "/".join(sourcefile.split("/")[:-1])
    ext = sourcefile.split(".")[1]
    # runid = sourcefile.split(".")[0]
    """
    print sourcefile	1.cpp
    print problem		1001
    print path			./tmp
    print ext			cpp
    """
    # check if the code is too long
    # a = open(CODEDIR+os.sep+sourcefile,"r")
    a = open(sourcefile,"r")
    codecode = a.read()
    a.close()
    if len(codecode) >= 50000:
        debug("ILE")
        # sys.exit(verdict["ILE"])
        answer['judge_status']=7
        return answer

    if ext == "cpp":
        compile = "g++ -lm %s -o %s 2> /dev/null" % (sourcefile, path + "/a.out")
    elif ext  == "c":
        compile = "gcc -lm %s -o %s 2> /dev/null" % (sourcefile, path + "/a.out")

    ModifyStatus(contest_id,9)
    if os.system(compile):
        debug("CE")
        # sys.exit(verdict["CE"])
        answer['judge_status'] = 5
        return answer

    # run = path+os.sep+runid
    # infile = PROBLEMDIR + os.sep + problem + os.sep + problem + ".IN"
    # outfile= path+os.sep+runid+".OUT"

    # file = sourcefile.split("/")[-1]

    infile = PROBLEMDIR + "/" + str(problem) + "/in"

    outfile = path + "/op"
    runid = "./a.out"
    debug(infile)
    debug(outfile)
    # Run
    ModifyStatus(contest_id, 10)
    debug("Running...")
    p = subprocess.Popen( runid,stdin=open(infile,"r"),stdout=open(outfile,"w"),stderr=open("/dev/null","w"),cwd=path)
    start = time.time()
    tt=0
    mm=0
    while p.poll() == None:
        # s = file("/proc/"+str(p.pid)+"/status",'r').read()
        s=open("/proc/"+str(p.pid)+"/status").read()
        if s.find('RSS') <0:
            continue
        s=s[s.find('RSS')+6:]
        s=s[:s.find('kB')-1]
        if mm < int(s):
            mm = int(s)
        if mm > MEMORY_LIMIT:
            p.kill()
            debug("MLE")
            answer['exe_time'] = tt
            answer['exe_mem'] = mm
            answer['judge_status'] = 3
            return answer
        tt = int((time.time()-start)*1000)
        if tt > TIME_LIMIT:
            p.kill()
            debug("TLE")
            answer['exe_time'] = tt
            answer['exe_mem'] = mm
            answer['judge_status'] = 2
            return answer

    print "time cost:"+str(tt)+"ms"
    print "mem  cost:"+str(mm)+"kb"
    answer['exe_time']=tt
    answer['exe_mem']=mm
    r = p.returncode
    debug("Exit status : %d " % r )
    if r != 0:
        debug("RE")
        answer['judge_status'] = 4
        return answer

    # compare output with expected out
    # outputProduced = outfile
    # outputExpected = PROBLEMDIR + os.sep + problem + os.sep + problem + ".OUT"
    outputProduced = path + "/op"
    outputExpected = PROBLEMDIR + "/" + str(problem) + "/out"
    debug(outputProduced)
    debug(outputExpected)
    a = open(outfile,'r')
    codecode = a.read()
    if len(codecode) >= 50000:
        debug( "OLE")
        answer['judge_status'] = 6
        return answer

    timefile= open(path+os.sep+problem+".TIME","w")
    memfile = open(path+os.sep+problem+".MEM","w")
    timefile.write(str(tt))
    memfile.write(str(mm))
    timefile.close()
    memfile.close()

    # if compare_files(outputProduced,outputExpected) == True:
    # 	if file_same(outputProduced,outputExpected) == True:
    # 		debug("AC")
    # 		sys.exit( verdict["ACCEPTED"] )
    # 	else:
    # 		debug("PE")
    # 		sys.exit( verdict["PE"] )
    # else:
    # 	debug("WA")
    # 	sys.exit(verdict["WA"])
    debug("start judge")
    if file_same(outputProduced,outputExpected) == True:
        debug("AC")
        # sys.exit(verdict["ACCEPTED"])
        answer['judge_status'] = 0
        return answer
    else :

        if compare_files(outputProduced,outputExpected) == True:
            debug("PE")
            answer['judge_status'] = 4
            return answer
        else:
            debug("WA")
            answer['judge_status'] = 1
            return answer
def getTimeAndMemory(id):
    ans=[]
    # 打开数据库连接
    db = MySQLdb.connect("localhost","root","WuYing","jxnuoj",charset="utf8")
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    # SQL 查询语句
    sql = "select * from problem where id = '%d' " % (id)
    try:
       # 执行SQL语句
       aa=cursor.execute(sql)
       # 获取所有记录列表
       results = cursor.fetchall()
       for row in results:
            ans.append(row[2])
            ans.append(row[3])
    except:
       print "Error: unable to fecth data"
    # 关闭数据库连接
    db.close()
    return ans
def Query():
    verdict = {0:'ACCEPTED', 1:'WA', 2:'TLE', 3:'MLE', 4:'RE', 5:'CE', 6:'OLE', 7:'ILE', 8:'PE'}
    # 打开数据库连接
    db = MySQLdb.connect("localhost","root","WuYing","jxnuoj",charset="utf8")
    # 使用cursor()方法获取操作游标
    cursor = db.cursor()
    # SQL 查询语句
    sql = "select * from user_problem where judge_status = '%d' " % (8)
    try:
       # 执行SQL语句
       aa=cursor.execute(sql)
       # 获取所有记录列表
       results = cursor.fetchall()
       for row in results:
            # 将等待状态设置成编译状态
            # ModifyStatus(row[0],9)
            timeAndMemory=getTimeAndMemory(row[2])
            answer=Judge(row[0],row[10],row[2],timeAndMemory[0],timeAndMemory[1])
            ModifyTimeAndMemoryAndStatus(row[0],answer['exe_time'],answer['exe_mem'],answer['judge_status'])
            ModifyUserInformation(row[1])
            ModifyProblemInformation(row[2])
            # 将编译状态设置成运行状态
            # ModifyStatus(row[0],10)
    except:
        print "Error: unable to fecth data"
    # 关闭数据库连接
    db.close()

if __name__=="__main__":
    Query()