@echo off
rem &&前面的命令成功时执行  ||前面的命令失败时执行
>nul copy D:\af.txt E:\&&echo,ok||echo,no

pause
exit

rem 下面的程序说明errorlevel在关闭变量延迟扩展后值不变，即使他的值是在变量延迟扩展的过程中设定的的
rem 变量延迟扩展是本地化的，其中定义的变量在关闭后全都无效，但可以通过errorlevel变量来传递信息
rem 传递的方式是结合choic

echo,%errorlevel%
setlocal enabledelayedexpansion
(echo,a|1>nul 2>nul choice /c abcdefghijklmnopqrstuvwxyz)
endlocal
echo,%errorlevel%
pause>nul