@echo off
set pathly="%~0"
call ·������\·������2.bat 1 1
title %name%
set name=%name%
set message=^
&echo,"%name%"
:begin
set pathly=
pushd "%~dp0"
if not exist ��������\��������.bat (
echo,
echo,ȱ���ļ�
ping /n 2 127.1>nul
goto exit
)
cls
echo,
echo,�����ַ�����Ϊ����pathly��ֵ
echo,
echo,�˳�����������
echo,
set /p pathly=������: 
if not defined pathly goto exit
call ��������\��������.bat 1 1
pushd "%~dp0"
echo,
echo,����ֵΪ
echo,
echo,%pathly%
pause>nul
goto begin
rem -------------------------------һ��goto
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
rem -------------------------------һ��goto end
