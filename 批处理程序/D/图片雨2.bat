@echo off
set /a app.firstPrint=0
set /a app.size=10
set /a app.lastPrint=0
set /a app.length=35

:next
cls
set a[0]=                       ����� ��������㡤���� ������ �����
set a[1]=                       ��������� ��㣮������㣮
set a[2]=                          ������       ������     ��ʥ��
set a[3]=                         ���﨎��     ���﨎��     �ﵮ��
set a[4]=                        ����������   ����������     ��ڡ�
set a[5]=                       ������������ ������������      ����
set a[6]=                       ���||��� !!���||���         ���֡�
set a[7]=                       ףʥ���ڿ��� ^_^!!��������� ��㣮������㣮
set a[8]=                       ����� ��������㡤���� ������ �����
set a[9]=                       ��������� ��㣮������㣮
set a[10]=                          ������       ������     ��ʥ��
set a[11]=                         ���﨎��     ���﨎��     �ﵮ��
set a[12]=                        ����������   ����������     ��ڡ�
set a[13]=                       ������������ ������������      ����
set a[14]=                       ���||��� !!���||���         ���֡�
set a[15]=                       ףʥ���ڿ��� ^_^!!��������� ��㣮������㣮����
set a[16]=                       ����� ��������㡤���� ������ �����
set a[17]=                       ��������� ��㣮������㣮
set a[18]=                          ������       ������     ��ʥ��
set a[19]=                         ���﨎��     ���﨎��     �ﵮ��
set a[20]=                        ����������   ����������     ��ڡ�
set a[21]=                       ������������ ������������      ����
set a[22]=                       ���||��� !!���||���         ���֡�
set a[23]=                       ףʥ���ڿ��� ^_^!!��������� ��㣮������㣮
set a[24]=                       �q����r 
set a[25]=                       {/-����-/}
set a[26]=                        ( (oo) ) 
set a[27]=                         ���� 
set a[28]=                       �q����r
set a[29]=                       {/ X  o ^/} 
set a[30]=                        ( ^(oo^) ) 
set a[31]=                         ���� 
set a[32]=                       �q����r
set a[33]=                       {^/-���-^/}
set a[34]=                        ^( ^(oo^) ^) 
set a[35]=                         ���� 

rem ����
set /a app.lastPrint=%app.firstPrint%+%app.size%
rem ��ʾ
for /l %%i in (1,1,6) do (
	echo *
)
for /l %%i in (%app.firstPrint%,1,%app.lastPrint%) do (
	call :print %%i
)
if "%app.firstPrint%"=="0" (
	set /a app.firstPrint=%app.length%
) else (
	set /a app.firstPrint=%app.firstPrint%-1
)
call :sleep
goto :next
exit


:print
if %1 GTR %app.length% (
	set /a index=%1-%app.length%
) else (
	set /a index=%1
)
call :printByIndex "%%a[%index%]%%" %index%
goto :eof

:printByIndex
echo %~1
goto :eof

:sleep
for /l %%i in (0,1,100) do (
	for /l %%j in (0,1,50) do (
		set b=%%i
	)
)
goto :eof