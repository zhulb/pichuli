@echo off
pushd ..
:start

set "a="
set /p a=输入变量:
if not defined a goto :start
call a/a20_varcopy.bat a b
echo,已经将a的值赋值给b
echo,     【b:%b.showvalue%】

echo,y|choice>nul 
set num=0
set end=
for /l %%i in (0,1,100) do (
	
	if defined end goto :end
	call :main "%%a:~%%i,1%%"
)
:end
echo,%num%

goto :start


exit
:main
echo,%errorlevel%
echo,【%*】
set a_=%*
set a_="%a_:"=ee%"
if %a_%=="eeee" (
	set end=on
	echo,n|choice>nul 
) else (
	set /a num=%num%+1
)

echo,【%a_%】
echo,--------------

goto :eof