@echo off
netsh interface ip set address name="��������" source=static addr=172.17.229.143 mask=255.255.255.224 
echo IP�����������������
netsh interface ip set address name="��������" gateway=172.17.229.129 gwmetric=0
echo �����������........
netsh interface ip set dns name="��������" source=static addr=202.101.172.35 register=PRIMARY
echo DNS1�������........
rem netsh interface ip add dns name="��������" addr=202.101.172.35
echo DNS2�������........
rem netsh interface ip set wins name="��������" source=static addr=none
pause