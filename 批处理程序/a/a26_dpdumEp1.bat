@echo off
pushd ..
call a\a26_dpdump.bat dpdump 1

echo,DATA_PUMP_DIR��%dpdump%
pause>nul
echo,�����˳�!
ping /n 2 127.1>nul
exit
