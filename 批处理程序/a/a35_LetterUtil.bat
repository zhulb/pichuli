@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码

rem ***********
rem **@description 设置常量
rem **@changliang.lowLetter 小写字母
rem **@changliang.upLetter 大写字母
rem **@changliang.
rem ***********
set a35_changliang.lowLetter=0
set a35_changliang.upLetter=1

rem ***********
rem **@description 调用方法
rem **@arg %1 调用的方法
rem **@arg %2、%3... 方法参数
rem ***********
call :a35_%1 %*
call a33_clearvar.bat a35_ 1
goto :eof

::一层c
rem ----------------------------------------------------------一层c
rem ************
rem **@author zliangbing
rem **@date 20/3/15
rem **@description 获取小写字母数组
rem **@arg %1 数组名称
rem ************
:a35_getLowLetterArr
shift
set a35_getLowLetterArr.arrname=%1
set a35_getLowLetterArr.lowLetter=abcdefghijklmnopqrstuvwxyz
for /l %%i in (0,1,25) do (
	call :a35_getLowLetterArr.setArr %%a35_getLowLetterArr.lowLetter:~%%i,1%% %%i
)
goto :eof

rem ************
rem **@author zliangbing
rem **@date 20/3/15
rem **@description 获取大写字母数组
rem **@arg %1 数组名称
rem ************
:a35_getUpLetterArr
shift
set a35_getUpLetterArr.arrname=%1
set a35_getUpLetterArr.upLetter=ABCDEFGHIJKLMNOPQRSTUVWXYZ
for /l %%i in (0,1,25) do (
	call :a35_getUpLetterArr.setArr %%a35_getUpLetterArr.upLetter:~%%i,1%% %%i
)
goto :eof

rem ************
rem **@author zliangbing
rem **@date 20/3/15
rem **@description 获取指定的字母数组
rem **@arg %1 数组名称
rem **@arg %2 指定数组类型
rem ************
:a35_getLetterArr
shift
set a35_getLetterArr.arrname=%1
if "%2"=="0" (
	set a35_getLetterArr.letter=abcdefghijklmnopqrstuvwxyz
	set a35_setLetterArr.letter.index=25
)
if "%2"=="1" (
	set a35_getLetterArr.letter=ABCDEFGHIJKLMNOPQRSTUVWXYZ
	set a35_setLetterArr.letter.index=25
)
if "%2"=="3" (
	set a35_getLetterArr.letter=0123456789
	set a35_setLetterArr.letter.index=9
)
if "%2"=="4" (
	set a35_getLetterArr.letter=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%%^^^&^(^)^_+=-~`[]\{}^|【】\;':
	set a35_setLetterArr.letter.index=88
)
for /l %%i in (0,1,%a35_setLetterArr.letter.index%) do (
	call :a35_getLetterArr.setArr "%%a35_getLetterArr.letter:~%%i,1%%" %%i
)
goto :eof

:a35_stringPianYi

goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
:a35_getLowLetterArr.setArr
set %a35_getLowLetterArr.arrname%[%2]=%1
goto :eof

:a35_getUpLetterArr.setArr
set %a35_getUpLetterArr.arrname%[%2]=%1
goto :eof

:a35_getLetterArr.setArr
for %%i in (%1) do (
	set %a35_getLetterArr.arrname%[%2]=%%~i
)
goto :eof

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
