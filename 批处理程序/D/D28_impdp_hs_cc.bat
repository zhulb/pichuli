@echo off
pushd ..
popd
set D28_message="%~n0"
set D28_pathmb="%~dp0"
set D28_pathmb=%D28_pathmb:~0,-4%
pushd %D28_pathmb%
::������
rem ----------------------------------------------------------������
:D28_start

ping /n 127.1>nul
echo,��½��֤...(������z)
setlocal EnableDelayedExpansion
echo,z|choice /c abcdefghijklmnopqrstuvwxyz>nul
echo,%errorlevel%
endlocal
echo,%errorlevel%
if not "%errorlevel%"=="26" (
	goto D28_start
)

cls
for /l %%i in (1,1,1) do (
	call :D28_speak
)
echo,
echo,Oracle���ݿ���������dmp�ļ�

echo,˵����1��dmp�ļ����������������ļ���
echo,      2���ļ���ֻ�������õ��е�����
echo,�밴�������ʼ
pause>nul

if not exist D28_��ʱ�ļ��� (
	md D28_��ʱ�ļ���
)
cd.>D28_��ʱ�ļ���\��־.txt


rem �������ļ�����
call a\a26_dpdump.bat D28_Oracle.directory 1
cls
rem set D28_Oracle.directory=D:\oracle10g\admin\orcl\dpdump
set D28_Oracle.dbaName=sys
set D28_Oracle.dbaPwd=orcl
set D28_Oracle.dbaDatabase=orcl

rem �����û���Ϣ
call a\a18_SimpleTable.bat "%~0" ::D28_userdata D28_users
echo,%users.list[]%



rem �û�ѡ��Ҫ������ļ�
for /l %%i in (1,1,%D28_users.list[]%) do (
	call :D28_STRING.show %%i %%D28_users.list[%%i].name%%
)
echo,������Ҫ������û�
echo,��[]  ����1 2 3 4(ע�⣺��Ҫ�ظ�)
set /p D28_string$=

rem ����dmp�ļ�

set D28_string=
for /l %%i in (1,1,%D28_users.list[]%) do (
	call :D28_String.append %%i
)

set D28_num=1
for %%i in (%D28_string$%) do (
	call :D28_ORACLE.impdp %%D28_users.list[%%i].name%% %%D28_users.list[%%i].pwd%% %%D28_users.list[%%i].database%% %%D28_users.list[%%i].tablespace%%
)

pause
exit
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:D28_STRING.show
echo,%1��%2
goto :eof

:D28_speak
rem mshta vbscript:createobject("sapi.spvoice").speak("��ӭʹ�� and merry christmas and happy new year!")(window.close)
rem mshta vbscript:createobject("sapi.spvoice").speak("��С��")(window.close)
goto :eof




:D28_String.append

if "%D28_string%"=="" (
	set D28_string=%1
) else (
	set D28_string=%D28_string% %1
)
goto :eof

:D28_ORACLE.impdp
ping /n 4 127.1>nul
cls
echo,���ڵ����%D28_num%��(��%D28_user.count%)%1.dmp...
if not exist "%~dp0""%~1".dmp (
	>>D28_��ʱ�ļ���\��־.txt echo,%1.dmp�ļ�������
	echo,��ʾ���ļ�������---%1.dmp
	echo,��鿴��־�ļ�!
	ping /n 2 127.1>nul
	goto :eof
)
echo,һ��ɾ���û�
echo,1�������ؽ��û�sql�ļ�
(echo,drop user %1 cascade;
echo,create user %1 identified by %1 default tablespace zhbg;
echo,grant connect,resource to %1;
echo,grant dba to %1;
echo,exit;
)>D28_��ʱ�ļ���\D28_dropUser.sql
echo,2��ִ��sql���ؽ��û�
sqlplus sys/orcl as sysdba@orcl @D28_��ʱ�ļ���\D28_dropUser.sql
echo,���������ļ�
echo,1��ɾ�����ĵ�
if exist %D28_Oracle.directory%\%1.dmp (
	del %D28_Oracle.directory%\%1.dmp
)
echo,2�������ļ�
copy "%~dp0""%~1".dmp %D28_Oracle.directory%
echo,���������ļ�(�������)...
::1>nul 2>nul @impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
impdp %1/%2 dumpfile=%1.dmp logfile=%1.log
set /a D28_num=%D28_num%+1
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

rem �����ļ�����
rem �û���
::D28_userdata
name;pwd;database;tablespace
hs_cc;hs_cc;orcl;cc
::D28_userdata_end

rem ----------------------------------------------------------������ end
::������ end