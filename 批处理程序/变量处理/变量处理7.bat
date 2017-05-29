@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if not defined %3 popd&goto :eof
set str=%3
setlocal EnableDelayedExpansion
set %str%=!%str%:"=引_号!
set %str%=!%str%:^^=转_义!
set %str%=!%str%:^&=并_且!
set %str%=!%str%:^|=或者!
set %str%=!%str%:^>=大于!
set %str%=!%str%:^<=小于!
set %str%=!%str%:%%=百_分_号!
>str.txt echo,!%str%!
endlocal
for /f "tokens=*" %%i in (str.txt) do (
set %str%=%%i
)
popd
goto :eof
exit
rem ----------------------------------------------------------一层goto
:exit
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------脚本说明
处理变量,变量名为参数%3的值，变量名不能为str；变量中的特殊字符换成其对应的标记符
rem ----------------------------------------------------------脚本说明 end