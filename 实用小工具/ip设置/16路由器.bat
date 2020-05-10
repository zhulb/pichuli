@echo off
netsh interface ip set address name="本地连接" source=static addr=192.168.1.9 mask=255.255.255.0 
echo IP和子网掩码设置完成netsh interface ip set address name="本地连接" gateway=192.168.1.1 gwmetric=0
echo 网关设置完成........
rem netsh interface ip set dns name="本地连接" source=static addr=10.1.3.5 register=PRIMARY
echo DNS1设置完成........
rem netsh interface ip add dns name="本地连接" addr=10.210.62.12
echo DNS2设置完成........
netsh interface ip set wins name="本地连接" source=static addr=none
pause