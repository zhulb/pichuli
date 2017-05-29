%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a 
cls
@echo off
rem ----------------------------------------------------------主代码
rem expdp zjdms/zjdms@orcl directory=data_pump_dir dumpfile=zjdms.dmp
echo,
echo,Oracle数据库批量导出用户数据
echo,说明：1、dmp文件将在当前文件夹生成
echo,请按任意键继续
pause>nul
if not exist D32_临时文件夹 (
md D32_临时文件夹
)
cd.>D32_临时文件夹\日志.txt
set D32_Oracle.directory=D:\oracle10g\admin\orcl\dpdump
set D32_Oracle.dbaName=sys
set D32_Oracle.dbaPwd=orcl
set D32_Oracle.dbaDatabase=orcl
rem 加载用户信息
set D32_user.count=0
set D32_User.load.action=
for /f "usebackq tokens=1,2,3,* delims=;" %%i in ("%~0") do (
if "%%~i"=="::D32_userData end" goto D32_User.load.end
if defined D32_User.load.action (
call :D32_User.load %%i %%j %%k %%l
)
if "%%~i"=="::D32_userData" set D32_User.load.action=on
)
:D32_User.load.end
rem 用户选择要导出的文件
for /l %%i in (1,1,%D32_user.count%) do (
call :D32_STRING.show %%i %%D32_user[%%i].name%%
)
echo,请输入要导入的用户
echo,例[]  输入1 2 3 4(注意：不要重复)
set /p D32_string$=
rem 导出oracle用户
set D32_string=
for /l %%i in (1,1,%D32_user.count%) do (
call :D32_String.append %%i
)
set D32_num=1
for %%i in (%D32_string$%) do (
call :D32_Oracle.expdp %%D32_user[%%i].name%% %%D32_user[%%i].pwd%% %%D32_user[%%i].database%% %%D32_user[%%i].tablespace%%
)
echo,完成
pause>nul
goto exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:D32_Oracle.expdp
cls
echo,正在导出第%D32_num%个(共%D32_user.count%)%1.dmp...
if exist %D32_Oracle.directory%\%1.dmp (
del %D32_Oracle.directory%\%1.dmp
)
expdp %1/%2@%3 directory=data_pump_dir dumpfile=%1.dmp
copy %D32_Oracle.directory%\%1.dmp "%~dp0"
set /a D32_num=%D32_num%+1
goto :eof
:D32_String.append
if "%D32_string%"=="" (
set D32_string=%1
) else (
set D32_string=%D32_string% %1
)
goto :eof
:D32_STRING.show
echo,%1、%2
goto :eof
:D32_User.load
set /a D32_user.count=%D32_user.count%+1
set D32_user[%D32_user.count%].name=%1
set D32_user[%D32_user.count%].pwd=%2
set D32_user[%D32_user.count%].database=%3
set D32_user[%D32_user.count%].tablespace=%4
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
::D32_userData
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
::D32_userData end
rem ----------------------------------------------------------主代码 end
::主代码 end 
