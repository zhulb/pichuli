@echo off
set pathly="%~0"
set act=on
(2>nul call 路径处理\路径处理3.bat 1 1)||(echo,&echo,缺少文件"路径处理\路径处理3.bat"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="on" (
call :a
)else (
set act=on
)
:begin
cls
set act=on
(2>nul call 路径处理\获取路径4.bat 1 1)||(echo,&echo,缺少文件"路径处理\获取路径4.bat 1 1"&ping /n 4 127.1>nul&set act=off)
if "%act%"=="off" (
goto exit
)
rem ---------------从下面开始写代码
set str9.1=\
set pathly9.1="%pathly%"
(2>nul call 将变量按字符串拆分\将变量按字符串拆分.bat 1 0 pathly str9.1)||(echo,&echo,缺少文件"将变量按字符串拆分\将变量按字符串拆分.bat 1 0"&ping /n 4 127.1>nul&set act=off)
set str9.2=%date:~2,2%%date:~5,2%%date:~8,2%
cd.>临时文件.zlb
set act=
for /f "tokens=*" %%i in (将变量按字符串拆分\d.txt) do (
call :main
set str9.3=%%i
)
>>临时文件.zlb (set /p="%str9.2% %str9.3%" <nul)
for /f "tokens=*" %%i in (临时文件.zlb) do (
set str9.4=%%i
)
ren %pathly9.1% "%str9.2% %str9.3%"
echo,
echo,%pathly9.1%
echo,
echo,	to
echo,
echo,"%str9.4:标_记=%"
echo,
echo,完成重命名!
ping /n 4 127.1>nul
goto begin
rem ----------------------------------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------二层goto

rem ----------------------------------------------------------二层goto end
rem ----------------------------------------------------------一层call
:a
title %name%
set name=%name%
set message=^
&echo,"%name%"
goto :eof
:main
if defined act (
>>临时文件.zlb (set /p="标_记%str9.3%\" <nul)
)
set act=on
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------二层call

rem ----------------------------------------------------------二层call end
rem ----------------------------------------------------------特异变量号
号码:
9
使用方法:
*号码.1、*号码.2 ...
这个序列的变量只能再本批处理使用(如号码为1时，str1.1、str1.2 ...)
rem ----------------------------------------------------------特异变量号 end
rem ----------------------------------------------------------脚本说明
这是个走弯路的代码，但技巧性很高。
另一种方案是直接扩展的到的路径，会很方便。
rem ----------------------------------------------------------脚本说明 end