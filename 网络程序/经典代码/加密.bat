:: 文件加解密程序
:: qzwqzw 2007-05-30 
:: 主要对文本逐一进行异或运算，支持密码
@echo off
set file=%1
set pass=%2
if "%file%"=="" set file=%0
if "%pass%"=="" set pass=0
if "%file%"=="" set /p file=请输出加解密文件名（可将文件直接拖入命令行）：
if "%pass%"=="" set /p pass=请输出加解密密码（0~F的十六进制数，默认为0）：

echo e 100 B4 06 B2 FF CD 21 74 08 34 E%pass% 88 C2 CD 21 EB F0 C3>_codec.scr
for %%s in (rcx 11 n_codec.com w q) do echo %%s>>_codec.scr 
if exist _codec.scr %comspec% /cdebug < _codec.scr >nul
if exist _codec.com %comspec% /c_codec < %file% > %file%.txt
if exist _codec.* del _codec.*
