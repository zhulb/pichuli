@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,ѹ��һ���ļ����ļ���^
&echo,^
&echo,�����3%%100�Ļָ���¼
:begin
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
if "%result%"=="wj" goto �ļ�
call ѹ��\ѹ���ļ���.bat 1 1
goto begin
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit
:�ļ�
call ѹ��\ѹ���ļ�.bat 1 1
goto begin
rem ----------------------------------------------------------һ��goto end