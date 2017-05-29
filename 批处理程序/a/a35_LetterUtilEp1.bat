@echo off
call a35_LetterUtil.bat getLowLetterArr letterArr
echo,%letterArr[0]%
echo,%letterArr[1]%
echo,%letterArr[25]%
echo,%letterArr[26]%

call a35_LetterUtil.bat getUpLetterArr letterArr
echo,%letterArr[0]%
echo,%letterArr[1]%
echo,%letterArr[25]%
echo,%letterArr[26]%

call a35_LetterUtil.bat getLetterArr letterArr 4
for /l %%i in (0,1,88) do (
	call :show "%%letterArr[%%i]%%" %%i
)
pause
exit

:show
echo,%2---%1
goto :eof