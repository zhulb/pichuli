@echo off
set D21_message="%~n0"
set D21_pathmb="%~dp0"
set D21_pathmb=%D21_pathmb:~0,-4%
pushd %D21_pathmb%
::������
rem ----------------------------------------------------------������
:begin
cls
if not exist D21_��ʱ�ļ��� (
	md D21_��ʱ�ļ���
)
echo,&echo,--------------------------�������ȷ�ϱ���
pause>null
set D21_act=
set i=1
cd.>D21_��ʱ�ļ���\D21_��ȡ���б�sql.sql
for /f "usebackq tokens=*" %%i in ("%~0") do (
	if "%%~i"=="::��ȡ���б�sql end" goto :D21_next
	if defined D21_act (
		set D21_sql=%%i
		call :D21_main1
	)	
	if "%%~i"=="::��ȡ���б�sql" set D21_act=act
)
:D21_next
>>D21_��ʱ�ļ���\D21_��ȡ���б�sql.sql echo,exit;
sqlplus / as sysdba@orcl @D21_��ʱ�ļ���\D21_��ȡ���б�sql.sql
set D21_tables=
set D21_flag=
for /f "tokens=1,* delims= " %%i in (D21_��ʱ�ļ���\D21_��ȡ���б�sql.txt) do (
	if "%%~i"=="table" (
		call :D21_main2 %%j
	)
)
pushd c:\Users\Administrator
exp zjdms/zjdms@orcl tables=(%D21_tables%) file=d:\zjdms%date:~2,2%%date:~5,2%%date:~8,2%.dmp
popd
echo,��ɣ������������
pause>null
goto :exit
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:D21_main1
call a\a7_��������1.bat 1 1 D21_sql 100
if "%i%"=="2" (
	>>D21_��ʱ�ļ���\D21_��ȡ���б�sql.sql echo,%D21_sql% "D21_��ʱ�ļ���\D21_��ȡ���б�sql.txt"
) else (
	>>D21_��ʱ�ļ���\D21_��ȡ���б�sql.sql echo,%D21_sql%
)
set /a i=%i%+1
goto :eof
::����1 end
::����2
:D21_main2
if not defined D21_flag (
	set D21_tables=%1
	set D21_flag=flag
) else (
	set D21_tables=%D21_tables%,%1
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
conn zjdms/zjdms;
spool
select 'table '||table_name from all_tables where owner='ZJDMS';
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
