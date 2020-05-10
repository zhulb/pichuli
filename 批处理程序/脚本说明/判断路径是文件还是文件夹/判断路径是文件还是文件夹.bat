@echo off
cls
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
(2>nul pushd "%pathly%")||(goto 文件)
set result=wjj
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
:文件
set result=wj
goto :eof
exit
rem ----------------------------------------------------------一层goto end
