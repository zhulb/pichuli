@echo off
netsh interface ip set address name="��������" source=static addr=192.168.1.9 mask=255.255.255.0 
echo IP�����������������netsh interface ip set address name="��������" gateway=192.168.1.1 gwmetric=0
echo �����������........
rem netsh interface ip set dns name="��������" source=static addr=10.1.3.5 register=PRIMARY
echo DNS1�������........
rem netsh interface ip add dns name="��������" addr=10.210.62.12
echo DNS2�������........
netsh interface ip set wins name="��������" source=static addr=none
pause