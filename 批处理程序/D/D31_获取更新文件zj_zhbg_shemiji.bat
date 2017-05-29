@echo off
pushd ..
popd
set D31_message="%~n0"
set D31_pathmb="%~dp0"
set D31_pathmb=%D31_pathmb:~0,-4%
pushd %D31_pathmb%
::主代码
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
set D31_UserSet.classdir=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes
rem 2、设置更新文件所在文件夹
set D31_UserSet.dir=D:\workspace\zj_zhbg_shemiji\
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
call a\a23_getdatelist.bat %D31_UserSet.startdate% %D31_UserSet.enddate% D31_UserSet.Date
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
call a\a25_gettimenum.bat D31_time.start 1
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
call a\a25_gettimenum.bat D31_time.end 1
set /a D31_time=%D31_time.end%-%D31_time.start%
call a\a32_chufa.bat %D31_time% 100 D31_time
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
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%cmis=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%odps=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%core=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%duty=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%dms=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%mail=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%office=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%services=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%legislation=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!

		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%src=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%pt=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%doc=D:\workspace\zj_zhbg_shemiji\WebRoot\WEB-INF\classes!
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
