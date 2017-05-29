@echo off
rem ----------------------------------------------------------主代码
rem 一、创建临时文件夹
rem 删除原有临时文件夹
if exist D31_临时文件夹 (
	echo,y|(1>nul 2>nul rd /s D31_临时文件夹)
)
rem 创建新的临时文件夹
if not exist D31_临时文件夹 (
	md D31_临时文件夹
)
rem 创建日志文件
cd.>D31_临时文件夹\日志.txt
rem 二、程序基本数据设置
rem 1、设置class文件的路径
set D31_UserSet.classdir=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes
rem 2、设置更新文件所在文件夹
set D31_UserSet.dir=D:\workspace\zj_zhbg_svn\
rem 3、设置要更新的文件类型
set D31_UserSet.fileType[1]=java
set D31_UserSet.fileType[2]=jsp
set D31_UserSet.fileType[3]=js
set D31_UserSet.fileType[].length=3
rem 4、开始时间、结束时间
set /p D31_UserSet.startdate=输入开始日期(2014/03/10)：
set /p D31_UserSet.enddate=输入结束日期(2014/03/20)：
rem set D31_UserSet.startdate=2014/03/05
rem set D31_UserSet.enddate=2014/03/10
rem 5、拷贝文件存放文件夹
set D31_UserSet.targetDirectory=D31_临时文件夹\拷贝
rem 三、运行提示
rem 1、提示
echo,提示：配置信息
echo,更新文件所在文件夹
echo,%D31_UserSet.dir%
echo,按任意键继续...
rem 2、提示写入日志
(echo,提示：配置信息
echo,更新文件所在文件夹
echo,%D31_UserSet.dir%
echo,按任意键开始继续...)>>D31_临时文件夹\日志.txt
echo,
pause>nul
rem 四、基于基本数据分析出过程数据
rem 1、获取字符串  "文件夹路径\*.java" "文件夹路径\*.jsp" "文件夹路径\*.js"
set D31_SysSet.dir=
for /l %%i in (1,1,%D31_UserSet.fileType[].length%) do (
	call :D31_SysSet.createDir "%%D31_UserSet.dir%%*.%%D31_UserSet.fileType[%%i]%%"
)
rem 2、分析日期区间
call :a23 %D31_UserSet.startdate% %D31_UserSet.enddate% D31_UserSet.Date 
rem 显示日期区间并写入日志
>>D31_临时文件夹\日志.txt set D31_UserSet.Date
set D31_UserSet.Date
echo,请按任意键继续...
pause>nul
rem 五、开发文件复制
set D31_File.path=
set D31_File.createtime=
rem 1、统计
set D31_tongji=0
rem for /f "tokens=*" %%a in ('dir /b/s %D31_SysSet.dir%') do (
rem 	call :D31_numadd
rem )
echo,共有【%D31_tongji%】个文件待分析！
echo,请按任意键开始！
(echo,共有【%D31_tongji%】个文件待分析！
echo,请按任意键开始！
)>>D31_临时文件夹\日志.txt
pause>nul
echo,程序运行，请耐心等候...
call :a25 D31_time.start 1 
rem 2、复制
for /f "tokens=*" %%a in ('dir /b/s %D31_SysSet.dir%') do (
	for /l %%i in (1,1,%D31_UserSet.Date.list[]%) do (
		call :D31_WenJian.copy "%%~ta" "%%~a" "%%D31_UserSet.Date.list[%%i]%%"
	)
)
rem 六、打开日志文件
echo,完成！
echo,覆盖有风险！更新操作请谨慎！
(echo,完成！
echo,覆盖有风险！更新操作请谨慎！
)>>D31_临时文件夹\日志.txt
call :a25 D31_time.end 1 
set /a D31_time=%D31_time.end%-%D31_time.start%
call :a32 %D31_time% 100 D31_time 
echo,总共耗时：%D31_time%秒！
>>D31_临时文件夹\日志.txt echo,总共耗时：%D31_time%秒！
start " " "D31_临时文件夹\日志.txt"
pause
exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:D31_SysSet.createDir
if not defined D31_SysSet.dir (
	set D31_SysSet.dir=%1
) else (
	set D31_SysSet.dir=%D31_SysSet.dir% %1
)
goto :eof
:D31_WenJian.copy
set D31_File.Path="%~dp2"
set D31_File.createtime=%~1
set D31_File.createtime=%D31_File.createtime:~0,10%
set D31_File.createtime_=%3
if "%D31_File.createtime%"==%D31_File.createtime_% (
	echo,copy %2
	>>D31_临时文件夹\日志.txt echo,copy %2
	if not exist "%D31_UserSet.targetDirectory%\%D31_File.Path:~3% (
		md "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%
	)
	echo,-------------------------复制文件
	echo,【路径：】%2
	1>nul 2>nul copy %2 "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%&&(echo,文件复制成功!&>>D31_临时文件夹\日志.txt echo,文件复制成功！)||(echo,文件复制失败!&>>D31_临时文件夹\日志.txt echo,文件复制失败！)
	rem call :D31_message
	rem 如果是java文件，复制其class文件
	rem if "%~x2"==".java" copy
	if "%~x2"==".java" (
		echo,-------------------------复制class文件
		setlocal EnableDelayedExpansion
		set D31_WenJian.copy.classpath=%2
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%legislation=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%duty=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%odps=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%services=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%dms=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%cmis=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%mail=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%pt=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%office=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%core=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		for %%i in (!D31_WenJian.copy.classpath!) do (
			set D31_WenJian.copy.classfile="%%~dpi"
			set D31_WenJian.copy.classpath="%%~dpni".class
		)
		set D31_WenJian.copy.classfile=!D31_WenJian.copy.classfile:~3!
		echo,【路径： 】!D31_WenJian.copy.classpath!
		if not exist !D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile! (
			md "!D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile!
		)
		>>D31_临时文件夹\日志.txt echo,copy !D31_WenJian.copy.classpath!
		1>nul 2>nul copy !D31_WenJian.copy.classpath! "!D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile!"&&(echo,文件复制成功!&>>D31_临时文件夹\日志.txt echo,文件复制成功！)||(echo,文件复制失败!&>>D31_临时文件夹\日志.txt echo,文件复制失败！)
		rem call :D31_message
		rem if !errorlevel!==0 (
		rem	echo,文件复制成功！
		rem ) else (
		rem 	>>D31_临时文件夹\日志.txt echo,copy !D31_WenJian.copy.classpath! "!D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile!
		rem 	echo,文件复制失败！
		rem )
		endlocal
	)
)
goto :eof
:D31_message
if %errorlevel%==0 (
	>>D31_临时文件夹\日志.txt echo,文件复制成功！
	echo,文件复制成功！
) else (
	>>D31_临时文件夹\日志.txt echo,文件复制失败！
	echo,文件复制失败！
)
goto :eof
:D31_numadd
set /a D31_tongji=%D31_tongji%+1
goto :eof
::函数1 end
::函数2
::函数2 end
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:
【文件名称   】:
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------主代码 end
::主代码 end
:a23
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem %1 开始时间 2012/03/04
rem %2 结束时间	2013/03/05
rem %3 变量名 如a.list[]   a.list[1] a.list[2] ...
rem 一、开始日期与结束日期相等
if "%1"=="%2" (
set %3.list[]=1
set %3.list[1]=%1
goto :eof
)
rem 二、
rem 最多200个日期
set %3.list[]=1
set %3.list[1]=%1
set a23_end=
for /l %%i in (1,1,200) do (
	call :a23_check %3 %%i %2
	if defined a23_end (
		goto :a23_end
	)
)
:a23_end
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a23_check
set /a a23_nextnum=1+%2
call :a19 %1.list[%2] a23_nextdate 
set %1.list[%a23_nextnum%]=%a23_nextdate%
set %1.list[]=%a23_nextnum%
if "%a23_nextdate%"=="%3" (
	set a23_end=yes
)
goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a25
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 缺陷说明：
rem 计算的的只有时间信息，没有包含日期
rem 结果是距离0:0:0 00的百分秒数(103表示1.03秒)
set a25_time=%time%
set /a a25_hour=%a25_time:~-11,2%+0
set a25_minite=%a25_time:~-8,2%
if %a25_minite% lss 10 (
	set a25_minite=%a25_minite:~-1%
)
set a25_second=%a25_time:~-5,2%
if %a25_second% lss 10 (
	set a25_second=%a25_second:~-1%
)
set a25_last=%a25_time:~-2,2%
if %a25_last% lss 10 (
	set a25_last=%a25_last:~-1%
)
set /a %1=100*60*60*%a25_hour%+100*60*%a25_minite%+100*%a25_second%+%a25_last%
goto :eof
::一层c
rem ----------------------------------------------------------一层c
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a32
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 除法运算，可保留4位小数
rem 10万以内的除法
rem 
rem %1被除数、%2除数 %3保留结果的变量
set /a a32_num=10000*%1
set /a a32_result=%a32_num%/%2
call :a31 %a32_result% 4 %3 
call :a33 a32_ 1 
goto :eof
::一层c
rem ----------------------------------------------------------一层c
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a19
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 一、原始数据获取
rem 1、将日期数据赋值给
call :a19_getdate %%%1%%
rem 2、保存结果的变量名
set a19_resultvar=%2
rem 二、获取日期基本信息
set a19_date.year=%a19_date:~0,4%
set a19_date.month=%a19_date:~5,2%
set a19_date.day=%a19_date:~8,2%
rem 03--->3
if %a19_date.month% lss 10 (
	set a19_date.month=%a19_date:~6,1%
)
if %a19_date.day% lss 10 (
	set a19_date.day=%a19_date:~9,1%
)
rem 说明：
rem 本来可以set /a a19_date.month=%a19_date:~5,2%+0
rem 但是当%a19_date:~5,2%为08时会报错
rem 即set /a a=03+0可以得到3
rem 但是set /a a=08+0会报错
rem 求year.isRuiNian
set /a a19_yuShu100=%a19_date.year% %% 100
set /a a19_yuShu400=%a19_date.year% %% 400
set /a a19_yuShu4=%a19_date.year% %% 4
rem 
if "%a19_yuShu100%"=="0" (
	if "%a19_yuShu400%"=="0" (
		set a19_date.year.isRuiNian=true
	) else (
		set a19_date.year.isRuiNian=false
	)
) else (
	if "%a19_yuShu4%"=="0" (
		set a19_date.year.isRuiNian=true
	) else (
		set a19_date.year.isRuiNian=false
	)
)
rem 根据是否是瑞年选择月份天数数组
if "%a19_date.year.isRuiNian%"=="true" (
	set a19_date.month.list[1]=31
	set a19_date.month.list[2]=29
	set a19_date.month.list[3]=31
	set a19_date.month.list[4]=30
	set a19_date.month.list[5]=31
	set a19_date.month.list[6]=30
	set a19_date.month.list[7]=31
	set a19_date.month.list[8]=31
	set a19_date.month.list[9]=30
	set a19_date.month.list[10]=31
	set a19_date.month.list[11]=30
	set a19_date.month.list[12]=31
) else (
	
	set a19_date.month.list[1]=31
	set a19_date.month.list[2]=28
	set a19_date.month.list[3]=31
	set a19_date.month.list[4]=30
	set a19_date.month.list[5]=31
	set a19_date.month.list[6]=30
	set a19_date.month.list[7]=31
	set a19_date.month.list[8]=31
	set a19_date.month.list[9]=30
	set a19_date.month.list[10]=31
	set a19_date.month.list[11]=30
	set a19_date.month.list[12]=31
)
set a19_date.month.list[]=12
rem 获取本月最后一天
call :a20 a19_date.month.list[%a19_date.month%] a19_date.month.lastday 
if "%a19_date.month.lastday.truevalue%"=="%a19_date.day%" (
	set a19_nextdate.day=1
	if "%a19_date.month%"=="12" (
		set a19_nextdate.month=1
		set /a a19_nextdate.year=%a19_date.year%+1
	) else (
		set /a a19_nextdate.month=%a19_date.month%+1
		set /a a19_nextdate.year=%a19_date.year%
	)
) else (
	set /a a19_nextdate.day=%a19_date.day%+1
	set /a a19_nextdate.month=%a19_date.month%
	set /a a19_nextdate.year=%a19_date.year%
)
rem 4--->04
if %a19_nextdate.month% lss 10 (
	set a19_nextdate.month=0%a19_nextdate.month%
)
if %a19_nextdate.day% lss 10 (
	set a19_nextdate.day=0%a19_nextdate.day%
)
set %a19_resultvar%=%a19_nextdate.year%/%a19_nextdate.month%/%a19_nextdate.day%
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a19_getdate
set a19_date=%1
goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a31
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 说明
rem 将一个整数变成小数(整数小数点左移)
rem 相当于除法，只不过除数为10、100、1000等... 
rem 
rem %1是要处理的整数  %2是小数点向左移动的为数  %3保存处理结果的变量
rem 
set /a a31_num=1000000000+%1
set a31_pianyiliang=%2
call :a31_setFirstValue %%a31_num:~1,-%a31_pianyiliang%%%.%%a31_num:~-%a31_pianyiliang%%%
:start
for /f "tokens=*" %%i in ('echo,%a31_num%^|findstr "^0[0-9]"') do (
	set a31_num=%a31_num:~1%
	goto :start
)
set %3=%a31_num%
rem 清空环境变量
for /f "tokens=1" %%i in ('set a31_') do (
	set %%i=
)
goto :eof
::一层c
rem ----------------------------------------------------------一层c
:a31_setFirstValue
set a31_num=%1
goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a33
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 清空xxx开头的环境变量
rem %1变量的开头字符串  %2无意义
for /f "tokens=1 delims==" %%i in ('set %1') do (
	set %%i=
)
goto :eof
::一层c
rem ----------------------------------------------------------一层c
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a20
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 一、调用此批处理可以将一个变量的值赋值给另外一个变量
rem     另外，也可以就爱那个变量的值赋值给自身，然后将值进行显示输出或者重定向
rem 
rem 二、参数1表示被复制值的变量名称，参数2表示接收值的变量名
rem 
rem 三、调用方式
rem 
rem 四、返回值使用方法
rem %接受变量名.showvalue%，可用来输出环境变量的值，值中的特殊符号已做转义处理
rem %接受变量名.truevalue%, 环境变量原来的值
rem 
rem 五、操作手册
rem 1、显示或者重定向含有特殊符号的环境变量
rem 2、经变量赋值给另外一个变量
rem 
rem 六、原理分析
rem 利用call的双重扩展变量的特性实现只需要将变量名作为参数传入就可以取得变量值，优点是简化代码书写，缺点是效率较低(call会进行两次变量扩展)，如果要提高效率，可以参考本文件最后的例子
rem 批处理变量扩展的优先顺序
rem 参数扩展--->环境变量的%扩展--->for()变量扩展--->(若开启变量延迟扩展)环境变量的!扩展
rem call-后面的代码以上的扩展过程会进行两次
rem 
set a20_source.name=%1
set a20_target.name=%2
rem 设置方法参数
set a20_varcopy.args.targetname=%a20_target.name%
rem 调用方法
call :a20_varcopy "%%%a20_source.name%:"=" "%%"
goto :eof
:a20_varcopy
set a20_linshi=%*
set a20_linshi=%a20_linshi:^=^^^^^^^^^^^^^^^^%
set a20_linshi=%a20_linshi:&=^^^^^^^^^^^^^^^&%
set a20_linshi=%a20_linshi:|=^^^^^^^^^^^^^^^|%
set a20_linshi=%a20_linshi:>=^^^^^^^^^^^^^^^>%
set a20_linshi=%a20_linshi:<=^^^^^^^^^^^^^^^<%
set a20_linshi=%a20_linshi:~1,-1%
set a20_linshi=%a20_linshi:" "=^^^^^^^"%
set %a20_varcopy.args.targetname%.showvalue=%a20_linshi%
set a20_linshi=%a20_linshi%
set %a20_varcopy.args.targetname%.truevalue=%a20_linshi%
rem 清空环境变量
call :a33 a20_ 1 
goto :eof
::一层c
rem ----------------------------------------------------------一层c
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::varcopy高效例子
rem 变量名不能动态改变，针对特定的变量
@echo off
:start
set /p a=
set linshi="%a:"=" "%"
set linshi=%linshi:^=^^^^^^^^^^^^^^^^%
set linshi=%linshi:&=^^^^^^^^^^^^^^^&%
set linshi=%linshi:|=^^^^^^^^^^^^^^^|%
set linshi=%linshi:>=^^^^^^^^^^^^^^^>%
set linshi=%linshi:<=^^^^^^^^^^^^^^^<%
set linshi=%linshi:~1,-1%
set linshi=%linshi:" "=^^^^^^^"%
set b.showvalue=%linshi%
set b.truevalue=%b.shovalue%
echo,%b.showvalue%
goto :start
::varcopy高效例子 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
