@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,1 ��ѹѹ���ļ�^
&echo,^
&echo,2 ��ѹ�ļ���������ѹ���ļ�
:begin
cls
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
call ��ѹ\��ѹѹ���ļ�.bat 1 1
pushd "%~dp0"
cls
echo,
echo,���!!!
ping /n 2 127.1>nul
goto begin
)
for /f "tokens=*" %%i in ('dir /b "%pathly%\*.rar"') do (
set pathly="%pathly%\%%~i"
pushd "%~dp0"
call ·������\·������.bat 1 1
pushd "%~dp0"
call ��ѹ\��ѹѹ���ļ�.bat 1 1
)
cls
echo,
echo,���!!!
ping /n 2 127.1>nul
goto begin
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------һ��goto end