@echo off
set D19_message="%~n0"
set D19_pathmb="%~dp0"
set D19_pathmb=%D19_pathmb:~0,-4%
pushd %D19_pathmb%
::������
rem ----------------------------------------------------------������
:begin
cls
if not exist D19_��ʱ�ļ��� (
	md D19_��ʱ�ļ���
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
echo,&echo,---------------------------�������
echo,[��]zjdms/zjdms@orcl
rem set /p commend=
set commend=zjdms/zjdms@orcl
cls
call a\a2_��ȡ·��.bat 1 1 0 1
:begin2
echo,һ��ɾ��ԭ�еı�...
set d19_act=
set i=1
cd.>D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql
for /f "usebackq tokens=*" %%i in ("%~0") do (
	if "%%~i"=="::ɾ�����б�sql end" goto :d19_next
	if defined d19_act (
		set D19_sql=%%i
		call :D19_main1
	)
	if "%%~i"=="::ɾ�����б�sql" set d19_act=act
)
:d19_next
sqlplus / as sysdba@orcl @D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql
>D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql echo,conn zjdms/zjdms;
for /f "usebackq tokens=1,2,*" %%i in ("D19_��ʱ�ļ���\D19_ɾ�����б�sql.txt") do (
	if %%i==drop (
		>>D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql echo,%%i %%j %%k
	)
)
>>D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql echo,exit;
sqlplus / as sysdba@orcl @D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql
echo,��������������...
pushd c:\Users\Administrator
imp %commend% file="%a2_pathly%" full=y
popd
echo,��ɣ������������
pause>nul
goto :begin 
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:D19_main1
call a\a7_��������1.bat 1 1 D19_sql 100
if "%i%"=="2" (
	>>D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql echo,%D19_sql% "D19_��ʱ�ļ���\D19_ɾ�����б�sql.txt"
) else (
	>>D19_��ʱ�ļ���\D19_ɾ�����б�sql.sql echo,%D19_sql%
)
set /a i=%i%+1
goto :eof
::����1 end
::����2

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
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit

::ɾ�����б�sql
conn zjdms/zjdms;
spool 
select 'drop table '||table_name||';' from all_tables where owner='zjdms';
spool off;
exit;
::ɾ�����б�sql end
rem ----------------------------------------------------------������ end
::������ end
