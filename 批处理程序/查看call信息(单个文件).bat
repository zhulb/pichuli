@echo off
set pathly="%~0"
if exist "路径处理\路径处理2.bat" (
call :message
)
:begin
cls
if not exist "路径处理\获取路径.bat" (
echo,
echo,缺少文件!!!
ping /n 2 127.1>nul
goto exit
)
rem  从下面开始写代码
if not exist 查看call信息 md 查看call信息
call 路径处理\获取路径.bat 1 1
call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 0
if "%result%"=="wjj" (
echo,目标是文件夹!
ping /n 2 127.1>nul
goto exit
)
for /f "usebackq tokens=*" %%i in ("%pathly%") do (
set pathly=%%i
call :main
)
echo,完成!
echo,请按任意键返回!
pause>nul
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------一层call
:main
set str6.1= 
set act6.1=
set act6.2=
call 将变量按字符串拆分\将变量按字符串拆分.bat 1 0 pathly str6.1
for /f "tokens=*" %%i in (将变量按字符串拆分\d.txt) do (
set pathly=%%i
if defined act6.1 (
call :main2
if not defined act6.2 (
echo,%%i
)
goto finish
)
call :main1
)
:finish
goto :eof
:message
call 路径处理\路径处理2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------二层call
:main1
call 变量处理\变量处理10.bat 1 1 pathly
if "%pathly%"=="call" (
set act6.1=on
)
goto :eof
rem ----------------------------------------------------------二层call end
rem ----------------------------------------------------------三层call
:main2
call 变量处理\变量处理10.bat 1 1 pathly
if "%pathly:~0,1%"==":" (
set act6.2=on
)
goto :eof
rem ----------------------------------------------------------三层call end
rem ----------------------------------------------------------特异变量号
号码:
6
使用方法:
*号码.1、*号码.2 ...
这个序列的变量只能再本批处理使用(如str号码.1、str号码.2 ...)
rem ----------------------------------------------------------特异变量号
rem ----------------------------------------------------------脚本说明
参数传递:
a,
b,
引用的变量:
a,
b,
生成的变量:
a,
b,
脚本功能:
a,
b,
rem ----------------------------------------------------------脚本说明 end