@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,ѹ���ļ���������ָ�����͵��ļ�^
&echo,^
&echo,�����3%%100�Ļָ���¼
:begin
cls
set wjtype=
set /p wjtype=�ļ�����:
cls
set passward=
set /p passward=passward: 
pushd "%~dp0"
if not exist ·������\��ȡ·��.bat (
echo,
echo,ȱ���ļ�
ping /n 2 127.1>nul
goto exit
)
call ·������\��ȡ·��.bat 1 1
pushd "%~dp0"
call �ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat 1 1
pushd "%~dp0"
if "%result%"=="wj" (
clc
echo,
echo,Ŀ��λ�ļ�!!!
ping /n 2 127.1>nul
goto begin
)
for /f "tokens=*" %%i in ('dir /b/s "%pathly%"') do (
set pathly="%%~i"
pushd "%~dp0"
call ·������\·������.bat 1 1
pushd "%~dp0"
call �ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat 1 1
pushd "%~dp0"
call :main
)
cls
echo,
echo,���!!!
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------һ��call
:main
if "%result%"=="wj" (
if "%type%"==".rar" goto :eof
if "%type%"==".%wjtype%" (
call ѹ��\ѹ���ļ�.bat 1 1
)
)
goto :eof
rem ----------------------------------------------------------һ��call end
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end
rem ----------------------------------------------------------�ű�˵��
ѹ���ļ���������ָ�����͵��ļ�
rem ----------------------------------------------------------�ű�˵�� end