@echo off
rem ----------------------------------------------------------������
set D31_UserSet.classdir=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes
set D31_UserSet.dir=D:\workspace\partyaffairsplt1.0_zhbg\
set D31_UserSet.fileType[1]=java
set D31_UserSet.fileType[2]=jsp
set D31_UserSet.fileType[3]=js
set D31_UserSet.fileType[].length=3
echo,��ʾ��������Ϣ
echo,�����ļ������ļ���
echo,%D31_UserSet.dir%
echo,���������ʼ��ȡ�����ļ�...
pause>nul
set D31_SysSet.dir=
for /l %%i in (1,1,%D31_UserSet.fileType[].length%) do (
call :D31_SysSet.createDir "%%D31_UserSet.dir%%*.%%D31_UserSet.fileType[%%i]%%"
)
set D31_UserSet.Date[1]=2014/02/23
set D31_UserSet.Date[2]=2014/02/24
set D31_UserSet.Date[3]=2014/02/25
set D31_UserSet.Date[4]=2014/02/26
set D31_UserSet.Date[5]=2014/02/27
set D31_UserSet.Date[6]=2014/02/28
set D31_UserSet.Date[].length=6
set D31_UserSet.targetDirectory=D31_��ʱ�ļ���\����
set D31_File.path=
set D31_File.createtime=
if not exist D31_��ʱ�ļ��� (
md D31_��ʱ�ļ���
)
for /f "tokens=*" %%a in ('dir /b/s %D31_SysSet.dir%') do (
for /l %%i in (1,1,%D31_UserSet.Date[].length%) do (
call :D31_WenJian.copy "%%~ta" "%%~a" "%%D31_UserSet.Date[%%i]%%"
)
)
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
if not exist "%D31_UserSet.targetDirectory%\%D31_File.Path:~3% (
md "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%
)
copy %2 "%D31_UserSet.targetDirectory%\%D31_File.Path:~3%
rem �����java�ļ���������class�ļ�
rem if "%~x2"==".java" copy
setlocal EnableDelayedExpansion
set D31_WenJian.copy.classpath=%2
echo, eee!D31_WenJian.copy.classpath!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%cmis=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%odps=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%core=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%duty=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%dms=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%mail=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%office=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
set D31_WenJian.copy.classpath=!D31_WenJian.copy.classpath:%D31_UserSet.dir%services=D:\workspace\partyaffairsplt1.0_zhbg\WebRoot\WEB-INF\classes!
rem copy !D31_WenJian.copy.classpath!  "%D31_UserSet.targetDirectory%
for %%i in (!D31_WenJian.copy.classpath!) do (
set D31_WenJian.copy.classfile="%%~dpi"
set D31_WenJian.copy.classpath="%%~dpni".class
)
set D31_WenJian.copy.classfile=!D31_WenJian.copy.classfile:~3!
copy !D31_WenJian.copy.classpath! D31_UserSet.targetDirectory
endlocal
)
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
