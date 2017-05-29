@echo off&setlocal EnableDelayedExpansion&color 0a&mode con: cols=80 lines=26
set a=1234567890 abcd  e g hijk l nopqrst uvw x zAB C E F  IJ KL MNOP  RS T UV X YZ     
set sec=%time:~6,2%
:loop
set /a looptime+=1
if not "%time:~6,2%"=="%sec%" (
    set sec=%time:~6,2%&title  !looptime! loop/1sec
    set/a looptime=0
)
set /a num1=!random!%%80,num2=!random!%%80,num3=!random!%%80,num4=!random!%%80,num5=!random!%%80,num6=!random!%%80,num7=!random!%%80,num8=!random!%%80,num9=!random!%%80,num10=!random!%%80,num11=!random!%%80,num12=!random!%%80,num13=!random!%%80,num14=!random!%%80,num15=!random!%%80,num16=!random!%%80,num17=!random!%%80,num18=!random!%%80,num19=!random!%%80,num20=!random!%%80,num21=!random!%%80,num22=!random!%%80,num23=!random!%%80,num24=!random!%%80,num25=!random!%%80,num26=!random!%%80,num27=!random!%%80,num28=!random!%%80
set nub1=!a:~-%num1%,1!&set nub2=!a:~-%num2%,1!&set nub3=!a:~-%num3%,1!&set nub4=!a:~-%num4%,1!&set nub5=!a:~-%num5%,1!&set nub6=!a:~-%num6%,1!&set nub7=!a:~-%num7%,1!&set nub8=!a:~-%num8%,1!&set nub9=!a:~-%num9%,1!&set nub10=!a:~-%num10%,1!&set nub11=!a:~-%num11%,1!&set nub12=!a:~-%num12%,1!&set nub13=!a:~-%num13%,1!&set nub14=!a:~-%num14%,1!&set nub15=!a:~-%num15%,1!&set nub16=!a:~-%num16%,1!&set nub17=!a:~-%num17%,1!&set nub18=!a:~-%num18%,1!&set nub19=!a:~-%num19%,1!&set nub20=!a:~-%num20%,1!&set nub21=!a:~-%num21%,1!&set nub22=!a:~-%num22%,1!&set nub23=!a:~-%num23%,1!&set nub24=!a:~-%num24%,1!&set nub25=!a:~-%num25%,1!&set nub26=!a:~-%num26%,1!&set nub27=!a:~-%num27%,1!&set nub28=!a:~-%num28%,1!
set o1=%nub1%  %nub2%  %nub3%  %nub4%  %nub5%  %nub6%  %nub7%  %nub8%  %nub9%  %nub10%  %nub11%  %nub12%  %nub13%  %nub14%  %nub15%  %nub16%  %nub17%  %nub18%  %nub19%  %nub20%  %nub21%  %nub22%  %nub23%  %nub24%  %nub25%  %nub26%  %nub27%  %nub28% 
set c1=%o1:~0,80%
cls&echo.!c1!!c2!!c3!!c4!!c5!!c6!!c7!!c8!!c9!!c10!!c11!!c12!!c13!!c14!!c15!!c16!!c17!!c18!!c19!!c20!!c21!!c22!!c23!!c24!
set c2=%c1%&set c3=%c2%&set c4=%c3%&set c5=%c4%&set c6=%c5%&set c7=%c6%&set c8=%c7%&set c9=%c8%&set c10=%c9%&set c11=%c10%&set c12=%c11%&set c13=%c12%&set c14=%c13%&set c15=%c14%&set c16=%c15%&set c17=%c16%&set c18=%c17%&set c19=%c18%&set c20=%c19%&set c21=%c20%&set c22=%c21%&set c23=%c22%&set c24=%c23%&set c25=%c24%
goto :loop
