@echo off

rem һ�����÷���
rem call a18_SimpleTable.bat [���������ļ���·��] ::[��ǩ] [�����õı���]
rem 

rem ��������ʹ��
rem %���ձ���.list[]%��ʾ���ݵ�����
rem %���ձ���.list[m].����%��ʾ��m��ĳ�е�����

call a18_SimpleTable.bat "%~0" ::a18_userData user
echo,%user.list[]%
for /l %%i in (1,1,%user.list[]%) do (
	call :echo %%user.list[%%i].tablespace%%
)
pause>nul
:echo
echo,%*
goto :eof

rem �������ݸ�ʽ
rem 
rem ::��ǩ
rem title--->��������
rem ����
rem ::��ǩ_end
rem 

::a18_userData
name;pwd;database;tablespace
zjdms;zjdms;orcl;zhbg
zjucap;zjucap;orcl;zhbg
zjcore;zjcore;orcl;zhbg
zjcmis;zjcmis;orcl;zhbg
zjmail;zjmail;orcl;zhbg
zjodps;zjodps;orcl;zhbg
zjzhbg;zjzhbg;orcl;zhbg
::a18_userData_end
:main
echo,%1!%2!%3
pause