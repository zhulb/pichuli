@echo off
set D11_message="%~n0"
set D11_pathmb="%~dp0"
set D11_pathmb=%D11_pathmb:~0,-4%
pushd %D11_pathmb%
::主代码
rem ----------------------------------------------------------主代码
set message=解压文件夹及子文件夹内所有压缩文件
:D11_begin
cls
set D11_passward=
set /p D11_passward=passward: 
call a\a2_获取路径.bat 1 1 0 1
call a\a10_路径判断2.bat 1 1 a2_pathly
if "%a10_result%"=="wj" (
cls
echo,
echo,路径是文件!
ping /n 2 127.1>nul
goto D11_begin
)
if defined D11_passward (
call :D11_main1
)else (
call :D11_main2
)
goto D11_begin
::一层c
rem ----------------------------------------------------------一层c
:D11_main1
for /f "tokens=*" %%i in ('dir/b/a-d/s "%a2_pathly%\*.rar"') do (
set D11_pathly="%%~i"
set D11_pathmb="%%~dpi"
call :D11_main1.1
)
goto :eof
:D11_main2
for /f "tokens=*" %%i in ('dir/b/a-d/s "%a2_pathly%\*.rar"') do (
set D11_pathly="%%~i"
set D11_pathmb="%%~dpi"
call :D11_main2.1
)
goto :eof
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
:D11_main1.1
call a\a4_解压文件2.bat 1 1 D11_pathly D11_pathmb D11_passward
goto :eof
:D11_main2.1
call a\a3_解压文件1.bat 1 1 D11_pathly D11_pathmb
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
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:解压
【文件名称   】:解压文件夹内所有压缩文件
::属性说明 end
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
rem ----------------------------------------------------------主代码 end
::主代码 end