@echo off
set pathly="%~0"
if exist "·������\·������2.bat" (
call :message
)
:begin
cls
if not exist "·������\��ȡ·��.bat" (
echo,
echo,ȱ���ļ�!!!
ping /n 2 127.1>nul
goto exit
)
rem  �����濪ʼд����
if not exist ��Ϣ��ȡ��� md ��Ϣ��ȡ���
set /p str4.1=��ǩ����: 
if not exist ��Ϣ��ȡ���\%str4.1% md ��Ϣ��ȡ���\%str4.1%
call ·������\��ȡ·��.bat 1 1
call �ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat 1 0
if "%result%"=="wj" (
echo,
echo,Ŀ�����ļ�!
ping /n 2 127.1>nul
goto begin
)
set num=1
cd.>��Ϣ��ȡ���\%str4.1%\%str4.1%.zlb
for /f "tokens=*" %%i in ('dir /b/s "%pathly%\*.bat"') do (
set pathly="%%~i"
call :main
)
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ----------------------------------------------------------һ��call
:main
set act=
set act2=
set act3=
echo,%num%
>>��Ϣ��ȡ���\%str4.1%\%str4.1%.zlb echo,%num% %pathly%
set /a num=%num%+1
for /f "usebackq tokens=* delims=" %%i in (%pathly%) do (
>��Ϣ��ȡ���\%str4.1%\��ʱ�ļ�.zlb echo,%%i
call :main2
if defined act2 goto :finish
if defined act3 (
>>��Ϣ��ȡ���\%str4.1%\%str4.1%.zlb echo,%%i
)
)
:finish
goto :eof
:message
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
goto :eof
rem ----------------------------------------------------------һ��call end
rem ----------------------------------------------------------����call
:main2
for /f "tokens=1,* delims=-" %%i in (��Ϣ��ȡ���\%str4.1%\��ʱ�ļ�.zlb) do (
if "%%j"=="%str4.1% end" set act2=on
if defined act set act3=on
if "%%j"=="%str4.1%" set act=on
)
goto :eof
rem ----------------------------------------------------------����call end
rem ----------------------------------------------------------���������
����:
4
ʹ�÷���:

rem ----------------------------------------------------------��������� end
rem ----------------------------------------------------------��Ϣ��ȡ���\%str4.1%\%str4.1
rem ----------------------------------------------------------��Ϣ��ȡ���\%str4.1%\%str4.1 end