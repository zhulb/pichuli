%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a 
cls
@echo off
rem ----------------------------------------------------------������
:D4_begin
set message="%~n0"
call :a2 1 1 0 1 
cls
set D4_i=1
for /f "usebackq tokens=*" %%i in ("%a2_pathly%") do (
call :D4_main1
echo,%%i
)
echo,���!
pause
goto D4_begin
goto exit
::һ��c
rem ----------------------------------------------------------һ��c
:D4_main1
set /p nothing="%D4_i%  " <nul
set /a D4_i=%D4_i%+1
goto :eof
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
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
rem ----------------------------------------------------------������ end
::������ end
:a2
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
if "%4"=="1" (
rem ��%2����Ϊ0��ʾ����ʾmessage�����ݣ�%2����Ϊ1��ʾ��message�ж������ʾ������
if defined message (
cls
echo,&echo,"%message:"=%
)
)
echo,&echo,---------------------------�˳�:����exit(Ĭ��)&echo,
set a2_pathly=exit
set /p a2_pathly=·��: 
set a2_pathly="%a2_pathly:"=%"
for %%i in (%a2_pathly%) do (
set a2_pathmb="%%~dpi"
set a2_name="%%~ni"
set a2_type="%%~xi"
)
if %a2_pathly%=="exit" goto exit
set a2_pathly=%a2_pathly:^=^^%
set a2_pathly=%a2_pathly:&=^&%
set a2_pathly=%a2_pathly:|=^|%
set a2_pathly=%a2_pathly:"=%
set a2_pathmb=%a2_pathmb:^=^^%
set a2_pathmb=%a2_pathmb:&=^&%
set a2_pathmb=%a2_pathmb:|=^|%
set a2_pathmb=%a2_pathmb:"=%
set a2_name=%a2_name:^=^^%
set a2_name=%a2_name:&=^&%
set a2_name=%a2_name:|=^|%
set a2_name=%a2_name:"=%
set a2_type=%a2_type:^=^^%
set a2_type=%a2_type:&=^&%
set a2_type=%a2_type:|=^|%
set a2_type=%a2_type:"=%
if "%3"=="1" (
rem �����ԱȽ��϶��������������ļ��С������ļ�ʱ������
rem ��0��ʾ�޶��壬1��ʾ�ж���
cls
echo,
echo,   a2_��ȡ·��.bat
echo,
echo,  �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
set /p nothing="  �Ua2_pathly�U" <nul
if defined a2_pathly (
echo,1"��%a2_pathly%��
)else (
echo,0"��%a2_pathly%��
)
echo,  �U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
set /p nothing="  �Ua2_pathmb�U" <nul
if defined a2_pathmb (
echo,1"��%a2_pathmb%��
)else (
echo,0"��%a2_pathmb%��
)
echo,  �U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
set /p nothing="  �Ua2_name  �U" <nul
if defined a2_name (
echo,1"��%a2_name%��
)else (
echo,0"��%a2_name%��
)
echo,  �U�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
set /p nothing="  �Ua2_type  �U" <nul
if defined a2_type (
echo,1"��%a2_type%��
)else (
echo,0"��%a2_type%��
)
echo,  �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T
echo,     ^(0��ʾ�޶��壬1��ʾ�ж���^)
echo,
echo,   �����������!
pause>nul
cls
)
goto:eof
cls&echo,&echo,����,û�з���!��a2_��ȡ·��.bat��&pause
exit
::һ��c
rem ----------------------------------------------------------һ��c
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
rem ----------------------------------------------------------������ end
::������ end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
����ı�����ȡ����ԭֵ���������ַ�ʱ��Ҫ�ڱ���ǰ��"������ת�塣
���صı���:a2_pathly��a2_pathmb��a2_name��a2_type
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:������
���ļ������� ��:·������
���ļ�����   ��:��ȡ·��
������˵��   ��:
%1��%2����������
%3����ʾ����Ͳ���ʾ����Ŀ��أ�%1Ϊ1ʱ����ʾ·�������������ͣ��%1Ϊ0ʱ����ʾҲ����ͣ
%4������ʾ(Ϊ1ʱ)����ʾ(Ϊ0ʱ)����message������
::����˵�� end
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
 
