@echo off
pushd ..
rem һ������˵�� ������ת��������  ���ֵķ�ΧΪ1-99
rem �������÷���
rem ��һ�������壬�ڶ�������ѡ��������ʽ��0-һ����д����1-Ҽ����д����������������ʾҪ������������ֵΪ1-99��һ������
rem �����������
rem �������a1_result����������
rem 
for /l %%i in (1,1,99) do (
	set num=%%i
	call a/a1_.bat 1 0 num
	call :echo
)
pause
exit
:echo
set a1_result
goto :eof