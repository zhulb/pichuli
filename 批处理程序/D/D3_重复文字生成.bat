@echo off
set D4_message="%~n0"
set D4_pathmb="%~dp0"
set D4_pathmb=%D4_pathmb:~0,-4%
pushd %D4_pathmb%
::主代码
rem ----------------------------------------------------------主代码
set /p D3_str1=输入文字: 
set /p D3_num1=输入重复次数: 
cls
if "%D3_str1%"=="" (
echo,输入错误!
ping /n 2 127.1>nul
goto exit
)
if "%D3_num1%"=="" (
echo,输入错误!
ping /n 2 127.1>nul
goto exit
)
for /l %%i in (1,1,%D3_num1%) do (
echo,%D3_str1%
)
pause>nul
goto exit
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