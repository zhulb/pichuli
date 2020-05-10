@echo off
set D21_message="%~n0"
set D21_pathmb="%~dp0"
set D21_pathmb=%D21_pathmb:~0,-4%
pushd %D21_pathmb%
::主代码
rem ----------------------------------------------------------主代码
:begin
cls
if not exist D21_临时文件夹 (
	md D21_临时文件夹
)
echo,&echo,--------------------------按任意键确认备份
pause>null
set D21_act=
set i=1
cd.>D21_临时文件夹\D21_获取所有表sql.sql
for /f "usebackq tokens=*" %%i in ("%~0") do (
	if "%%~i"=="::获取所有表sql end" goto :D21_next
	if defined D21_act (
		set D21_sql=%%i
		call :D21_main1
	)	
	if "%%~i"=="::获取所有表sql" set D21_act=act
)
:D21_next
>>D21_临时文件夹\D21_获取所有表sql.sql echo,exit;
sqlplus / as sysdba@orcl @D21_临时文件夹\D21_获取所有表sql.sql
set D21_tables=
set D21_flag=
for /f "tokens=1,* delims= " %%i in (D21_临时文件夹\D21_获取所有表sql.txt) do (
	if "%%~i"=="table" (
		call :D21_main2 %%j
	)
)
pushd c:\Users\Administrator
exp zjdms/zjdms@orcl tables=(%D21_tables%) file=d:\zjdms%date:~2,2%%date:~5,2%%date:~8,2%.dmp
popd
echo,完成，按任意键继续
pause>null
goto :exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:D21_main1
call a\a7_变量处理1.bat 1 1 D21_sql 100
if "%i%"=="2" (
	>>D21_临时文件夹\D21_获取所有表sql.sql echo,%D21_sql% "D21_临时文件夹\D21_获取所有表sql.txt"
) else (
	>>D21_临时文件夹\D21_获取所有表sql.sql echo,%D21_sql%
)
set /a i=%i%+1
goto :eof
::函数1 end
::函数2
:D21_main2
if not defined D21_flag (
	set D21_tables=%1
	set D21_flag=flag
) else (
	set D21_tables=%D21_tables%,%1
)
goto :eof
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
::获取所有表sql
conn zjdms/zjdms;
spool
select 'table '||table_name from all_tables where owner='ZJDMS';
spool off;
exit;
::获取所有表sql end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------主代码 end
::主代码 end
