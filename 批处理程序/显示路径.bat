@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
set message=^
&echo,1 �ж�Ŀ�����ļ������ļ���^
&echo,^
&echo,2 ��ʾ�ļ����ļ���·��
:begin
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
if "%result%"=="wj" goto �ļ�
cls
echo,
echo,Ŀ��Ϊ�ļ���
echo,
echo,·��Ϊ:"%pathly%"
pause>nul
goto begin
rem -------------------------------һ��goto
:�ļ�
echo,
echo,Ŀ��Ϊ�ļ�
echo,
echo,·��Ϊ:"%pathly%"
pause>nul
goto begin
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem -------------------------------һ��goto end
