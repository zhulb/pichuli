@echo off
pushd ..
popd
set D31_message="%~n0"
set D31_pathmb="%~dp0"
set D31_pathmb=%D31_pathmb:~0,-4%
pushd %D31_pathmb%
::������
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
set D31_UserSet.fileType[4]=css
set D31_UserSet.fileType[].length=4
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
call a\a23_getdatelist.bat %D31_UserSet.startdate% %D31_UserSet.enddate% D31_UserSet.Date
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
call a\a25_gettimenum.bat D31_time.start 1
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
call a\a25_gettimenum.bat D31_time.end 1
set /a D31_time=%D31_time.end%-%D31_time.start%
call a\a32_chufa.bat %D31_time% 100 D31_time
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
