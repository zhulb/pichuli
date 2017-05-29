@echo off
reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v myrun /t REG_SZ /d "F:\工作\启动服务\启动GBase服务.bat"
pause