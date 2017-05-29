@echo off
set D19_message="%~n0"
set D19_pathmb="%~dp0"
set D19_pathmb=%D19_pathmb:~0,-4%
pushd %D19_pathmb%
::主代码
rem ----------------------------------------------------------主代码
:begin
cls
if not exist D19_临时文件夹 (
	md D19_临时文件夹
)
if not "%*"=="" (
	if defined D19_flag goto :begin3
	set D19_flag=flag
	echo,%*
	set commend=zjdms/zjdms@orcl
	set a2_pathly=%*
	set %*=
	echo,%*
	goto :begin2
)
:begin3
echo,&echo,---------------------------输入命令：
echo,[例]zjdms/zjdms@orcl
rem set /p commend=
set commend=zjdms/zjdms@orcl
cls
call a\a2_获取路径.bat 1 1 0 1
:begin2
echo,一、删除原有的表...
set d19_act=
set i=1
cd.>D19_临时文件夹\D19_删除所有表sql.sql
for /f "usebackq tokens=*" %%i in ("%~0") do (
	if "%%~i"=="::删除所有表sql end" goto :d19_next
	if defined d19_act (
		set D19_sql=%%i
		call :D19_main1
	)
	if "%%~i"=="::删除所有表sql" set d19_act=act
)
:d19_next
sqlplus / as sysdba@orcl @D19_临时文件夹\D19_删除所有表sql.sql
>D19_临时文件夹\D19_删除所有表sql.sql echo,conn zjdms/zjdms;
for /f "usebackq tokens=1,2,*" %%i in ("D19_临时文件夹\D19_删除所有表sql.txt") do (
	if %%i==drop (
		>>D19_临时文件夹\D19_删除所有表sql.sql echo,%%i %%j %%k
	)
)
>>D19_临时文件夹\D19_删除所有表sql.sql echo,exit;
sqlplus / as sysdba@orcl @D19_临时文件夹\D19_删除所有表sql.sql
echo,二、导入新数据...
pushd c:\Users\Administrator
imp %commend% file="%a2_pathly%" full=y
popd
echo,完成，按任意键继续
pause>nul
goto :begin 
::一层c
rem ----------------------------------------------------------一层c
::函数1
:D19_main1
call a\a7_变量处理1.bat 1 1 D19_sql 100
if "%i%"=="2" (
	>>D19_临时文件夹\D19_删除所有表sql.sql echo,%D19_sql% "D19_临时文件夹\D19_删除所有表sql.txt"
) else (
	>>D19_临时文件夹\D19_删除所有表sql.sql echo,%D19_sql%
)
set /a i=%i%+1
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

::删除所有表sql
conn zjdms/zjdms;
spool 
select 'drop table '||table_name||';' from all_tables where owner='zjdms';
spool off;
exit;
::删除所有表sql end
rem ----------------------------------------------------------主代码 end
::主代码 end
