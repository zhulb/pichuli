@echo off
rem ----------------------------------------------------------������
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
set D28_Oracle.directory=D:\oracle10g\admin\orcl\dpdump
set D28_Oracle.dbaName=sys
set D28_Oracle.dbaPwd=orcl
set D28_Oracle.dbaDatabase=orcl
rem �����û���Ϣ
call :a18 "%~0" ::D28_userdata D28_users 
echo,%users.list[]%
rem �û�ѡ��Ҫ������ļ�
for /l %%i in (1,1,%D28_users.list[]%) do (
call :D28_STRING.show %%i %%D28_users.list[%%i].name%%
)
echo,������Ҫ������û�
echo,��[]  ����1 2 3 4(ע�⣺��Ҫ�ظ�)
set /p D28_string$=
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
::D28_userdata
name;pwd;database;tablespace
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
zjlog;zjlog;orcl;zhbg
::D28_userdata_end
rem ----------------------------------------------------------������ end
::������ end
:a18
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem �����ݱ��ȡ
rem һ����ĸ�ʽ
rem 
rem ::��ǩ
rem ����;����;����;����...
rem ����;����;����;����...
rem ...
rem ::��ǩ_end
rem 
rem ��������˵��
rem 1�����ݵ�����û�����ƣ��������ֻ����8��
rem 2�������в����������ַ�[^&%;|<>"]������ڴ洢���ġ����֡���ĸ����
rem 
rem 
rem �������÷���
rem call :a18 ���ļ���·�� ::��ǩ �������ݵı��� 
rem 
rem �ġ������÷�
rem ��������               %���ܱ���.list[]%
rem ��5�е�m�е�ֵ         %���ܱ���.list[5].����%
rem
rem �塢ʹ�÷�Χ
rem 8�����µı�ṹ��������Ϊ���ġ����֡���ĸ
rem 
rem ����ʹ������
rem a18_SimpleTableEp1.bat
rem 
set a18_Table.path="%~1"
set a18_Table.biaoqian=%2
set a18_Table.var=%3
set a18_Table.load=
set a18_Table.load.title=
set a18_Table.num=0
set a18_Table.columns[]=0
for /f "usebackq tokens=* delims=" %%i in (%a18_Table.path%) do (
if "%%~i"=="%a18_Table.biaoqian%_end" goto :a18_Table.loadend
if defined a18_Table.load (
call :a18_main %%i
)
if "%%~i"=="%a18_Table.biaoqian%" set a18_Table.load=on	
)
:a18_Table.loadend
set %a18_Table.var%.list[]=%a18_Table.num%
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
:a18_Table.loadcolumn
set /a a18_Table.columns[]=%a18_Table.columns[]%+1
set a18_Table.columns[%a18_Table.columns[]%]=%1
goto :eof
:a18_main
if not defined a18_Table.title (
set a18_Table.title=in
for %%i in (%*) do (
call :a18_Table.loadcolumn %%i
)
goto :eof
)
set /a a18_Table.num=%a18_Table.num%+1
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[1]%=%1
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[2]%=%2
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[3]%=%3
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[4]%=%4
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[5]%=%5
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[6]%=%6
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[7]%=%7
set %a18_Table.var%.list[%a18_Table.num%].%a18_Table.columns[8]%=%8
goto :eof
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
rem ----------------------------------------------------------������ end
::������ end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:������
���ļ������� ��:
���ļ�����   ��:
������˵��   ��:
%1��%2����������
::����˵�� end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
