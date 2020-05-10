@echo off
netsh interface ip set address name="本地连接" source=static addr=172.17.229.143 mask=255.255.255.224 
echo IP和子网掩码设置完成
netsh interface ip set address name="本地连接" gateway=172.17.229.129 gwmetric=0
echo 网关设置完成........
netsh interface ip set dns name="本地连接" source=static addr=202.101.172.35 register=PRIMARY
echo DNS1设置完成........
rem netsh interface ip add dns name="本地连接" addr=202.101.172.35
echo DNS2设置完成........
rem netsh interface ip set wins name="本地连接" source=static addr=none
pause