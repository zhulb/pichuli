@echo off
set D20_message="%~n0"
set D20_pathmb="%~dp0"
set D20_pathmb=%D20_pathmb:~0,-4%
pushd %D20_pathmb%
::������
rem ----------------------------------------------------------������
:begin
cls
if not exist D20_��ʱ�ļ��� (
	md D20_��ʱ�ļ���
)
echo,&echo,---------------------------�������
echo,[��]zjcore/zjcore@orcl
rem set /p commend=
set commend=zjcore/zjcore@orcl
cls
call a\a2_��ȡ·��.bat 1 1 0 1
echo,һ��ɾ��ԭ�еı�...
set D20_act=
set i=1
cd.>D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql
for /f "usebackq tokens=*" %%i in ("%~0") do (
	if "%%~i"=="::ɾ�����б�sql end" goto :D20_next
	if defined D20_act (
		set D20_sql=%%i
		call :D20_main1
	)
	if "%%~i"=="::ɾ�����б�sql" set D20_act=act
)
:D20_next
sqlplus / as sysdba@orcl @D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql
>D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql echo,conn zjcore/zjcore;
for /f "usebackq tokens=1,2,*" %%i in ("D20_��ʱ�ļ���\D20_ɾ�����б�sql.txt") do (
	if %%i==drop (
		>>D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql echo,%%i %%j %%k
	)
)
>>D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql echo,exit;
sqlplus / as sysdba@orcl @D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql
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
:D20_main1
call a\a7_��������1.bat 1 1 D20_sql 100
if "%i%"=="2" (
	>>D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql echo,%D20_sql% "D20_��ʱ�ļ���\D20_ɾ�����б�sql.txt"
) else (
	>>D20_��ʱ�ļ���\D20_ɾ�����б�sql.sql echo,%D20_sql%
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
::ɾ�����б�sql
conn zjcore/zjcore;
spool 
select 'drop table '||table_name||';' from all_tables where owner='ZJCORE';
spool off;
exit;
::ɾ�����б�sql end
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------������ end
::������ end
