@echo off
echo,192.168.60.7|set /p ipa=请输入代理IP地址：
echo,%ipa%
echo,80|set /p portb=请输入代理IP端口：
echo,%portb%
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x1 /f
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v proxyServer /t REG_SZ /d http=%ipa%:%portb% /f
pause




rem /**设置IE代理**/
exit
@echo off
echo,192.168.60.7|(set /p ipa=请输入代理IP地址：)
set ipa=192.168.60.7
echo,%ipa%
echo,80|set /p portb=请输入代理IP端口：
set portb=80
echo,%portb%
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x1 /f
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v proxyServer /t REG_SZ /d http=%ipa%:%portb% /f
rem 跳过本地地址的代理服务器 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "<local>" /f 
pause

rem /**取消IE代理**/
exit
@echo off
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x0 /f  
pause
