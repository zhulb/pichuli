@echo off
echo,Y|reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 1
echo,������ɣ�
pause
exit