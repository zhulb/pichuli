@echo off
rem ----------------------------------------------------------������
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
rem ����ͼƬ����
echo ���ڼ���ͼƬ...
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
rem ����
set /a D43_app.lastPrint=%D43_app.firstPrint%+%D43_app.size%
rem ��ʾ
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
::һ��c
rem ----------------------------------------------------------һ��c
::����1
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
::����1 end
::����2
::����2 end
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c end
::�Ĳ�c end
::���c
rem ----------------------------------------------------------���c
rem ----------------------------------------------------------���c end
::���c end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
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
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:����
���ļ������� ��:
���ļ�����   ��:
::����˵�� end
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------������ end
::������ end
:a20
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem һ�����ô���������Խ�һ��������ֵ��ֵ������һ������
rem     ���⣬Ҳ���ԾͰ��Ǹ�������ֵ��ֵ������Ȼ��ֵ������ʾ��������ض���
rem 
rem ��������1��ʾ������ֵ�ı������ƣ�����2��ʾ����ֵ�ı�����
rem 
rem �������÷�ʽ
rem 
rem �ġ�����ֵʹ�÷���
rem %���ܱ�����.showvalue%���������������������ֵ��ֵ�е������������ת�崦��
rem %���ܱ�����.truevalue%, ��������ԭ����ֵ
rem 
rem �塢�����ֲ�
rem 1����ʾ�����ض�����������ŵĻ�������
rem 2����������ֵ������һ������
rem 
rem ����ԭ�����
rem ����call��˫����չ����������ʵ��ֻ��Ҫ����������Ϊ��������Ϳ���ȡ�ñ���ֵ���ŵ��Ǽ򻯴�����д��ȱ����Ч�ʽϵ�(call��������α�����չ)�����Ҫ���Ч�ʣ����Բο����ļ���������
rem �����������չ������˳��
rem ������չ--->����������%��չ--->for()������չ--->(�����������ӳ���չ)����������!��չ
rem call-����Ĵ������ϵ���չ���̻��������
rem 
set a20_source.name=%1
set a20_target.name=%2
rem ���÷�������
set a20_varcopy.args.targetname=%a20_target.name%
rem ���÷���
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
rem ��ջ�������
call :a33 a20_ 1 
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c end
::�Ĳ�c end
::���c
rem ----------------------------------------------------------���c
rem ----------------------------------------------------------���c end
::���c end
rem ----------------------------------------------------------������ end
::������ end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:������
���ļ������� ��:
���ļ�����   ��:
������˵��   ��:
%1��%2����������
::����˵�� end
::varcopy��Ч����
rem ���������ܶ�̬�ı䣬����ض��ı���
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
::varcopy��Ч���� end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
:a33
@echo off
if "%~2"=="" (
echo,&echo,%%2����Ϊ��!
ping /n 2 127.1>nul
goto exit
)
rem �����ļ��ϵ�������ʱ������������У���%2����Ϊ�գ�����������ж���������"�϶��ļ�������"�ĵ��÷�ʽ(������������%2�������벻Ϊ��)
::������
rem ----------------------------------------------------------������
rem ���xxx��ͷ�Ļ�������
rem %1�����Ŀ�ͷ�ַ���  %2������
for /f "tokens=1 delims==" %%i in ('set %1') do (
	set %%i=
)
goto :eof
::һ��c
rem ----------------------------------------------------------һ��c
rem ----------------------------------------------------------һ��c end
::һ��c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::����c
rem ----------------------------------------------------------����c
rem ----------------------------------------------------------����c end
::����c end
::�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c
rem ----------------------------------------------------------�Ĳ�c end
::�Ĳ�c end
::���c
rem ----------------------------------------------------------���c
rem ----------------------------------------------------------���c end
::���c end
rem ----------------------------------------------------------������ end
::������ end
::�ű�˵��
rem ----------------------------------------------------------�ű�˵��
rem ----------------------------------------------------------�ű�˵�� end
::�ű�˵�� end
::����˵��
������-�����á�:������
���ļ������� ��:
���ļ�����   ��:
������˵��   ��:
%1��%2����������
::����˵�� end
::goto
rem ----------------------------------------------------------goto
:exit
cls
echo,&echo,�����˳�!
ping /n 2 127.1>nul
exit
rem ----------------------------------------------------------goto end
::goto end
