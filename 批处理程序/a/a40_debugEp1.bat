@echo off
set name=朱亮冰
call a40_debug.bat 1 1 true

%rem%开启了debuge模式
%rem%name=%name% & set

call a40_debug.bat 1 1 false

%rem%关闭了debuge模式，不再显示
%rem%name=%name% & set

pause