@echo off
cls
if "%2"=="" (
echo,
echo,����ֱ�Ӵ�!!!
ping /n 2 127.1>nul
goto exit
)
(2>nul pushd "%pathly%")||(goto �ļ�)
set result=wjj
popd
goto :eof
exit
rem ----------------------------------------------------------һ��goto
:exit
cls
echo,
echo,�����˳�
ping /n 2 127.1>nul
exit
:�ļ�
set result=wj
goto :eof
exit
rem ----------------------------------------------------------һ��goto end
