@echo off
:loop
cls
echo,���뻷���������������ַ���
echo,(����ո����ʲôҲ��������Բ鿴���еĻ�������)
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