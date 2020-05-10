@echo off
pushd ..
:start
set date=2014/03/24
cls
:begin
call a\a19_getnextdate.bat date nextdate
set next
rem  后面必须是存在的日期才会准确结束，不然会进入死循环
if %nextdate%==2014/04/30 (
	pause
	goto :start
) else (
	set date=%nextdate%
)
goto :begin