@echo off
rem ----------------------------------------------------------������
rem һ��������ʱ�ļ���
rem ɾ��ԭ����ʱ�ļ���
if exist D31_��ʱ�ļ��� (
	echo,y|(1>nul 2>nul rd /s D31_��ʱ�ļ���)
)
rem �����µ���ʱ�ļ���
if not exist D31_��ʱ�ļ��� (
	md D31_��ʱ�ļ���
)
rem ������־�ļ�
cd.>D31_��ʱ�ļ���\��־.txt
rem �������������������
rem 1������class�ļ���·��
set D31_UserSet.classdir=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes
rem 2�����ø����ļ������ļ���
set D31_UserSet.dir=D:\workspace\zj_zhbg_svn\
rem 3������Ҫ���µ��ļ�����
set D31_UserSet.fileType[1]=java
set D31_UserSet.fileType[2]=jsp
set D31_UserSet.fileType[3]=js
set D31_UserSet.fileType[].length=3
rem 4����ʼʱ�䡢����ʱ��
set /p D31_UserSet.startdate=���뿪ʼ����(2014/03/10)��
set /p D31_UserSet.enddate=�����������(2014/03/20)��
rem set D31_UserSet.startdate=2014/03/05
rem set D31_UserSet.enddate=2014/03/10
rem 5�������ļ�����ļ���
set D31_UserSet.targetDirectory=D31_��ʱ�ļ���\����
rem ����������ʾ
rem 1����ʾ
echo,��ʾ��������Ϣ
echo,�����ļ������ļ���
echo,%D31_UserSet.dir%
echo,�����������...
rem 2����ʾд����־
(echo,��ʾ��������Ϣ
echo,�����ļ������ļ���
echo,%D31_UserSet.dir%
echo,���������ʼ����...)>>D31_��ʱ�ļ���\��־.txt
echo,
pause>nul
rem �ġ����ڻ������ݷ�������������
rem 1����ȡ�ַ���  "�ļ���·��\*.java" "�ļ���·��\*.jsp" "�ļ���·��\*.js"
set D31_SysSet.dir=
for /l %%i in (1,1,%D31_UserSet.fileType[].length%) do (
	call :D31_SysSet.createDir "%%D31_UserSet.dir%%*.%%D31_UserSet.fileType[%%i]%%"
)
rem 2��������������
call :a23 %D31_UserSet.startdate% %D31_UserSet.enddate% D31_UserSet.Date 
rem ��ʾ�������䲢д����־
>>D31_��ʱ�ļ���\��־.txt set D31_UserSet.Date
set D31_UserSet.Date
echo,�밴���������...
pause>nul
rem �塢�����ļ�����
set D31_File.path=
set D31_File.createtime=
rem 1��ͳ��
set D31_tongji=0
rem for /f "tokens=*" %%a in ('dir /b/s %D31_SysSet.dir%') do (
rem 	call :D31_numadd
rem )
echo,���С�%D31_tongji%�����ļ���������
echo,�밴�������ʼ��
(echo,���С�%D31_tongji%�����ļ���������
echo,�밴�������ʼ��
)>>D31_��ʱ�ļ���\��־.txt
pause>nul
echo,�������У������ĵȺ�...
call :a25 D31_time.start 1 
rem 2������
for /f "tokens=*" %%a in ('dir /b/s %D31_SysSet.dir%') do (
	for /l %%i in (1,1,%D31_UserSet.Date.list[]%) do (
		call :D31_WenJian.copy "%%~ta" "%%~a" "%%D31_UserSet.Date.list[%%i]%%"
	)
)
rem ��������־�ļ�
echo,��ɣ�
echo,�����з��գ����²����������
(echo,��ɣ�
echo,�����з��գ����²����������
)>>D31_��ʱ�ļ���\��־.txt
call :a25 D31_time.end 1 
set /a D31_time=%D31_time.end%-%D31_time.start%
call :a32 %D31_time% 100 D31_time 
echo,�ܹ���ʱ��%D31_time%�룡
>>D31_��ʱ�ļ���\��־.txt echo,�ܹ���ʱ��%D31_time%�룡
start " " "D31_��ʱ�ļ���\��־.txt"
pause
exit
::һ��c
rem ----------------------------------------------------------һ��c
::����1
:D31_SysSet.createDir
if not defined D31_SysSet.dir (
	set D31_SysSet.dir=%1
) else (
	set D31_SysSet.dir=%D31_SysSet.dir% %1
)
goto :eof
:D31_WenJian.copy
set D31_File.Path="%~dp2"
set D31_File.createtime=%~1
set D31_File.createtime=%D31_File.createtime:~0,10%
set D31_File.createtime_=%3
if "%D31_File.createtime%"==%D31_File.createtime_% (
	echo,copy %2
	>>D31_��ʱ�ļ���\��־.txt echo,copy %2
	if not exist "%D31_UserSet.targetDirectory%\%D31_File.Path:~3% (
		md "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%
	)
	echo,-------------------------�����ļ�
	echo,��·������%2
	1>nul 2>nul copy %2 "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%&&(echo,�ļ����Ƴɹ�!&>>D31_��ʱ�ļ���\��־.txt echo,�ļ����Ƴɹ���)||(echo,�ļ�����ʧ��!&>>D31_��ʱ�ļ���\��־.txt echo,�ļ�����ʧ�ܣ�)
	rem call :D31_message
	rem �����java�ļ���������class�ļ�
	rem if "%~x2"==".java" copy
	if "%~x2"==".java" (
		echo,-------------------------����class�ļ�
		setlocal EnableDelayedExpansion
		set D31_WenJian.copy.classpath=%2
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%legislation=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%duty=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%odps=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%services=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%dms=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%cmis=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%mail=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%pt=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%office=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%core=D:\workspace\zj_zhbg_svn\WebRoot\WEB-INF\classes!
		for %%i in (!D31_WenJian.copy.classpath!) do (
			set D31_WenJian.copy.classfile="%%~dpi"
			set D31_WenJian.copy.classpath="%%~dpni".class
		)
		set D31_WenJian.copy.classfile=!D31_WenJian.copy.classfile:~3!
		echo,��·���� ��!D31_WenJian.copy.classpath!
		if not exist !D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile! (
			md "!D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile!
		)
		>>D31_��ʱ�ļ���\��־.txt echo,copy !D31_WenJian.copy.classpath!
		1>nul 2>nul copy !D31_WenJian.copy.classpath! "!D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile!"&&(echo,�ļ����Ƴɹ�!&>>D31_��ʱ�ļ���\��־.txt echo,�ļ����Ƴɹ���)||(echo,�ļ�����ʧ��!&>>D31_��ʱ�ļ���\��־.txt echo,�ļ�����ʧ�ܣ�)
		rem call :D31_message
		rem if !errorlevel!==0 (
		rem	echo,�ļ����Ƴɹ���
		rem ) else (
		rem 	>>D31_��ʱ�ļ���\��־.txt echo,copy !D31_WenJian.copy.classpath! "!D31_UserSet.targetDirectory!!D31_WenJian.copy.classfile!
		rem 	echo,�ļ�����ʧ�ܣ�
		rem )
		endlocal
	)
)
goto :eof
:D31_message
if %errorlevel%==0 (
	>>D31_��ʱ�ļ���\��־.txt echo,�ļ����Ƴɹ���
	echo,�ļ����Ƴɹ���
) else (
	>>D31_��ʱ�ļ���\��־.txt echo,�ļ�����ʧ�ܣ�
	echo,�ļ�����ʧ�ܣ�
)
goto :eof
:D31_numadd
set /a D31_tongji=%D31_tongji%+1
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
:a23
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem %1 ��ʼʱ�� 2012/03/04
rem %2 ����ʱ��	2013/03/05
rem %3 ������ ��a.list[]   a.list[1] a.list[2] ...
rem һ����ʼ����������������
if "%1"=="%2" (
set %3.list[]=1
set %3.list[1]=%1
goto :eof
)
rem ����
rem ���200������
set %3.list[]=1
set %3.list[1]=%1
set a23_end=
for /l %%i in (1,1,200) do (
	call :a23_check %3 %%i %2
	if defined a23_end (
		goto :a23_end
	)
)
:a23_end
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
:a23_check
set /a a23_nextnum=1+%2
call :a19 %1.list[%2] a23_nextdate 
set %1.list[%a23_nextnum%]=%a23_nextdate%
set %1.list[]=%a23_nextnum%
if "%a23_nextdate%"=="%3" (
	set a23_end=yes
)
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
:a25
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem ȱ��˵����
rem ����ĵ�ֻ��ʱ����Ϣ��û�а�������
rem ����Ǿ���0:0:0 00�İٷ�����(103��ʾ1.03��)
set a25_time=%time%
set /a a25_hour=%a25_time:~-11,2%+0
set a25_minite=%a25_time:~-8,2%
if %a25_minite% lss 10 (
	set a25_minite=%a25_minite:~-1%
)
set a25_second=%a25_time:~-5,2%
if %a25_second% lss 10 (
	set a25_second=%a25_second:~-1%
)
set a25_last=%a25_time:~-2,2%
if %a25_last% lss 10 (
	set a25_last=%a25_last:~-1%
)
set /a %1=100*60*60*%a25_hour%+100*60*%a25_minite%+100*%a25_second%+%a25_last%
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
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
:a32
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem �������㣬�ɱ���4λС��
rem 10�����ڵĳ���
rem 
rem %1��������%2���� %3��������ı���
set /a a32_num=10000*%1
set /a a32_result=%a32_num%/%2
call :a31 %a32_result% 4 %3 
call :a33 a32_ 1 
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
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
:a19
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem һ��ԭʼ���ݻ�ȡ
rem 1�����������ݸ�ֵ��
call :a19_getdate %%%1%%
rem 2���������ı�����
set a19_resultvar=%2
rem ������ȡ���ڻ�����Ϣ
set a19_date.year=%a19_date:~0,4%
set a19_date.month=%a19_date:~5,2%
set a19_date.day=%a19_date:~8,2%
rem 03--->3
if %a19_date.month% lss 10 (
	set a19_date.month=%a19_date:~6,1%
)
if %a19_date.day% lss 10 (
	set a19_date.day=%a19_date:~9,1%
)
rem ˵����
rem ��������set /a a19_date.month=%a19_date:~5,2%+0
rem ���ǵ�%a19_date:~5,2%Ϊ08ʱ�ᱨ��
rem ��set /a a=03+0���Եõ�3
rem ����set /a a=08+0�ᱨ��
rem ��year.isRuiNian
set /a a19_yuShu100=%a19_date.year% %% 100
set /a a19_yuShu400=%a19_date.year% %% 400
set /a a19_yuShu4=%a19_date.year% %% 4
rem 
if "%a19_yuShu100%"=="0" (
	if "%a19_yuShu400%"=="0" (
		set a19_date.year.isRuiNian=true
	) else (
		set a19_date.year.isRuiNian=false
	)
) else (
	if "%a19_yuShu4%"=="0" (
		set a19_date.year.isRuiNian=true
	) else (
		set a19_date.year.isRuiNian=false
	)
)
rem �����Ƿ�������ѡ���·���������
if "%a19_date.year.isRuiNian%"=="true" (
	set a19_date.month.list[1]=31
	set a19_date.month.list[2]=29
	set a19_date.month.list[3]=31
	set a19_date.month.list[4]=30
	set a19_date.month.list[5]=31
	set a19_date.month.list[6]=30
	set a19_date.month.list[7]=31
	set a19_date.month.list[8]=31
	set a19_date.month.list[9]=30
	set a19_date.month.list[10]=31
	set a19_date.month.list[11]=30
	set a19_date.month.list[12]=31
) else (
	
	set a19_date.month.list[1]=31
	set a19_date.month.list[2]=28
	set a19_date.month.list[3]=31
	set a19_date.month.list[4]=30
	set a19_date.month.list[5]=31
	set a19_date.month.list[6]=30
	set a19_date.month.list[7]=31
	set a19_date.month.list[8]=31
	set a19_date.month.list[9]=30
	set a19_date.month.list[10]=31
	set a19_date.month.list[11]=30
	set a19_date.month.list[12]=31
)
set a19_date.month.list[]=12
rem ��ȡ�������һ��
call :a20 a19_date.month.list[%a19_date.month%] a19_date.month.lastday 
if "%a19_date.month.lastday.truevalue%"=="%a19_date.day%" (
	set a19_nextdate.day=1
	if "%a19_date.month%"=="12" (
		set a19_nextdate.month=1
		set /a a19_nextdate.year=%a19_date.year%+1
	) else (
		set /a a19_nextdate.month=%a19_date.month%+1
		set /a a19_nextdate.year=%a19_date.year%
	)
) else (
	set /a a19_nextdate.day=%a19_date.day%+1
	set /a a19_nextdate.month=%a19_date.month%
	set /a a19_nextdate.year=%a19_date.year%
)
rem 4--->04
if %a19_nextdate.month% lss 10 (
	set a19_nextdate.month=0%a19_nextdate.month%
)
if %a19_nextdate.day% lss 10 (
	set a19_nextdate.day=0%a19_nextdate.day%
)
set %a19_resultvar%=%a19_nextdate.year%/%a19_nextdate.month%/%a19_nextdate.day%
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
:a19_getdate
set a19_date=%1
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
:a31
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem ˵��
rem ��һ���������С��(����С��������)
rem �൱�ڳ�����ֻ��������Ϊ10��100��1000��... 
rem 
rem %1��Ҫ���������  %2��С���������ƶ���Ϊ��  %3���洦�����ı���
rem 
set /a a31_num=1000000000+%1
set a31_pianyiliang=%2
call :a31_setFirstValue %%a31_num:~1,-%a31_pianyiliang%%%.%%a31_num:~-%a31_pianyiliang%%%
:start
for /f "tokens=*" %%i in ('echo,%a31_num%^|findstr "^0[0-9]"') do (
	set a31_num=%a31_num:~1%
	goto :start
)
set %3=%a31_num%
rem ��ջ�������
for /f "tokens=1" %%i in ('set a31_') do (
	set %%i=
)
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
:a31_setFirstValue
set a31_num=%1
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
:a33
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem ���xxx��ͷ�Ļ�������
rem %1�����Ŀ�ͷ�ַ���  %2������
for /f "tokens=1 delims==" %%i in ('set %1') do (
	set %%i=
)
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
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
:a20
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem һ�����ô���������Խ�һ��������ֵ��ֵ������һ������
rem     ���⣬Ҳ���ԾͰ��Ǹ�������ֵ��ֵ������Ȼ��ֵ������ʾ��������ض���
rem 
rem ��������1��ʾ������ֵ�ı������ƣ�����2��ʾ����ֵ�ı�����
rem 
rem �������÷�ʽ
rem 
rem �ġ�����ֵʹ�÷���
rem %���ܱ�����.showvalue%���������������������ֵ��ֵ�е������������ת�崦��
rem %���ܱ�����.truevalue%, ��������ԭ����ֵ
rem 
rem �塢�����ֲ�
rem 1����ʾ�����ض�����������ŵĻ�������
rem 2����������ֵ������һ������
rem 
rem ����ԭ�����
rem ����call��˫����չ����������ʵ��ֻ��Ҫ����������Ϊ��������Ϳ���ȡ�ñ���ֵ���ŵ��Ǽ򻯴�����д��ȱ����Ч�ʽϵ�(call��������α�����չ)�����Ҫ���Ч�ʣ����Բο����ļ���������
rem �����������չ������˳��
rem ������չ--->����������%��չ--->for()������չ--->(�����������ӳ���չ)����������!��չ
rem call-����Ĵ������ϵ���չ���̻��������
rem 
set a20_source.name=%1
set a20_target.name=%2
rem ���÷�������
set a20_varcopy.args.targetname=%a20_target.name%
rem ���÷���
call :a20_varcopy "%%%a20_source.name%:"=" "%%"
goto :eof
:a20_varcopy
set a20_linshi=%*
set a20_linshi=%a20_linshi:^=^^^^^^^^^^^^^^^^%
set a20_linshi=%a20_linshi:&=^^^^^^^^^^^^^^^&%
set a20_linshi=%a20_linshi:|=^^^^^^^^^^^^^^^|%
set a20_linshi=%a20_linshi:>=^^^^^^^^^^^^^^^>%
set a20_linshi=%a20_linshi:<=^^^^^^^^^^^^^^^<%
set a20_linshi=%a20_linshi:~1,-1%
set a20_linshi=%a20_linshi:" "=^^^^^^^"%
set %a20_varcopy.args.targetname%.showvalue=%a20_linshi%
set a20_linshi=%a20_linshi%
set %a20_varcopy.args.targetname%.truevalue=%a20_linshi%
rem ��ջ�������
call :a33 a20_ 1 
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
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
::varcopy��Ч����
rem ���������ܶ�̬�ı䣬����ض��ı���
@echo off
:start
set /p a=
set linshi="%a:"=" "%"
set linshi=%linshi:^=^^^^^^^^^^^^^^^^%
set linshi=%linshi:&=^^^^^^^^^^^^^^^&%
set linshi=%linshi:|=^^^^^^^^^^^^^^^|%
set linshi=%linshi:>=^^^^^^^^^^^^^^^>%
set linshi=%linshi:<=^^^^^^^^^^^^^^^<%
set linshi=%linshi:~1,-1%
set linshi=%linshi:" "=^^^^^^^"%
set b.showvalue=%linshi%
set b.truevalue=%b.shovalue%
echo,%b.showvalue%
goto :start
::varcopy��Ч���� end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
