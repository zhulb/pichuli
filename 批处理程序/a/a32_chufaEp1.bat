@echo off
pushd ..
call a\a32_chufa.bat 10 2 result
echo,%result%
call a\a32_chufa.bat 102 100 result
echo,%result%
call a\a32_chufa.bat 123873 32 result
echo,%result%
pause