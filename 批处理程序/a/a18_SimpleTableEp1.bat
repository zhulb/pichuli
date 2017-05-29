@echo off

rem 一、调用方法
rem call a18_SimpleTable.bat [数据所在文件的路径] ::[标签] [接受用的变量]
rem 

rem 三、变量使用
rem %接收变量.list[]%表示数据的行数
rem %接收变量.list[m].列名%表示第m行某列的数据

call a18_SimpleTable.bat "%~0" ::a18_userData user
echo,%user.list[]%
for /l %%i in (1,1,%user.list[]%) do (
	call :echo %%user.list[%%i].name%%
)
pause>nul
:echo
echo,%*
goto :eof

rem 二、数据格式
rem 
rem ::标签
rem title--->保存列名
rem 数据
rem ::标签_end
rem 

::a18_userData
name;pwd;database;tablespace
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
::a18_userData_end
:main
echo,%1!%2!%3
pause