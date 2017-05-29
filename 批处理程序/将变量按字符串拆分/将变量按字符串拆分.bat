@echo off
pushd "%~dp0"
if "%2"=="" (
echo,
echo,不能直接打开!!!
ping /n 2 127.1>nul
goto exit
)
if "%2"=="1" (
if defined message (
echo,%message%
)
)
rem 从下面开始写代码
call 变量处理\变量处理10.bat 1 1 %3
call 变量处理\变量处理10.bat 1 1 %4
set str3.1=%3
set str3.2=%4
setlocal EnableDelayedExpansion
set str3.3=!%str3.2%!
set str3.4=!%str3.1%:a=标_记!
set str3.4=!str3.4:%str3.3%=a!
set i=1
set str3.6=a
set str3.5=b
>%str3.6%.txt echo,!str3.4!
:back
set act=
for /f "tokens=1,* delims=a" %%i in (%str3.6%.txt) do (
if defined act (
>>%str3.5%.txt echo,%%i
>>%str3.5%.txt echo,%%j
)else (
>%str3.5%.txt echo,%%i
>>%str3.5%.txt echo,%%j
set act=on
)
)
set md=%str3.6%
set str3.6=%str3.5%
set str3.5=%md%
set /a i=%i%+1
if not %i% equ 15 goto back
cd.>c.txt
for /f "tokens=*" %%i in (a.txt) do (
>>c.txt echo,%%i
)
endlocal
cd.>d.txt
for /f "tokens=*" %%i in (c.txt) do (
set str3.1=%%i
call :main
)
popd
set str3.1=
set str3.2=
set str3.3=
set str3.6=
set str3.5=
set str3.4=
goto :eof
rem ----------------------------------------------------------一层goto
:exit
if exist pathly.zlb del /q /s pathly.zlb
cls
echo,
echo,即将退出
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------一层goto end
rem ----------------------------------------------------------一层call
:main
call 变量处理\变量处理11.bat 1 1 str3.1
>>d.txt echo,%str3.1:标_记=a%
goto :eof
rem ----------------------------------------------------------一层call end
rem ----------------------------------------------------------特异变量号
号码:
3
使用方法:
str3.1、str3.2 ...
这个序列的变量只能再本批处理使用
rem ----------------------------------------------------------特异变量号 end
rem ----------------------------------------------------------脚本说明
待分隔变量名为%3的值，存储分隔符的变量名为%4的值，分隔结果放在d.txt中
注意:变量名为%3的变量的特殊字符做了标记，且没有还原,故请提前备份这个变量或者将标记改回来
rem ----------------------------------------------------------脚本说明 end
