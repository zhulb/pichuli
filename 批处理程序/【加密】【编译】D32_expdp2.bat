%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a 
cls
@echo off
rem ----------------------------------------------------------������
rem expdp zjdms/zjdms@orcl directory=data_pump_dir dumpfile=zjdms.dmp
echo,
echo,Oracle���ݿ����������û�����
echo,˵����1��dmp�ļ����ڵ�ǰ�ļ�������
echo,�밴���������
pause>nul
if not exist D32_��ʱ�ļ��� (
md D32_��ʱ�ļ���
)
cd.>D32_��ʱ�ļ���\��־.txt
set D32_Oracle.directory=D:\oracle10g\admin\orcl\dpdump
set D32_Oracle.dbaName=sys
set D32_Oracle.dbaPwd=orcl
set D32_Oracle.dbaDatabase=orcl
rem �����û���Ϣ
set D32_user.count=0
set D32_User.load.action=
for /f "usebackq tokens=1,2,3,* delims=;" %%i in ("%~0") do (
if "%%~i"=="::D32_userData end" goto D32_User.load.end
if defined D32_User.load.action (
call :D32_User.load %%i %%j %%k %%l
)
if "%%~i"=="::D32_userData" set D32_User.load.action=on
)
:D32_User.load.end
rem �û�ѡ��Ҫ�������ļ�
for /l %%i in (1,1,%D32_user.count%) do (
call :D32_STRING.show %%i %%D32_user[%%i].name%%
)
echo,������Ҫ������û�
echo,��[]  ����1 2 3 4(ע�⣺��Ҫ�ظ�)
set /p D32_string$=
rem ����oracle�û�
set D32_string=
for /l %%i in (1,1,%D32_user.count%) do (
call :D32_String.append %%i
)
set D32_num=1
for %%i in (%D32_string$%) do (
call :D32_Oracle.expdp %%D32_user[%%i].name%% %%D32_user[%%i].pwd%% %%D32_user[%%i].database%% %%D32_user[%%i].tablespace%%
)
echo,���
pause>nul
goto exit
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:D32_Oracle.expdp
cls
echo,���ڵ�����%D32_num%��(��%D32_user.count%)%1.dmp...
if exist %D32_Oracle.directory%\%1.dmp (
del %D32_Oracle.directory%\%1.dmp
)
expdp %1/%2@%3 directory=data_pump_dir dumpfile=%1.dmp
copy %D32_Oracle.directory%\%1.dmp "%~dp0"
set /a D32_num=%D32_num%+1
goto :eof
:D32_String.append
if "%D32_string%"=="" (
set D32_string=%1
) else (
set D32_string=%D32_string% %1
)
goto :eof
:D32_STRING.show
echo,%1��%2
goto :eof
:D32_User.load
set /a D32_user.count=%D32_user.count%+1
set D32_user[%D32_user.count%].name=%1
set D32_user[%D32_user.count%].pwd=%2
set D32_user[%D32_user.count%].database=%3
set D32_user[%D32_user.count%].tablespace=%4
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
::D32_userData
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
::D32_userData end
rem ----------------------------------------------------------������ end
::������ end 
