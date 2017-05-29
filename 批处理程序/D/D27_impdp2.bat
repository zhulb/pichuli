@echo off
pushd ..
popd
set D27_message="%~n0"
set D27_pathmb="%~dp0"
set D27_pathmb=%D27_pathmb:~0,-4%
pushd %D27_pathmb%
::主代码
rem ----------------------------------------------------------主代码

if not exist D27_临时文件夹 (
	md D27_临时文件夹
)
set D27_num=1
for %%i in (zjdms zjucap zjcore zjcmis zjmail zjodps zjzhbg) do (
	call :D27_Oracle.impdp %%i
)
pause
exit
::一层c
rem ----------------------------------------------------------一层c
::函数1

:D27_Oracle.impdp
cls
echo,正在导入第%D27_num%个(共7)%1.dmp...
echo,一、删除用户
echo,1、生成重建用户sql文件
(echo,drop user %1 cascade;
echo,create user %1 identified by %1 default tablespace zhbg;
echo,grant connect,resource to %1;
echo,grant dba to %1;
echo,exit;
)>D27_临时文件夹\D27_dropUser.sql
echo,2、执行sql，重建用户
sqlplus sys/orcl as sysdba@orcl @D27_临时文件夹\D27_dropUser.sql
echo,二、拷贝文件
echo,1、删除旧文档
if exist D:\oracle10g\admin\orcl\dpdump\%1.dmp (
	del D:\oracle10g\admin\orcl\dpdump\%1.dmp
)
echo,2、拷贝文件
copy "%~dp0""%~1".dmp D:\oracle10g\admin\orcl\dpdump
echo,三、导入文件(屏蔽输出)...
::1>nul 2>nul @impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
set /a D27_num=%D27_num%+1
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
rem ----------------------------------------------------------主代码 end
::主代码 end
