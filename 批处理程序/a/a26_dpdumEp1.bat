@echo off
pushd ..
call a\a26_dpdump.bat dpdump 1

echo,DATA_PUMP_DIR£º%dpdump%
pause>nul
echo,¼´½«ÍË³ö!
ping /n 2 127.1>nul
exit
