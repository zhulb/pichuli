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

call a\a19_getnextdate.bat %1.list[%2] a23_nextdate


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
