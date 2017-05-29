@echo off&cls
setlocal enabledelayedexpansion
:s
set /p beic=被除数：
set /p chus=除数：
set /p weis=小数位数：
set /a shang=!beic!/!chus!
set /a yushu=!beic!%%!chus!
if !yushu!==0 goto end
set shang=!shang!.
for /l %%a in (1,1,!weis!) do (
set /a yushu=!yushu!*10
set /a shangt=!yushu!/!chus!
set /a yushu=!yushu!%%!chus!
set shang=!shang!!shangt!
if !yushu!==0 goto end
)
:end
echo !beic!÷!chus!=!shang!
pause
cls&goto s


