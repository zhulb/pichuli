@echo off
:start
set /p a=�������һ���ַ�����
set /p b=������ڶ����ַ�����
call a21_varappend.bat a b c
echo,��׷�ӽ�� %c.showvalue%
goto :start