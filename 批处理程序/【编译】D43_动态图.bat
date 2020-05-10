@echo off
rem ----------------------------------------------------------主代码
mode con cols=50 lines=20
set /a D43_app.firstPrint=0
set /a D43_app.size=19
set /a D43_app.lastPrint=0
set /a D43_app.blanklines=13
set /a D43_app.spaceCounts=6
set /a D43_app.addLength=20
set /a D43_app.cur=0
set /a D43_app.typeMode=1
set D43_app.loadPicture=
set D43_app.pictureTag=::tuSiJi
set D43_app.length=
set D43_app.tmp=
set D43_app.arr=
rem 加载图片数据
echo 正在加载图片...
for /f "usebackq tokens=* delims=" %%i in ("%~0") do (
	if "%%~i"=="%D43_app.pictureTag%_end" goto :D43_finishLoad
	if defined D43_app.loadPicture (
		set D43_app.tmp=%%i
		call :D43_setArr
	)
	if "%%~i"=="%D43_app.pictureTag%" set D43_app.loadPicture=on
)
:D43_finishLoad
set /a D43_app.length=%D43_app.cur%-1
ping 4 192.168.8.1 >nul
setlocal EnableDelayedExpansion
:D43_next
cls
rem 计算
set /a D43_app.lastPrint=%D43_app.firstPrint%+%D43_app.size%
rem 显示
for /l %%i in (1,1,%D43_app.blanklines%) do (
	echo a 
)
if "%D43_app.typeMode%"=="1" (
	type D43_tmp.txt
	>D43_tmp.txt echo.
)
for /l %%i in (%D43_app.firstPrint%,1,%D43_app.lastPrint%) do (
	call :D43_print %%i
)
if %D43_app.firstPrint% GEQ %D43_app.length% (
	set /a D43_app.firstPrint= 0
) else (
	set /a D43_app.firstPrint=%D43_app.firstPrint% + %D43_app.addLength%
)
call :D43_sleep
goto :D43_next
endlocal
exit
::一层c
rem ----------------------------------------------------------一层c
::函数1
:D43_setArr
call :a20 D43_app.tmp D43_app.arr[%D43_app.cur%] 
set /a D43_app.cur=%D43_app.cur%+1
goto :eof
:D43_print
if %1 GTR %D43_app.length% (
	set /a index=%1-%D43_app.length%
) else (
	set /a index=%1
)
if "%D43_app.typeMode%"=="1" (
	>> D43_tmp.txt echo a !D43_app.arr[%index%].truevalue!
) else (
	echo a !D43_app.arr[%index%].truevalue!
	rem call :D43_printByIndex "%%D43_app.arr[%index%]%%" %index%
)
goto :eof
:D43_printByIndex
echo %~1
goto :eof
:D43_sleep
for /l %%i in (0,1,20) do (
	for /l %%j in (0,1,55) do (
		set b=%%i
	)
)
goto :eof
::函数1 end
::函数2
::函数2 end
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
::脚本说明
rem ----------------------------------------------------------脚本说明
::tuSiJi
.
.
.
               8u   YB8             
              Y5BLi7B,B             
             rB.BL:BL8BU            
            BNJr:    . .B7          
           k0            B          
           B             0r         
           B  :ii, :YJL  B:         
           07 .::. .,   Nk          
            1qS.,    : JB           
              5BjB LkEG 78          
                B:Br7q  .B          
               .72B.B   B:          
              jB0UBBYM17.           
             kBU5;UOLBYM            
             ,BvM.   B B            
              BPB.,: BBM..          
               rr.:,.77 . 
             kE   2Mi              
             k:B  B.8               
             B.Bi2BUB:.             
            jBvv . i ;q8.           
          .BL          .B.          
          B:            .M          
         :B        .:ii  B          
         7F  :Yu5i 77r. qL          
          B   .        BE           
          .MU.        LM:           
            :8Br     B:E            
              87B    B B            
              N N    G E            
             iqiB2JJ2YS2O           
             8OGq    B M5           
             U7,J    B,S            
              B B    M M            
              ZEBr:::BX0,,          
               iv.:,.:v .. 
.
.  
           S5B  jNBi               
            BiBYS7NB1:              
          .MJr.     ,YS             
         UB            B.           
        :B         .iv ,B           
        8:    ,77 kqji  B           
        O: .PXk7:      YS           
        .B            LB            
         ,BSi          jU           
            Bk        ;BYL          
            SYB        B5:L         
           B,FM:       vB.B         
          iYMB:7N8NU1ju BU8         
           B0LUi       B:BJ         
           rB B7     qUN,k          
            Zi::B   r5i0r           
             ,N S    Uv,            
              LBZ5::,BBU.,          
               iL.,,.:i...          
