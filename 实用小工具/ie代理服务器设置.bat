@echo off
echo,192.168.60.7|set /p ipa=���������IP��ַ��
echo,%ipa%
echo,80|set /p portb=���������IP�˿ڣ�
echo,%portb%
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x1 /f
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v proxyServer /t REG_SZ /d http=%ipa%:%portb% /f
pause




rem /**����IE����**/
exit
@echo off
echo,192.168.60.7|(set /p ipa=���������IP��ַ��)
set ipa=192.168.60.7
echo,%ipa%
echo,80|set /p portb=���������IP�˿ڣ�
set portb=80
echo,%portb%
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x1 /f
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v proxyServer /t REG_SZ /d http=%ipa%:%portb% /f
rem �������ص�ַ�Ĵ�������� 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "<local>" /f 
pause

rem /**ȡ��IE����**/
exit
@echo off
reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x0 /f  
pause
