@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if not defined %3 popd&goto :eof
set str2.1=%3
setlocal EnableDelayedExpansion
set %str2.1%=!%str2.1%:引_号=^^^^^^^"!
set %str2.1%=!%str2.1%:转_义=^^^^^^^^!
set %str2.1%=!%str2.1%:并_且=^^^^^^^&!
set %str2.1%=!%str2.1%:或者=^^^^^^^|!
set %str2.1%=!%str2.1%:大于=^^^^^^^>!
set %str2.1%=!%str2.1%:小于=^^^^^^^<!
set %str2.1%=!%str2.1%:百_分_号=%%!
set %str2.1%=!%str2.1%:空_格= !
>str2.1.txt echo,!%str2.1%!
endlocal
for /f "tokens=*" %%i in (str2.1.txt) do (
set str2.2=%%i
)
set %str2.1%=%str2.2:感_叹_号=!%
set str2.1=
set str2.2=
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
rem ----------------------------------------------------------特异变量号
号码:
2
使用方法:
str2.1、str2.2 ...
这个序列的变量只能再本批处理使用
rem ----------------------------------------------------------特异变量号 end
rem ----------------------------------------------------------脚本说明
处理变量，变量名为参数%3的值，变量名不能为str2.1、str2.2；处理后，echo,%变量名%能显示该变量的值；set 变量名=%变量名%便能还原该变量；是变量处理10的逆过程。
处理的特殊字符有:" ^ & | > < % ! 空格
rem ----------------------------------------------------------脚本说明 end