.
.
           .BB;r;,                  
        uBZqBB5:v5B2                
       LBB 7:      XM               
      GBBr          B               
     vZ             B               
     B             MBjULr           
     0S          rZBBrjZ:k          
      BU         .  Y: :Z.N         
       uB1B:         B  B B         
       M.Er80        7MiUML         
      .B:S  B         jBBL          
      .B,2 :B .7UFXUY7. B.          
       782B5 ;r:,..   B .B          
         .B B       :u0.B:          
          LZU0uB.   B:Bv            
           r7;Z.M   U:8             
              EBB::irBBU,,          
               ir.:,.:r..  
.			   
              :                     
          i   BB,                   
          MMJJN1XYLN1               
          YNMi ;:r  :Bi             
        .Buk:         B             
        M:            M,            
        B            rE             
        M:           MU.            
         Mi.         Y B.           
          BE         BBvi           
          8 B1       .BJ.           
          M:kB   ..   kk            
          .k7B ;YLYv1r1B:           
           FLj0      B.B            
            B Mkj   kP.B            
            vX.LB.  B E:            
             .kiY.  G O             
              7O87::X0BY..          
               r;.,,.ri.. 
.
.
           .7   ZG:                 
           ;PPr.0BBU:               
            EkUi.: ivkj:            
           Zr         .ZY           
          M:            B.          
         ,M   .:: LFFS, YY          
         r1  UYJ:  .    G:          
          B           .JP           
          .Bj.        iB            
            MM1u     0:q            
             X;u    rUBu            
             i78    U:B,            
             PvB7Y7JBYBi            
             J0Uu   qvJ:            
              P P   M U:            
              O B   0 Y,            
              SqBi::q2B:..          
               ri.,..L: .           
.
.
.
               O1    :              
               B1U  :BB             
              iB B5UB:E7            
            :G;7::  ;;SBB           
           .B           7B          
           M:            k2         
           B.  ..         B         
           iB  YJF  j5Fi 22         
            uB.        .J2          
            Err705  BYBGi           
            B  UX7XE1O.             
            B   P.JB N              
            :E. UjBB2rY             
              BGB;Bq;BNM            
             i0:O7 .YMJB            
             ,BrE   rMJB            
            :.rBU:i:rFq,.   
.
                rL    Y             
                B7B. JMB.           
                iB;B JU:Z           
              uBGB;LLYB:B           
            ,B2       . YE:         
            B.            B,        
           :B             :B        
            B  NNZ: ir,.   B        
            7B      ;vu1   B        
             BB.         ;B:        
             F:B      .BGG.         
             ,S;O    B2B            
             .q B   Yr1.            
             01Zri;;BYiP            
            .BN,0i:i1BEBi           
             M MB    B.B.           
             :2rB    B B            
             .B.B   Z7M5            
            ..jEY:r:F0P.,  
.
                 BEu  MGB           
                 5BSS7UMYU          
               uGLi, :iBiB.         
             .E:         .1N        
             B.            N5       
            iM iP05i .      B.      
            :B    :,.q0Xj:  0i      
             iB        .:i  B       
             rO           rB;       
            JEk         ZOU.        
           u,BB        BjJ          
          ,N:B:       8B.E.         
          .M;M ,r7r7Y.LLB:B         
           BGLZ,.::rvUF B,B         
           0Z.B.      iB:Bi         
            u2XJB    BZi:B          
              8 B   v7 LU           
              GLB   O.B,            
             .YXL:i:1FN..  
.
.
                        Xi          
                  :5N52BBBvY0       
                 qO:   :vk7kBu      
                ;O         .OBP     
                77           ULB    
             .:,7B             E7   
            Y7PPUBB:           kY   
           S.Fr 71,2.         ;B    
          .E:1 .X         .v7BU     
           B.0 B         vBBrB      
           YvBMB        rB  M B     
            FB.  .:,.   5U  B B     
            B ;Pr7vYL51v JBLrML     
            B U7        7 0Bvi      
            .07kB:   :Z:U:S;        
              J:U.   B.0Xk0         
              qJB. .rNMv            
             .LE7,;ivEF    
.
.
                     EN            
                 i5kJMBB,,qM        
               :GF.YU7: 2Bk,        
              .B.       rSSki       
              Ni          L B.      
              ;U            r1      
               BY           rP      
             .Z,r          ,B       
             G.B;         BU        
             1iB        qSLL        
             7L5       :BB B        
             SS1.7j7Y7 ,B:E.        
             S07k    .2rq:Y         
             i;SL     :FLB          
              Z.YG  iBM Z;          
              :2.v  2:ivY           
              X:E:  X.B,            
             .LJk,:,YU1.   
.
.
                   .S:              
                  LMBi .kB.         
               71PM7ELPBZF          
             7q7.       GN.         
            rB           .B.        
            B  :Yr:       ,M        
            B   ,7L. qUj7  B        
            vM         ..  B        
             rB          :Bi        
              B i    .LLBG.         
              BLB     B,B           
              BMF     SYi           
              MB7B7Yij7q.           
              BLB5  .BGBr           
              E P    B B            
              q rr   N:u            
              EiS7  5i0r            
            :.iSk:i:JPZ.,   
