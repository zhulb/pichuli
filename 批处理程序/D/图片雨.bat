@echo off
set setting=7
set cur=0
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
for /l %%i in (1,1,6) do (
	echo %cur%
)
for /l %%i in (%cur%,1,%setting%) do (
	call :show "%%a[%%i]%%" %%i
)

if "%cur%"=="0"  (
	call :setCur
	call :sleep
	rem echo %cur%
	rem pause
	goto :next
)

for /l %%i in (0,1,%cur%) do (
	call :show "%%a[%%i]%%" %%i
)
call :setCur
call :sleep
rem echo %cur%
rem pause
goto :next
exit

:show
echo %2 %~1
goto :eof
:sleep
for /l %%i in (0,1,100) do (
	for /l %%j in (0,1,50) do (
		set b=%%i
	)
)
goto :eof
:setCur
if "%cur%"=="0" (
	set /a cur=%setting%
) else (
	set /a cur=%cur%-1
)
goto :eof