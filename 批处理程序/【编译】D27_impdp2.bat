@echo off
rem ----------------------------------------------------------������
if not exist D27_��ʱ�ļ��� (
md D27_��ʱ�ļ���
)
set D27_num=1
for %%i in (zjdms zjucap zjcore zjcmis zjmail zjodps zjzhbg) do (
call :D25_main %%i
)
pause
exit
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:D25_main
cls
echo,���ڵ����%D27_num%��(��7)%1.dmp...
echo,һ��ɾ���û�
echo,1�������ؽ��û�sql�ļ�
(echo,drop user %1 cascade;
echo,create user %1 identified by %1 default tablespace zhbg;
echo,grant connect,resource to %1;
echo,grant dba to %1;
echo,exit;
)>D27_��ʱ�ļ���\D27_dropUser.sql
echo,2��ִ��sql���ؽ��û�
sqlplus sys/orcl as sysdba@orcl @D27_��ʱ�ļ���\D27_dropUser.sql
echo,���������ļ�
echo,1��ɾ�����ĵ�
if exist D:\oracle10g\admin\orcl\dpdump\%1.dmp (
del D:\oracle10g\admin\orcl\dpdump\%1.dmp
)
echo,2�������ļ�
copy "%~dp0""%~1".dmp D:\oracle10g\admin\orcl\dpdump
echo,���������ļ�(�������)...
::1>nul 2>nul @impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
impdp %1/%1 dumpfile=%1.dmp logfile=%1.log
set /a D27_num=%D27_num%+1
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
rem ----------------------------------------------------------������ end
::������ end
