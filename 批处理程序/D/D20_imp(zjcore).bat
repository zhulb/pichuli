@echo off
set D20_message="%~n0"
set D20_pathmb="%~dp0"
set D20_pathmb=%D20_pathmb:~0,-4%
pushd %D20_pathmb%
::主代码
rem ----------------------------------------------------------主代码
:begin
cls
if not exist D20_临时文件夹 (
	md D20_临时文件夹
)
echo,&echo,---------------------------输入命令：
echo,[例]zjcore/zjcore@orcl
rem set /p commend=
set commend=zjcore/zjcore@orcl
cls
call a\a2_获取路径.bat 1 1 0 1
echo,一、删除原有的表...
set D20_act=
set i=1
cd.>D20_临时文件夹\D20_删除所有表sql.sql
for /f "usebackq tokens=*" %%i in ("%~0") do (
	if "%%~i"=="::删除所有表sql end" goto :D20_next
	if defined D20_act (
		set D20_sql=%%i
		call :D20_main1
	)
	if "%%~i"=="::删除所有表sql" set D20_act=act
)
:D20_next
sqlplus / as sysdba@orcl @D20_临时文件夹\D20_删除所有表sql.sql
>D20_临时文件夹\D20_删除所有表sql.sql echo,conn zjcore/zjcore;
for /f "usebackq tokens=1,2,*" %%i in ("D20_临时文件夹\D20_删除所有表sql.txt") do (
	if %%i==drop (
		>>D20_临时文件夹\D20_删除所有表sql.sql echo,%%i %%j %%k
	)
)
>>D20_临时文件夹\D20_删除所有表sql.sql echo,exit;
sqlplus / as sysdba@orcl @D20_临时文件夹\D20_删除所有表sql.sql
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
:D20_main1
call a\a7_变量处理1.bat 1 1 D20_sql 100
if "%i%"=="2" (
	>>D20_临时文件夹\D20_删除所有表sql.sql echo,%D20_sql% "D20_临时文件夹\D20_删除所有表sql.txt"
) else (
	>>D20_临时文件夹\D20_删除所有表sql.sql echo,%D20_sql%
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
::删除所有表sql
conn zjcore/zjcore;
spool 
select 'drop table '||table_name||';' from all_tables where owner='ZJCORE';
spool off;
exit;
::删除所有表sql end
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------主代码 end
::主代码 end
