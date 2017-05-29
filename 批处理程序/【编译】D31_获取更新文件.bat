@echo off
rem ----------------------------------------------------------主代码
set D31_UserSet.classdir=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes
set D31_UserSet.dir=D:\workspace\partyaffairsplt1.0_zhbg\
set D31_UserSet.fileType[1]=java
set D31_UserSet.fileType[2]=jsp
set D31_UserSet.fileType[3]=js
set D31_UserSet.fileType[].length=3
echo,提示：配置信息
echo,更新文件所在文件夹
echo,%D31_UserSet.dir%
echo,按任意键开始获取更新文件...
pause>nul
set D31_SysSet.dir=
for /l %%i in (1,1,%D31_UserSet.fileType[].length%) do (
call :D31_SysSet.createDir "%%D31_UserSet.dir%%*.%%D31_UserSet.fileType[%%i]%%"
)
set D31_UserSet.Date[1]=2014/02/23
set D31_UserSet.Date[2]=2014/02/24
set D31_UserSet.Date[3]=2014/02/25
set D31_UserSet.Date[4]=2014/02/26
set D31_UserSet.Date[5]=2014/02/27
set D31_UserSet.Date[6]=2014/02/28
set D31_UserSet.Date[].length=6
set D31_UserSet.targetDirectory=D31_临时文件夹\拷贝
set D31_File.path=
set D31_File.createtime=
if not exist D31_临时文件夹 (
md D31_临时文件夹
)
for /f "tokens=*" %%a in ('dir /b/s %D31_SysSet.dir%') do (
for /l %%i in (1,1,%D31_UserSet.Date[].length%) do (
call :D31_WenJian.copy "%%~ta" "%%~a" "%%D31_UserSet.Date[%%i]%%"
)
)
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
if not exist "%D31_UserSet.targetDirectory%\%D31_File.Path:~3% (
md "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%
)
copy %2 "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%
rem 如果是java文件，复制其class文件
rem if "%~x2"==".java" copy
setlocal EnableDelayedExpansion
set D31_WenJian.copy.classpath=%2
echo, eee!D31_WenJian.copy.classpath!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%cmis=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%odps=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%core=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%duty=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%dms=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%mail=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%office=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%services=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
rem copy !D31_WenJian.copy.classpath!  "%D31_UserSet.targetDirectory%
for %%i in (!D31_WenJian.copy.classpath!) do (
set D31_WenJian.copy.classfile="%%~dpi"
set D31_WenJian.copy.classpath="%%~dpni".class
)
set D31_WenJian.copy.classfile=!D31_WenJian.copy.classfile:~3!
copy !D31_WenJian.copy.classpath! D31_UserSet.targetDirectory
endlocal
)
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
