@@echo off
set a="fefe"
call :main "%a:"=" "%"
pause
exit
:main
echo,%*
set b=%*
echo,%b:" "=ee%
goto :eof