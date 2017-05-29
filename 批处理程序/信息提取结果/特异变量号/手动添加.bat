@echo off
for /l %%i in (1,1,100) do (
if not exist %%i (
set num=%%i
goto :main
)
)
echo,错误!达到最大个数!
ping /n 2 127.1>nul
goto exit
:main
cd.>%num%
echo,完成!
ping /n 2 127.1>nul
:exit
cls
echo,即将退出
ping /n 2 127.1>nul
exit