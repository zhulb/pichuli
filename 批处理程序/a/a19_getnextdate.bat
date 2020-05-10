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

call a\a20_varcopy.bat a19_date.month.list[%a19_date.month%] a19_date.month.lastday

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
