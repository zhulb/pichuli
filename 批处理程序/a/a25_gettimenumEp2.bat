@echo off
pushd ..
call a\a25_gettimenum.bat time_ 1
ping /n 4 127.1>nul
call a\a25_gettimenum.bat timeend 1
set /a time=%timeend%-%time_%
echo,%time%
call :yidong %time% 2
echo,%bignum% 秒
pause
exit




rem 一、功能描述：
rem 将一个整数的小数点向左移动n位
rem 二、实现设计
rem 举例：将203的小数点向左移动1位
rem 1、203---->100000203(加上100000000)
rem 2、100000203--->0000020.3   %var:~1,-2%.%var:~-1%
rem 3、去除前面的0
rem 三、参数设计
rem %1 要处理整数   %要移动位数
:yidong
set num=%1
set /a yi=%2
set /a bignum=100000000+%num%
call :setfirst %%bignum:~1,-%yi%%%.%%bignum:~-%yi%%%
:start

for /f "tokens=*" %%i in ('echo,%bignum%^|findstr "^0[0-9]"') do (
	set bignum=%bignum:~1%
	goto :start
)

goto :eof
:setfirst
set bignum=%1
goto :eof