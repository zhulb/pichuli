@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set pathly=%name%
call ��������\��������.bat 1 1
call ��������\��������.bat 1 1
set message=^
&echo,%pathly%^
&echo,^
&echo,ֻ�ʺϲ����ļ����ٵ��ļ���!^
&echo,^
&echo,֧��ͨ���*��?
:begin
cls
set pathly=
if not exist ·������\��ȡ·��.bat (
echo,
echo,ȱ���ļ�
ping /n 2 127.1>nul
goto exit
)
echo,
set /p pathly=��ʽ: 
if not defined pathly goto exit
call ��������\��������.bat 1 1
pushd "%~dp0"
set WJLX=%pathly%
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
if "%pathly:~-1%"=="\" (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%*.%WJLX%"') do (
echo,%%i
echo,
echo,
)
)else (
for /f "tokens=*" %%i in ('dir/b/a-d/s "%pathly%\*.%WJLX%"') do (
echo,%%i
echo,
echo,
)
)

echo,
echo,���!!!
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