@echo off
rem 必须要返回到工组目录
pushd ..

rem 


rem 调用形式：开始日期yyyy/mm/dd 结束日期yyyy/mm/dd 接受集合的变量
call a\a25_gettimenum.bat starttime 1
call a\a23_getdatelist.bat 2014/04/07 2014/12/05 date
call a\a25_gettimenum.bat endtime 1
set /a time_=%endtime%-%starttime%
echo,时间：%time_%
rem 显示集合
rem 集合大小：%date.list[]%
rem 集合元素：%date.list[1]% %date.list[2]%
set date
pause
exit