@echo off
:start
set /p a=请输入第一个字符串：
set /p b=请输入第二个字符串：
call a21_varappend.bat a b c
echo,【追加结果 %c.showvalue%
goto :start