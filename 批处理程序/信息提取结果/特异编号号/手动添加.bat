@echo off
for /l %%i in (1,1,100) do (
if not exist %%i (
set num=%%i
goto :main
)
)
echo,����!�ﵽ������!
ping /n 2 127.1>nul
goto exit
:main
cd.>%num%
echo,���!
ping /n 2 127.1>nul
:exit
cls
echo,�����˳�
ping /n 2 127.1>nul
exit