@echo off
set D22_message="%~n0"
set D22_pathmb="%~dp0"
set D22_pathmb=%D22_pathmb:~0,-4%
pushd %D22_pathmb%
::������
rem ----------------------------------------------------------������
:begin
cls
if not exist D22_��ʱ�ļ��� (
	md D22_��ʱ�ļ���
)
echo,&echo,--------------------------�������ȷ�ϱ���
pause>null
set D22_act=
set i=1
cd.>D22_��ʱ�ļ���\D22_��ȡ���б�sql.sql
for /f "usebackq tokens=*" %%i in ("%~0") do (
	if "%%~i"=="::��ȡ���б�sql end" goto :D22_next
	if defined D22_act (
		set D22_sql=%%i
		call :D22_main1
	)	
	if "%%~i"=="::��ȡ���б�sql" set D22_act=act
)
:D22_next
>>D22_��ʱ�ļ���\D22_��ȡ���б�sql.sql echo,exit;
sqlplus / as sysdba@orcl @D22_��ʱ�ļ���\D22_��ȡ���б�sql.sql
set D22_tables=
set D22_flag=
for /f "tokens=1,* delims= " %%i in (D22_��ʱ�ļ���\D22_��ȡ���б�sql.txt) do (
	if "%%~i"=="table" (
		call :D22_main2 %%j
	)
)
pushd c:\Users\Administrator
exp zjcore/zjcore@orcl tables=(%D22_tables%) file=d:\zjcore%date:~2,2%%date:~5,2%%date:~8,2%.dmp
popd
echo,��ɣ������������
pause>null
goto :exit
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:D22_main1
call a\a7_��������1.bat 1 1 D22_sql 100
if "%i%"=="2" (
	>>D22_��ʱ�ļ���\D22_��ȡ���б�sql.sql echo,%D22_sql% "D22_��ʱ�ļ���\D22_��ȡ���б�sql.txt"
) else (
	>>D22_��ʱ�ļ���\D22_��ȡ���б�sql.sql echo,%D22_sql%
)
set /a i=%i%+1
goto :eof
::����1 end
::����2
:D22_main2
if not defined D22_flag (
	set D22_tables=%1
	set D22_flag=flag
) else (
	set D22_tables=%D22_tables%,%1
)
goto :eof
::����2 end
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c end
::�Ĳ�c end
::���c
rem ----------------------------------------------------------���c
rem ----------------------------------------------------------���c end
::���c end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:����
���ļ������� ��:
���ļ�����   ��:
::����˵�� end
::��ȡ���б�sql
conn zjcore/zjcore;
spool
select 'table '||table_name from all_tables where owner='ZJCORE';
spool off;
exit;
::��ȡ���б�sql end
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------������ end
::������ end
