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
if not exist 信息提取结果 md 信息提取结果
set /p str4.1=标签名称: 
if not exist 信息提取结果\%str4.1% md 信息提取结果\%str4.1%
call 路径处理\获取路径.bat 1 1
call 判断路径是文件还是文件夹\判断路径是文件还是文件夹.bat 1 0
if "%result%"=="wj" (
echo,
echo,目标是文件!
ping /n 2 127.1>nul
goto begin
)
set num=1
cd.>信息提取结果\%str4.1%\%str4.1%.zlb
for /f "tokens=*" %%i in ('dir /b/s "%pathly%\*.bat"') do (
set pathly="%%~i"
call :main
)
ping /n 2 127.1>nul
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
set act=
set act2=
set act3=
echo,%num%
>>信息提取结果\%str4.1%\%str4.1%.zlb echo,%num% %pathly%
set /a num=%num%+1
for /f "usebackq tokens=* delims=" %%i in (%pathly%) do (
>信息提取结果\%str4.1%\临时文件.zlb echo,%%i
call :main2
if defined act2 goto :finish
if defined act3 (
>>信息提取结果\%str4.1%\%str4.1%.zlb echo,%%i
)
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
:main2
for /f "tokens=1,* delims=-" %%i in (信息提取结果\%str4.1%\临时文件.zlb) do (
if "%%j"=="%str4.1% end" set act2=on
if defined act set act3=on
if "%%j"=="%str4.1%" set act=on
)
goto :eof
rem ----------------------------------------------------------二层call end
rem ----------------------------------------------------------特异变量号
号码:
4
使用方法:

rem ----------------------------------------------------------特异变量号 end
rem ----------------------------------------------------------信息提取结果\%str4.1%\%str4.1
rem ----------------------------------------------------------信息提取结果\%str4.1%\%str4.1 end