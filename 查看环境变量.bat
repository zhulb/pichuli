@echo off
:loop
cls
echo,输入环境变量名包含的字符串
echo,(输入空格或者什么也不输入可以查看所有的环境变量)
set /p containstr=
call :showvar_service %%containstr%%
pause
goto :loop

:showvar_service
for /f "tokens=1,* delims==" %%i in ('set %*') do (
	set showvar_service_show_varname=%%i
	call :showvar_service_show %%%%i%%
)
goto :eof
:showvar_service_show
echo,%showvar_service_show_varname%   =   %*
goto :eof