@echo off
pushd ..
call a\a25_gettimenum.bat time_ 1
ping /n 4 127.1>nul
call a\a25_gettimenum.bat timeend 1
set /a time=%timeend%-%time_%
echo,%time%
call :yidong %time% 2
echo,%bignum% ��
pause
exit




rem һ������������
rem ��һ��������С���������ƶ�nλ
rem ����ʵ�����
rem ��������203��С���������ƶ�1λ
rem 1��203---->100000203(����100000000)
rem 2��100000203--->0000020.3   %var:~1,-2%.%var:~-1%
rem 3��ȥ��ǰ���0
rem �����������
rem %1 Ҫ��������   %Ҫ�ƶ�λ��
:yidong
set num=%1
set /a yi=%2
set /a bignum=100000000+%num%
call :setfirst %%bignum:~1,-%yi%%%.%%bignum:~-%yi%%%
:start

for /f "tokens=*" %%i in ('echo,%bignum%^|findstr "^0[0-9]"') do (
	set bignum=%bignum:~1%
	goto :start
)

goto :eof
:setfirst
set bignum=%1
goto :eof