@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,��ѹ�ļ��м����ļ���������ѹ���ļ�
:begin
cls
pushd "%~dp0"
set passward=
set /p passward=passward: 
if not exist ·������\��ȡ·��.bat (
echo,
echo,ȱ���ļ�
ping /n 2 127.1>nul
goto exit
)
call ·������\��ȡ·��.bat 1 1
pushd "%~dp0"
call �ж�·�����ļ������ļ���\�ж�·�����ļ������ļ���.bat 1 1
if "%result%"=="wj" (
cls
echo,
echo,Ŀ�����ļ�!!!
ping /n 2 127.1>nul
goto begin
)
if defined passward (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%\*.rar"') do (
(2>nul pushd "%%~dpi")
cls
echo,
echo,���ڽ�ѹ"%%i"...
start /wait "" winrar.exe x -p"%passward%" "%%i"
)
)else (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%\*.rar"') do (
(2>nul pushd "%%~dpi")
cls
echo,
echo,���ڽ�ѹ"%%i"...
start /wait "" winrar.exe x "%%i"
)
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