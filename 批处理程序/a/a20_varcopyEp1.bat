@echo off
pushd ..
:start


set /p a=输入变量:
call a/a20_varcopy.bat a a
echo,已经将a的值赋值给b
echo,     【b:%a.showvalue%】
goto :start


exit