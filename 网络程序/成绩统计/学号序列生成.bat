@echo off
for /l %%i in (1,1,46) do (
if %%i lss 10 (
echo,0907110%%i
) else (
echo,090711%%i
)
)
pause>nul
exit