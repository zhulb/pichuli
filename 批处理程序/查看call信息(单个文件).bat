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
if not exist �鿴call��Ϣ md �鿴call��Ϣ
call ·������\��ȡ·��.bat 1 1
call �ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat 1 0
if "%result%"=="wjj" (
echo,Ŀ�����ļ���!
ping /n 2 127.1>nul
goto exit
)
for /f "usebackq tokens=*" %%i in ("%pathly%") do (
set pathly=%%i
call :main
)
echo,���!
echo,�밴���������!
pause>nul
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
set str6.1= 
set act6.1=
set act6.2=
call ���������ַ������\���������ַ������.bat 1 0 pathly str6.1
for /f "tokens=*" %%i in (���������ַ������\d.txt) do (
set pathly=%%i
if defined act6.1 (
call :main2
if not defined act6.2 (
echo,%%i
)
goto finish
)
call :main1
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
:main1
call ��������\��������10.bat 1 1 pathly
if "%pathly%"=="call" (
set act6.1=on
)
goto :eof
rem ----------------------------------------------------------����call end
rem ----------------------------------------------------------����call
:main2
call ��������\��������10.bat 1 1 pathly
if "%pathly:~0,1%"==":" (
set act6.2=on
)
goto :eof
rem ----------------------------------------------------------����call end
rem ----------------------------------------------------------���������
����:
6
ʹ�÷���:
*����.1��*����.2 ...
������еı���ֻ���ٱ�������ʹ��(��str����.1��str����.2 ...)
rem ----------------------------------------------------------���������
rem ----------------------------------------------------------�ű�˵��
��������:
a,
b,
���õı���:
a,
b,
���ɵı���:
a,
b,
�ű�����:
a,
b,
rem ----------------------------------------------------------�ű�˵�� end