::tuSiJi_end
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:调用
【文件功能类 】:
【文件名称   】:
::属性说明 end
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------主代码 end
::主代码 end
:a20
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 一、调用此批处理可以将一个变量的值赋值给另外一个变量
rem     另外，也可以就爱那个变量的值赋值给自身，然后将值进行显示输出或者重定向
rem 
rem 二、参数1表示被复制值的变量名称，参数2表示接收值的变量名
rem 
rem 三、调用方式
rem 
rem 四、返回值使用方法
rem %接受变量名.showvalue%，可用来输出环境变量的值，值中的特殊符号已做转义处理
rem %接受变量名.truevalue%, 环境变量原来的值
rem 
rem 五、操作手册
rem 1、显示或者重定向含有特殊符号的环境变量
rem 2、经变量赋值给另外一个变量
rem 
rem 六、原理分析
rem 利用call的双重扩展变量的特性实现只需要将变量名作为参数传入就可以取得变量值，优点是简化代码书写，缺点是效率较低(call会进行两次变量扩展)，如果要提高效率，可以参考本文件最后的例子
rem 批处理变量扩展的优先顺序
rem 参数扩展--->环境变量的%扩展--->for()变量扩展--->(若开启变量延迟扩展)环境变量的!扩展
rem call-后面的代码以上的扩展过程会进行两次
rem 
set a20_source.name=%1
set a20_target.name=%2
rem 设置方法参数
set a20_varcopy.args.targetname=%a20_target.name%
rem 调用方法
call :a20_varcopy "%%%a20_source.name%:"=" "%%"
goto :eof
:a20_varcopy
set a20_linshi=%*
set a20_linshi=%a20_linshi:^=^^^^^^^^^^^^^^^^%
set a20_linshi=%a20_linshi:&=^^^^^^^^^^^^^^^&%
set a20_linshi=%a20_linshi:|=^^^^^^^^^^^^^^^|%
set a20_linshi=%a20_linshi:>=^^^^^^^^^^^^^^^>%
set a20_linshi=%a20_linshi:<=^^^^^^^^^^^^^^^<%
set a20_linshi=%a20_linshi:~1,-1%
set a20_linshi=%a20_linshi:" "=^^^^^^^"%
set %a20_varcopy.args.targetname%.showvalue=%a20_linshi%
set a20_linshi=%a20_linshi%
set %a20_varcopy.args.targetname%.truevalue=%a20_linshi%
rem 清空环境变量
call :a33 a20_ 1 
goto :eof
::一层c
rem ----------------------------------------------------------一层c
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::varcopy高效例子
rem 变量名不能动态改变，针对特定的变量
@echo off
:start
set /p a=
set linshi="%a:"=" "%"
set linshi=%linshi:^=^^^^^^^^^^^^^^^^%
set linshi=%linshi:&=^^^^^^^^^^^^^^^&%
set linshi=%linshi:|=^^^^^^^^^^^^^^^|%
set linshi=%linshi:>=^^^^^^^^^^^^^^^>%
set linshi=%linshi:<=^^^^^^^^^^^^^^^<%
set linshi=%linshi:~1,-1%
set linshi=%linshi:" "=^^^^^^^"%
set b.showvalue=%linshi%
set b.truevalue=%b.shovalue%
echo,%b.showvalue%
goto :start
::varcopy高效例子 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a33
@echo off
if "%~2"=="" (
echo,&echo,%%2参数为空!
ping /n 2 127.1>nul
goto exit
)
rem ■将文件拖到批处理时，批处理会运行，但%2参数为空，利用这点来判断批处理是"拖动文件到程序"的调用方式(故其它调用中%2参数必须不为空)
::主代码
rem ----------------------------------------------------------主代码
rem 清空xxx开头的环境变量
rem %1变量的开头字符串  %2无意义
for /f "tokens=1 delims==" %%i in ('set %1') do (
	set %%i=
)
goto :eof
::一层c
rem ----------------------------------------------------------一层c
rem ----------------------------------------------------------一层c end
::一层c end
::二层c
rem ----------------------------------------------------------二层c
rem ----------------------------------------------------------二层c end
::二层c end
::三层c
rem ----------------------------------------------------------三层c
rem ----------------------------------------------------------三层c end
::三层c end
::四层c
rem ----------------------------------------------------------四层c
rem ----------------------------------------------------------四层c end
::四层c end
::五层c
rem ----------------------------------------------------------五层c
rem ----------------------------------------------------------五层c end
::五层c end
rem ----------------------------------------------------------主代码 end
::主代码 end
::脚本说明
rem ----------------------------------------------------------脚本说明
rem ----------------------------------------------------------脚本说明 end
::脚本说明 end
::属性说明
【调用-被调用】:被调用
【文件功能类 】:
【文件名称   】:
【参数说明   】:
%1、%2参数无意义
::属性说明 end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,即将退出!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
