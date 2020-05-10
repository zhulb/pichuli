@echo off
rem ----------------------------------------------------------主代码
mode con cols=190 lines=50
color f0
set /a D43_app.firstPrint=0
set /a D43_app.size=63
set /a D43_app.lastPrint=0
set /a D43_app.blanklines=1
set /a D43_app.spaceCounts=6
set /a D43_app.addLength=63
set /a D43_app.cur=0
set /a D43_app.typeMode=0
set /a D43_app.pcitureCount=0
set D43_app.count=
set D43_app.loadPicture=
set D43_app.pictureTag=::tuSiJi
set D43_app.length=
set D43_app.tmp=
set D43_app.arr=
set /a D43_app.show.total=1
set /a D43_app.show.finish=0
set /a D43_app.show.totalLength=15
set /a D43_app.show.finishLength=0
set /a D43_app.show.rate=0

rem 统计数据
for /f "usebackq tokens=* delims=" %%i in ("%~0") do (
	if "%%~i"=="%D43_app.pictureTag%_end" goto :D43_finishCount
	if defined D43_app.count (
		call :D43_addCount
	)
	if "%%~i"=="%D43_app.pictureTag%" set D43_app.count=on
)
:D43_finishCount
set /a D43_app.show.total=%D43_app.pictureCount%+0
rem 加载图片数据
echo 正在加载图片...
for /f "usebackq tokens=* delims=" %%i in ("%~0") do (
	if "%%~i"=="%D43_app.pictureTag%_end" goto :D43_finishLoad
	if defined D43_app.loadPicture (
		set D43_app.tmp=%%i
		call :D43_setArr
		call :D43_showRate
	)
	if "%%~i"=="%D43_app.pictureTag%" set D43_app.loadPicture=on
)
:D43_finishLoad
set /a D43_app.length=%D43_app.cur%-1
ping -n 2 127.0.0.1 >nul
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
for /l %%i in (0,1,2) do (
	for /l %%j in (0,1,2) do (
		set b=%%i
	)
)
mode con cols=190 lines=50
goto :eof
:D43_addCount
set /a D43_app.pictureCount=%D43_app.pictureCount%+1
goto :eof

:D43_showRate
	set /p="[" <nul
	set /a D43_app.show.finish=%D43_app.show.finish%+1
	set /a D43_app.show.finishLength=%D43_app.show.totalLength% * %D43_app.show.finish%/%D43_app.show.total% 
	
	for /l %%j in (0,1,%D43_app.show.totalLength%) do (
		if %%j leq %D43_app.show.finishLength% (
			set /p="■" <nul
		) else (
			set /p="▂"<nul
		)
	)
	set /a D43_app.show.rate=100*%D43_app.show.finish%/%D43_app.show.total%
	set /p="] 已完成%D43_app.show.rate%%%" <nul
	if "%D43_app.show.rate%"=="100" (
		set /p="完成" <nul
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
                       :BBBBBBBBBui.                ..r5BBBBBBBBU                                 
                     rZBBBB2i:                            .iUBBBBBFi                              
                  :8BBBBL                                     ,2BBBBBB;                           
                LBBBBO:                                          :kBBBBB.                         
              .OBBBF.                                               7BBBBF                        
             NBBBX                                                    7BBBB:                      
            OBBBi                                                      ,BBBB.                     
          :BBBq,                                                        :BBBBv                    
         LBBB7                            ;Fui:,.                         FBBBB.                  
        7BBBL                           .iU8GMkSY7i777:.                   JBBBB.                 
       :BBBZ                          ..ri...      ..iv:                    JBBBB:                
       BBBB.                    ::      .ir:   rkZBBBBG,                     JBBBB                
      UBBBr                    2NJr     .rr:,UBMBBBS7;.                       uBBB5               
      BBB2                    GB;70u.    :::LBB. .  .                          SBBB.              
     7BBB.                  UMk.iL1SN:    ...  ,,.,                             BBBM              
     NBBF                 :BBO ,iqOS1U.                                         rBBBr             
     BBB7               iqq,  NBBBBBU;:.                                         0BBB             
     BBB:              .jL .Y0BBBBFL:...       .   ,::                           YBBB,            
    ,BBB,                 rBBB277:  . ,,           .irLYL:,.,,.                  ,BBB7            
    :BBB                 ,MMLi       :,,       .iL7    iLj7;:,.                   BBB1            
    :BBM                  .         r,      .,8BBS,     ,:i::..                   BBBF            
    :BBB                           :Y:iLBBBBBBBr     .:vL;   .                    BBBU            
    :BBB:                         .i. rr777i:.   ,j5vvLOBB                       ,BBBr            
     BBBv                         ,,           JEOj,   rBJ                       YBBB,            
     2BBB.                       :Yi.   .YBBBZL.    :PBB1                       :BBB:             
     :BBBX                      .7r;..J8BBB7       SBBB8                       .BBB.              
      SBBBS                     :;:,,BBB2   ;MMXBBBBGL7                        JBBBBBOY:.         
       BBBBL                     .   YBBB5MBBBBBBBr   :.                         :kBBBBBBBv.      
       .BBBB;                           ,GBBBP:      ..                              .JMBBBBB     
        LBBBM                              ::      ,..                                   UBBBB:   
         :BBBBr                               .::::..                                      rBBB0  
           BBBBF                              ..                                             BBBr 
OBq.        7BBBqi                                                               jZ.         NBBZ 
BBBBB5,      MBBBBB;                                                            XBB:         7BBB.
BBBBBBBBBMBBBBBBBBBP                                                            BBB.         iBBB.
Z   ;MBBBBBBBML,.i:                                                             MBBi         rBBB.
Bv     .,,,                                                                     jBBO         MBBM 
BB                                                                               GBBG      :MBBB: 
BBBJ:                                                                             BBBq   .BBBB8,  
:EBBBBMj,                                                                         .BBBBB8BBB0     
  YZBBBBBBBqSU5U51kkES2MU                                                          :ZBBBBBB0      
     .rNBBBBBBBBBBBBBBBBBB                                                            ;jEBBY      
           .::i::::,,. :BBB,                                                             8BB:     
                        .BBB2i                                                           1BBM     
                          BBBB.                                                          vBBB     
                           BBBBY                                                         ;BBB     
                           .BBBBU                                                        :BBB.    
                             .BBBN                                                       .BBB:    
                              :BBBB,                                                      MBB7    
                                UBBBF                                                     5BB1    
                                 7BBBU                                                    jBBS    
                                  rBBBBP                            ,ZO7                  2BBq    
                                    qBBBB.                          :BBBB2i               EBBu    
                                     iBBBBB;                          .2BBBBBBBBMEur,    .BBB7    
                                        BBBBG.                           :UMBBBBBBBBBBS. .BBB:    
                                         :ZBBBBL                                 ::LSBBBOMBBB     
                                           ,BBBBBBS                                   MBBBBBM     
                                             :SBBBBBBZi                                SBBBB:     
                                                7uBBBBBBBBE;.                           2BBM      
                                                    ,rXBBBBBBZ               ,:7YUUP2,   7BBZ     
                                                          rBBBBBM2L7LjkNBBBBBBBBBBBBBBkrrXBBB     
                                                             iUBBBBBBBBBBBBBBBN7r7ir1BBBBBBBB,    
                                                                  ..,,,..  YBB8      ,BBBL :r     
                                                                            MBBB,  ..kBBB:     

                                  .rFG8BBBBBBBBBBBBBBBZXv:.                                      
                             .7SEBBBBBBBBBBBBBBBBBBBBBBBBBBBBML:                                  
                         :8BBBBBBBBBBuLr:..           .:v5MBBBBBBBY                               
                      7BBBBBBB27:.                           i5BBBBBBU.                           
                   .EBBBBB5.                                    .jBBBBBG                          
                 :ZBBBBk.                                          ,NBBBBL                        
                uBBBBB:                                              :BBBBM                       
               FBBBM:                                                  iBBBB:                     
             7BBBB7                                                     .8BBBY                    
            LBBB1                             .                           7BBBG.                  
           rBBBZ                            rBBBMGEj;,.                    LBBBM                  
          ,BBBZ                          ..i;i;Lriiri7j5Y7:                 0BBBN                 
          ZBBB.                           :::,,       .:vL:                  8BBB1                
         UBBBr                    :Y:      :r7.  ,jBBBBBBq.                   BBBB.               
        :BBBS                    YBrjY     .ii:5BBU77...                       BBB8               
        LBBBr                   2Bri7OYr    .:.j;,..,i:.                       rBBB.              
        MBBB,                 7BB,.rSJ2kU                                       MBBG              
       .BBBB                .;BZ..r5BB11U:                                      rBBB.             
       iBBBF              ,1XL. YBBBBB1vi.        .                              BBBU             
       JBBBY              .,  vBBB0P2:.....          .iLr:..   ...               2BBE             
       jBBB7                iUBBj:..    .:,         ,   ,:YuLi::,.               iBBB             
       LBBBL               .rji        .:.       .jBO.    .;7v:...               iBBM             
       :BBBJ                          iY;  7Fv;;BBBi       .:,,..                iBBZ             
       ,BBBN                         .r7:YMBBBBBB0.    .:v5Nv   .                jBBj             
        0BBB.                        :.   .        7P2v,, 2BM                   .BBM              
        7BBBi                       .i.       :rrUEL.    .MB.                   vBBX              
        .BBBP                      .vr:.  78BBBY      rBBBB.                     vBBBY            
         7BBB:                    .;Li::7BBBr      :SBBBBBi                       .BBBF           
          JBBB                    .::...OBB. ,ZBBBBBBBv .;.                         GBBBL         
           BBBF                    ..   .FBBBBBBBBBk,   .i.                         .BBBB.        
            MBBB                           .L2B5,      .                 .:,.        iBBBL        
             BBBBj                                 .,:,.               1BBBBBBBBPL    BBBN        
NMBU:          YBBBGUi                          ..i:..               ,BBBOqBBBBBBB7   GBBM        
BBBBBU       .:XBBBBBBY                                              5BB7    .:L17    PBBB        
BuiBBBBkFuUUBBBBBBr ,:                                               JBBU             OBB8        
Bv  0BBBBBBBBBB0.                                                    :BBBL           .BBBu        
BB    :i7vY7i.                                                        iBBBZ          ZBBB,        
BBU                                                                    .BBBB0ur:   vBBBBBv        
BBB7                                                                    .1BBBBBBBBBBBBGBBB.       
:GBBBF.              r                                                     .ru2SUr,7:  uBBF       
  0BBBBX;..         vBB.                                                               :BBB.      
    ;BBBBBBBBBBBBBBBBBBBi                                                               JBBF      
      ,Y0MBBBBBBBBBBBOBBBS                                                              iBBB.     
                       MBBB                                                              BBBL     
                        PBBBr.                                                           qBBG     
                         ,BBBB.                                                          FBBB     
                          rBBBBr                                                         YBBB     
                            PBBBB;                                                       rBBB     
                              MBBBP.                                                     iBBB     
                               .8BBBB                                                    ;BBB.    
                                 rBBBBui                             .:                  iBBB     
                                   qBBBB0                           ,BBBL,               rBBB     
                                    .BBBBBu                          rBBBBBMU7i..        vBBB     
                                       iBBBBM:                          7BBBBBBBBBBBB5.  2BBB     
                                         uBBBBB:                           .71GBBBBBBBBBZBBBU     
                                           :MBBBBBL                                ,rEBBBBBN      
                                             .XBBBBBGi                                iBBBB:      
                                                1MBBBBBML:                              uBBO      
                                                   JBBBBBBBBMu:                          qBBL     
                                                      .7kBBBBBBBM.               ,ikMB8PjMBBB     
                                                            ,uBBBBBNFUULYvY1GMBBBBBBBBBBBBBBB     
                                                               :jBBBBBBBBBBBBBBBBGui  7BBBBBq     
                                                                   .::;;7r:7BBM       :BBEi.      
                                                                            BBBO:.   iBBB.        

--
                                            .::;i;ii::.                                           
                                    .LN8BBBBBBBBBBBBBBBBBBB2r.                                    
                               ,rZBBBBBBBBBB05LYvYvJJFqMBBBBBBBMv                                 
                            ;YBBBBBBBUi:                  .:UBBBBBE,                              
                         iMBBBBBM7                             7BBBBBu                            
                       7BBBBBBL.                                 LBBBBBL                          
                     LBBBBSi                                       iXBBBN:                        
                   5BBBBU                                             XBBB8                       
                .FBBBBY                                                .BBBB:                     
               .BBBBj                                                    2BBB5                    
              iBBB0                                                       :BBBB.                  
             YBBBr                              :,.                        :BBBB                  
            iBBB:                              UBBBMN0L:::,.                iBBB8                 
           ,BBBJ                            .i7:,,:.    .:7vY,               :BBB8                
          .BBB2                      ..      ::i::    ,YP1uNU.                :BBB:               
          8BB2                      .N1J:     iri,.ZBMBBBF77,                  UBBM               
         7BBB.                     .8YiYF.    ,ii:7BP.:,  .                    :BBB               
        ,BBB1                     YBS:r7PSr.   ...:,,i:::.                      GBBL              
        7BBB:                    qBv iukFFqv                                    :BBB              
        0BBB.                 :kB7.,UMBBBNJv,                                    BBB:             
        MBBq                 .Ur .UBBBBBXr:,.        .  .,..                     SBBj             
        MBBS                    rBBNU7r:   .,           .:7LJ7:..                iBBO             
        ZBB8                   rBB2:..     ,,          :    .Y5k2Ur,             .BBM             
        2BBB.                  ::         7,       ,NBBr     iSPBBBBBE5r.         BBU             
        iBBB;                            r2, LMMFSSBBZ      .X.  7EBBBBBBBBM0GMq. kBB,            
         1BBO                           ,i.,kMBB8P5:   .i7LXBBi     .rFMBBBBBBBG.  OBBi           
         .MBBr                          :.          .Y0ki.  ;B7          ..,,.      BBB7          
          :BBB,                       ,:L:    .UBBBOY.    .YBB0                     ,BBBJ         
           1BB0                       i7r:  :GBBBBr      S8EBBBr                     ZBBO         
            GBBq                     :L7i,iBBBi    7.,GBBBSi:5BBF                    :BBBi        
  ,.        .BBB:                    .,,. .BBB.:EBBBBBBB7.    EBBE                    BBBk        
BBBBBj        8BBF.                         :jBBBBBB2i         7BBBXi                 YBBB,       
BBBBBBB7..:LNBBBBBBq.                           i7:      .      .BBBBBBZ7ri:i7L;      ,BBBU       
BY :BBBBBBBBBBBBZBBBBMj,                             .:::.        UBBBBBBBBBBBBBE     .5BBB       
q    MBBBBBBBPr.  .JOBBM                           .,:..             :YZBBBBBBB0,      :BBBi      
BY    .,:..                                                                             5BBP      
BB7                                                                                     iBBB      
BBBv                                                                                    .BBBr     
LBBBB,               :                                                                   EBBX     
 ,BBBBY:.           .BB                                                                  1BBB     
   FBBBBBBBBEk1FPMBBBBBB,                                                                LBBB     
     rq8BBBBBBBBBBBBBYBBBr                                                               iBBB     
           ,:vvYr:.    BBBJ                                                              :BBB.    
                       .BBB2                                                             .BBB     
                         FBBBB                                                           ,BBB.    
                          qBBBS                                                          .BBB     
                           7BBBB1                                                        ,BBB.    
                            .iBBBM.                                                      :BBB     
                              .OBBBB:                                                    ;BBB     
                                iBBBBL                               rBF.                7BBB     
                                  ZBBBBO                             UBBB5.              uBBB     
                                   ,GBBBB7                            :MBBBBJi,          FBBX     
                                     :OBBBBB:                           :NBBBBBBBBBBBBM2UBBB      
                                        jBBBBBL                            .rU8BBBBBBBBBBBB.      
                                          :OBBBBq1:                                   :uBBB7      
                                            .XBBBBBBj,                                  .BBBi     
                                               7BBBBBBBGYi                               2BBM     
                                                  :NBBBBBBBB8r                           ,BBB     
                                                      ,vFBBBBBBBBBN:              :jXMXL  GBB:    
                                                           .LOBBBBBBNi.     .:7FBBBBBBBBBBBBB:    
                                                                .SBBBBBBBBBBBBBBBBB7 iBBBBMO2     
                                                                   ,jGBBBBBBBBBB,    :BBB:        
                                                                            :BBB    7BBBE       
--
--
                                      .::r7jLLi:::..                                             
                               .:uOBBBBBBBBBBBBBBBBBBBBBM8Ur.                                     
                           ,1EBBBBBBBBBBXLi:::i;L7J5GMBBBBBBBB8v.                                 
                         rBBBBBBB2:.                     :LMBBBBBB5:                              
                       YBBBBBM:                              iXBBBBBB7                            
                    .2BBBB5:                                    .YMBBBBM:                         
                   FBBBB7                                           vBBBBBr                       
                 YBBBBL                                               .UBBBM,                     
                BBBBP                                                   .qBBBS                    
              .BBBM:                     SBB0SjL,.                        :BBBB:                  
             :BBBL                    .,r7YJF7LL77UFu;:                    .BBBB:                 
            .BBBi                    .:ii,..       ,rF;                     .BBBBi                
            XBBO              .YY.      i7i  :EBBBBBBM:      .vL;             1BBBi               
           rBBB:              M1vu,     :;i:BBFLUY:..       LBBBBBi            5BBB               
          :BBBi             qBJ:rS8r.    ,,:L.:::::       LBBBBPBBB5            8BB1              
          YBBG             NBB :vUUPY    . . .:,..       iOBBB  0BBB:           :BBB              
         iBBB,           rBX: iuMBM2F:                  :kMBG   .BBBB;           2BBk             
         NBBq          iFP, rSBBBBMYr,                  7FEG.    iBBBBJ          ,BBB.            
        :BBBv          .. rBBBGkNr.....           :YUr,.7FMN      .MBBBBr         BBBr            
        iBBBi            uBBJ7,,.    :..         .  .:7JJOBB:       rBBBBBJ       XBB1            
        iBBBr           ,Lr        .;        .UBBU    .iYqBBG         .JBBBBB     FBBk            
        :BBBi                      7L   ,,..iBBB:      ..uZBB.          iNBB0     UBBP            
        :BBB7                     i;:UBBBBBBB2.    .ivNN: jZBE                    MBBL            
        .BBBL                    .i  ::,..     ,J1uri.2BN .0MBu                   OBBr            
         PBB0                    ::       :7J1Xi.     GB    5BBBi                  BBB:           
         rBBB.                  :vi.  ,rBBBBL.     ZBBB:     7OB;                  YBB0           
          kBBU                 ,L;:,rBBBq       8BBBBBY                             BBB1          
          :BBB                 :i:.,2BBB   vBB8BBBBFiL.                             UBBBi         
           rBBM                 .    YMBBBBBBBB5:    ,.                              BBBM         
            YBBG                        rqBBJ.                                       UBBB:        
jOBBq7.      0BBEi                              ..:.                                 ,BBBu        
BBBBBBBMi,:j8BBBBBBY                         ,:i,,.                                   8BBB        
BBMiXBBBBBBBBBB0:1B7                          .                                       FBBB:       
BBG  .ZBBBBBPr                                                                        iBBBF       
BBE                                                                                   .5BBB.      
BBB.                                                                                   :MBBY      
BBBE                                                                                    UBB8      
 PBBBS.             0B:                                                                 ;BBB.     
  MBBBB8v:,         BBN                                                                 :BBB:     
   .7BBBBBBBBBBBBBBBBBBi                                                                 BBBY     
      .rS0MBBBBBBBBBMBBB:                                                                ZBBF     
                 .   iBBB5                                                               NBBF     
                      iBBBk                                                              5BBM     
                       ,BBBB.                                                            FBBB     
                        :BBBBS                                                           YBBB     
                          FBBBB:                                                         7BBB     
                           LBBBBq                                                        :BBB     
                             ,BBBBJ                                                      :BBB.    
                              .XBBBB1                               .BBBi                .BBB     
                                .BBBBO.                              2BBBB;              .BBB.    
                                  1BBBBBr                             ,0BBBM:             BBB     
                                    :BBBBBBv                            .MBBBBBBBBBBBBB8i1BBM     
                                      72BBBBBU,                           ,XBBBBBBBBBBBBBBBBi     
                                         :5BBBBBEki                             ....  rBBBBU      
                                            7MBBBBBB87.                                .MBBB:     
                                               i8BBBBBBB8U:.                            :BBBB     
                                                  .UBBBBBBBBBM5i.                        7BBB.    
                                                       :7PBBBBBBBBG7              iMBBMZrjBBBj    
                                                             ,Y2NBBBB1,       :YBBBBBBBBBBBBB2    
                                                                  iBBBBBBBBBBBBBBBBu. PBBBBBB.    
                                                                     rGBBBBBBBBBL     BBBZ:,      
                                                                            .BBB.   iBBBB.        

--
                                     i7jkZGBBBBBGGFjri.                                           
                               .vZBBBBBBBBBBBBBBBBBBBBBBBMSi                                      
                           :jNBBBBBBBBNPYr::   ..,:7YSGBBBBBBBU:                                  
                         iBBBBBBBX;.                    ,7EBBBBBBU.                               
                      .0BBBBBBr.                            .1BBBBBBu.                            
                     uBBBBBk:.                                .7BBBBBBq,                          
                  .1BBBBGL                                       :jBBBBBU.                        
                 JBBBBB:                                            :ZBBBBq                       
                BBBBBJ                                                .2BBBB,                     
              ;BBBB5                      .0BBBNqSv:..                  :OBBB5                    
             rBBBB,                     .;rii7Lirri7JFYr:                .NBBBB.                  
            ,BBBM                       ,i:,,.      ..7L:            iBBBBBBBBBB.                 
            PBBB.               .7:      ,i7,  iPBBBBBBN.           FBBB08BBBBBBB.                
           PBBBu               iBuYFi    .ii:7BBi:j...             vBBBr   rBBBBBB                
          YBBBS               2Buir0P,    .:.75,,:.i:,             uBBBU    rBBBBBk               
         7BBBq              70B, :S2uk7:                           LBBBP     iBBBBB:              
         OBBBi             SBB. :2BBZJjJ                           vBBBM      XBBBBS              
        7BBBq           .7k;. JBBBBBMi::                           iBBBB       EBBBB.             
        PBBBr           .:  vqBBONUr.. ..          ,iv7:,,         :BBBB       :BBBB:             
       .BBBB.             ,BBBJ:,.    .,:             .:YJi.       :BBBB        2BBB.             
       iBBBq              :1i,       ::,       :PMB.    .;i,       7BBBB        .BBB,             
       YBBBL                        .5,  7SYri2BBS,      ., .      vBBBS         jBBi             
       UBBBL                        :r:;NBBBBBBU      :LFPi        5BBBu         5BZ              
       7BBBY                       .:   .        :FUu:. 2BZ       .BBBM          vBB.             
       :BBBX                      .;,       :riFk2i    .MB.        7EU            BBB.            
        BBBB.                    .L7;   iZBBB5,     ,MBBB.                        ;BBq            
        2BBBi                    iYi::UMBBu.      LBBBBBi                          BBB:           
        :BBBP                    .:..:BBB:  PBBBBBBBU .;.                          JBBX           
         XBBB.                   ..   ,rMBBBBBBBBB7   .i.                          .BBBr          
          YBBB:                           7uBE;                                     YBBBi         
           iBBB7                                 ..::.                               BBBq         
kBBBP:      :BBBqi                            .,i::..                                YBBB:        
BBBBBBBBMk5EBBBBBBB                                                                  .BBBU        
BB::BBBBBBBBBBMr0BF                                                                   OBBG        
BB.   ,iYFUJ:                                                                         vBBB:       
BBP                                                                                   :BBBk       
BBO                                                                                    7BBB:      
BBB7                :                                                                   kBBS      
EBBBG,             BBO                                                                  :BBB.     
 vBBBBZ7,          kBBi                                                                 .BBBY     
  ,0BBBBBBBBBEUYLj70BBB,                                                                 kBBB     
     :XOBBBBBBBBBBBBBBBB:                                                                7BBB     
           .:LjF5UL: rBBB1                                                               :BBB.    
                      ;BBBP                                                              .BBB.    
                       :BBBB:                                                            .BBB,    
                        ,MBBBO                                                            BBB.    
         ;.       :i.     JBBBBY                                                         .BBB,    
        FBBj      BBB.     :MBBBBi                                                       .BBB.    
       rBBL      FBB:         MBBBM:                                                     iBBB     
      :BB   XBr :BBBBBBBBB8    :MBBBB                                UBU                 vBBB     
     :BB   rBB: BBMiivrLBBk      jBBBBF7                             NBBY                1BBB     
     BBBZZBBB  rBB      JBU       .FBBBBB7.                           kBBBU,             FBBN     
     .   BBB  GB0.,7    MB;          rBBBBBBY                           BBBBBBBBBBBBBBBEUBBBi     
        XBL   .: ,BBB   BBr             vBBBBBBi                         .UBBBBBBBBBBBBBBBB7      
     .ZBBM7YPO,   iBBB  BB:                LBBBBBBBY:                                 7BBBB;      
     ,BBBOBBB0     Yu, .BB:                  .UBBBBBBBBui                               JBBBi     
              .        .BB:                     .:uBBBBBBBBOL:                           GBBG     
     7LY0MBBBBB         BB.                          :1BBBBBBBBBBkr                      ;BBB     
     BBBBMPji:.    .FqSBBB                               .:LkBBBBBBBL            .JBBBBBqZBBB     
      .             FBBBBi                                      ,0BBBBJ.     .:YBBBBBBBBBBBBB     
                     ..                                           ,PBBBBBBBBBBBBBBOi ,BBBBBBU     
                                                                     i0BBBBBBBBBBB   ;BBBi        
                                                                              OBBJ  7BBB0        
--
                                 iUOBBBBBBBBBBBBBBBBBBBBBGj:                                      
                            :rBBBBBBBBBMSr;:,...,.:rUEBBBBBBBBZr                                  
                         :SBBBBBBZLi.                   .ijMBBBBBBJ,                              
                      .FBBBBBB7.                             .YEBBBBMr                            
                    :MBBBBBi                                     i1MMBGj                          
                   LBBBBZi                                         ;qBBBX,                        
                 LBBBBN.                                             :JBBBN:                      
                BBBBB:                                                  GBBBU                     
             .2BBBBr                           .                         :EBBMi                   
            :BBBBr                         .7kqSr,     ...;1L              SBBBU                  
            BBBB                    .::rJGBBM2i7J7    .;;i7BBB.             qBBBU                 
           OBBBi                   .7Y2jjji..:r117    .:i:,.7XBP,            uBBBu                
          qBBB:                      .,,:r7LYPFS5J.   :7i,     u5i            7BBBr               
        .BBBB.                    .JBBBBBBBBBBBj5U.   ::::r;r:   7O7           :BBB               
        PBBB7                     .iLLrr;L1SFkULrr    .,7BBBGBBBk,:5Y.          BBB,              
       YBBBk                                   .         .::  iU8BBr.         .iBBB:              
       BBBB:                                 ...          :;i,   .r,         :BBBBBBL.            
      kBBBY                                ,i,,.              .            :0BBBBMBBBBL           
      BBBM.                              :vL           .                 iSBG7.    2BBB0.         
     .BBBv                            ,:i..7F22,         .,             SBB:         kBBL         
     :BBBi                         .:Lri   .SBBB2L:rvj;:  i2r         .5B8.       i7 jBBG         
     ,BBB:                        ivv:,        UBBBBBBZr    Lv       ,ZBU        .BBBBBBu         
     :BBB:                       .:::,...:::.    ..          57.     YBB         .BBBBMY          
     .BBBr                           :BBBBBBBBBq;ir::       :7jr:,. :8BX          BBBY            
      BBBN                           .BBB      ::iiLr77YJ7i:irri,:. .MB8          5BBN            
      7BBB7                            .BBZSkU:         .BBB: ....    .           ,BBB:           
       MBBG                             iBBBBBBBEOqLOBMNBBZ;   .                   FBBU           
       :BBBL                             .rrrrSBBBBBBBBZr                           7BBM,         
        8BBB                                       ,7P:                              BBBU         
         qBBq                             .,, .    .,                                YBBB,        
          iBBE                            .,::::..                                   :BBBv        
BBFY7,     iBBBPr.                                                                    OBB0        
BBBBBBBB8XqBBBBBBB:                                                                   7BBB:       
; LOBBBBBBBBB8rLE7                                                                    ,BBBN       
B.   ,7SEMZS:                                                                          rBBB:      
BN                                                                                      XBBj      
BB7                                                                                     iBBB      
BBBS.              ,M5                                                                  .BBB:     
:MBBBY             1BB:                                                                  GBBY     
  BBBBE;:.         iBBF                                                                  kBBS     
   vBBBBBBBBBBNkuU1MBBB:                                                                 SBB8     
     :FEBBBBBBBBBBBBBBBB.                                                                LBBB     
            .i7jJuv: ;BBBi                                                               rBBB     
                      LBBBi                                                              iBBB     
                       vBBB:                                                             iBBB     
                        XBBBL:                                                           :BBB     
         i.       ::.    :BBBB                                                           iBBB     
        5BBu      BBB.    .Oj: ,;rL7rr  ZBEP0Nq5q05     :rj5PFFLi                        iBBB     
       rBBL      FBB:          BBBOBBB  ZMj1NGkMBBM    7BBBBBBBBBBU   .                  rBBB     
      :BB   XBr :BBBBBBBBBZ    ZB:  BZ    :.   .BBY     r.     .BBBv  BB                 rBBB     
     :BB   rBB: BBOiivrLBBk    ZB:  B8   ZBB   rBBi             SBBY  BBB7               LBBB     
     BBBZZBBB  ;BB      jB2    ZB:  BZ   BB1   JBB.            UBBS   LBBBBr             UBBB     
     .   BBB  GB0.:7    MBi    GB:  B8   BBi   XBB           1BBB.      LBBBBBBBBBBBBBBJiOBBj     
        kBL    : ,BBM   BBr    0B.  BE   BBBNqEBBBZBv       ZBBY          rOBBBBBBBBBBBBBBBJ      
     .EBBMrLPO,   iBBB  BB:    EB2.rBE   LjLLJL7i7BBL      YBBi                       1BBBN       
     ,BBB8BBB0     Lj, .BB:    0BBBBB8            LBi  ,.  .MX                          qBBB.     
              .        .BB:    8Br ,BB:rBBBBBBBB  PB: :BB.                               MBBG     
     7LL0MBBBBB         BB.   .BBi  i: :NYJYY7Jr  ZB. vBF  SBBO  UBi                     :BBB     
     BBBBMPJi:.    .FNSBBB     :r.            .irFBB.  .   MBBB  NBBq.           ,YMBBBBq0BBB.    
      .             FBBBBi                    JBBBBi        ..   iBBBBOi     .:UBBBBBBBBBBBBB     
                     ..                        ..                  i8BBBBBBBBBBBBB5, FBBB1i:      
                                                                      rXBBBBBMBBBF   BBBX         
                                                                              PBB5  ZBBO.    

--																			  
                                 :;Y1OBBBBBBBBBBBB0Ji:                                            
                           ;NMBBBBBBBBBBBBBBBBBBBBBBBBBBBOY,                                      
                       iPBBBBBBBNui:.              :7UEBBBBBBBUi                                  
                     rBBBBB1i.                           ,YGBBBBBq:                               
                  .qBBBBU.                                   .jBBBBBk,                            
                 UBBBBG.                                        :kBBBBX.                          
               iBBBBY.                                             :UBBBL.                        
              kBBB7                                                  .5BBBS                       
            .BBBS                                                      .8BBM.                     
            BBBB                                                         rBBB2                    
          .BBBq                             .i:                            MBBB.                  
         .MBB1                           i1G025.     .::YBG:               .BBBO                  
         BBB0                    .ir71XEMOSL:rFi     :iiikBBk.              :BBB1                 
        SBBB,                     ....,,,..iY5M:    .ir:, ..;MF              iBBBL                
       :BBBU                     .:YUGOMBBBBMUSY   .:r:.      ;P7             5BBB                
       ZBBM                     .LBBBN0qMBBBB1jr    :.iGBBBBEi. iXi            qBB:               
      .BBBY                      .....::7L7L;rr:    ..iMMF7BBBBS:vU:           LBB7               
      kBBM.                                 ...         ,:. .:YPB7          1BBBBBBBL             
      BBBJ                                 ..,           .:::.             LBBBBG8BBBB            
     .BBB,                              :ri                             .YBBG,     qBBM.          
     iBB0                            .:iiL.                            .OBBr        5BBBi         
     7BBq                          :r:,. iMBBGi        .r:            :GBM.       OBu8BBX         
     LBBk                        ,;Lv.    .XBBBS7YqOFL. :5Y           1BBi       .BBBBBBJ         
     iBBE                       :r7::         vNSU2jvi    :ur        :BBL         ZBBBMi          
     .BBB:                     .....iPBBBBBEr             .v5r       rBB.         YBBB.           
      EBBO.                         2BB5irY58ESu51kvri,   :rLr:::    .BBi         ,BBB:           
      ,BBBU                          BNi            ..LBBXi:::...     ,q.          BBBP           
       ;BBB1                         :BBBBBBZ  .   :. .BBM.  ..                    :BBBk.         
        FBBB;                         :UBBBBBBBBBBBBBBBBr.                          NBBB7         
         :BBBj                          ....:7L2kSMBB2,                              qBBB.        
           7BBB;                                  .:                                 .BBB7        
uBB8j:     :BBBBk,                      .::,,.. ..,                                   2BBG        
:2BBBBBBBBBBBBPZBBBv                       ....                                       .BBBL       
U .qBBBBBBBBBi  rEBY                                                                   YBBB       
B:   .iLYLi.                                                                           .PBBL      
B2                                                                                      LBBG      
BB.                                                                                     :BBB.     
BBB,               .05                                                                  ,BBB:     
GBBBM.             ,BBk                                                                 .BBBL     
 ;BBBB7.          :7BBB                                                                 .MBB1     
   XBBBBBBM85JYkBBBBBBBP                                                                 MBBS     
     LMBBBBBBBBBBBBF:OBB7                                                                NBBM     
         .,i7uYL,     BBBY                                                               PBBB     
                      rBBB:                                                              FBBB     
                       5BBB.                                                             kBBB     
                       .BBBO,                                                            FBBB     
         i.       ::.    EBBBM                                                           kBBB     
        5BBu      BBB.    7BU: ,;rL7rr  ZBEP0Nq5q05     :rj5PFFLi                        1BBB     
       rBBL      FBB:          BBBOBBB  ZMj1NGkMBBM    7BBBBBBBBBBU   ;.                 PBBB     
      :BB   XBr :BBBBBBBBBE    ZB:  BZ    :.   .BBY     r.     .BBBv  BB.               .BBBZ     
     :BB   rBB: BBOiivrLBBk    ZB:  B8   ZBB   rBBi             SBBY  OBBL              iBBB7     
     BBBZZBBB  ;BB      jB2    ZB:  BZ   BB1   JBB.            UBBS   rBBBBU.           jBBB      
     .   BBB  GB0.:7    MBi    GB:  B8   BBi   XBB           1BBB.      jBBBBBBBOMBBBBBBBBB:      
        kBL    : ,BBM   BBr    0B.  BE   BBBNqEBBBZBv       ZBBY          .kBBBBBBBBBBBBBBL       
     .EBBMrLPO,   iBBB  BB:    EB2.rBE   LjLLJL7i7BBL      YBBi               .i;ri::,:2BBBr      
     ,BBB8BBB0     Lj, .BB:    0BBBBB8            LBi .OY  .MX                          uBBB,     
              .        .BB:    8Br ,BB:rBBBBBBBB  PB: iBB.       .....                   BBBS     
     7LL0MBBBBB         BB.   .BBi  i: :NYJYY7Jr  ZB, :BJ  SBBO  XBBB:               .:.,EBBB     
     BBBBMPJi:.    .FNSBBB     :r.            .irFBB.      MBBB  1BB5             7BBBBBBBBBB     
      .             FBBBBi                    JBBBBi        ..   uBBBBq,       :ZBBBBBBBBBBU.     
                     ..                        ..                 .5BBBBBBBB8BBBBBBJ .MBBJ        
                                                                     rMBBBBBBBBBO:   vBBBi        
                                                                          ..rBBB.   uBBB2         

																		  
                                  ,iU0MMBBBBBBBBB8Xi.                                             
                             ,LEBBBBBBBBBBBBBBBBBBBBBBBMSv:                                       
                         :MBBBBBBBXvi..         ..:LXMBBBBBBBBU,                                  
                      7BBBBBNF:.                        .:7SOBBBBq;.                              
                   :MBBBBE:                                   iFBBBBBL                            
                 iBBBBE:                                         :UBBBB8                          
                PBBBB:                                              jBBBB,                        
              :8BBq:                                                  rBBBE.                      
             NBBB,                                                      MBBB.                     
            qBBG                                                         rBBB,                    
           XBB2                               ..YkBP:                     ,BBBr                   
          1BBS                      ,5JL     ,i;:iYBBB2,                   vBBB:                  
         SBBE                     Y8BrLu:    .:::,.   vUU;.                 8BBB                  
        rBBB.                 .iLMBY::YqY    ,i7,.      .7UJ,                BBB0                 
       .BBB;              .7U2qY7: .iFUU0:   .i::iMBBBBBB2YvL,                MBBZ                
       qBBF                ..  :rqBBBBMq1j    ..vPBJ.JSNO8BM:                  BBB.               
      iBBM.                .L2BBBBBMB8Fu7i.        ::::..                      rBB5               
      YBB5                 LBBO577vjr:.,,.           ...                       ,BBM               
      OBB:                              ..                                      0BB.              
      BBG                            ..:,        .                              7BB:              
     .BBN                           ir              :r:                         :BBu      ,i7Lv:  
     ,BBk                         .iir::rr.    :iri  :YJ,                        BBN   ijBBBBBBB0 
     .BBN                        .:. .5EBBBBM8BBB8Y    :2Yi....                  0BP:5BBBBBBBBBBBB
     .BBq                      .ir.      rUMBZL:       .iYLi::..                 iBBBBBBBBL.  JBBB
      BBB.                    iLL:                 ..  ,iir:...                 ,1BBBBX:      ,BBB
      kBB7                   .rr:::7XBBBBBBOUFUPLY77YEBB: ....               :BBBBBBP.        rBBB
      :BBM.                   .  .BBB7               iBE    .                ,8BBk:          :BBBB
       qBBU                       :BB.  .rY,  : i1BBBBL                                      BBBB7
        BBB7                        :BBBBBBBBBBBBBBB0                                      vBBBBJ 
        rBBB.                        ;BBBBM8GFUvirYr                                     iBBBBBO  
         ,BBB                                     :                                    :GBBBBu.   
  r:       SBB.                          ....... .                                    .ZBB7:      
1BBBB:    .UBBBF                        ..:,,..                                       .FBO        
BBBBBBBBBBBBBBBBB0                                                                     YBB:       
BB:iBBBBBBBBr  :Or                                                                     iBBk       
BB   .,:,.                                                                             .qBB.      
BB,                                                                                     5BBi      
BBX                                                                                     LBB5      
BBB;               YB:                                                                  iBBk      
GBBBL              BBB.                                                                 ,BBB      
 YBBBJ,          :uBBB1                                                                 ,BBB.     
  vBBBBBBOPFUFEBBBBBBBB:                                                                .BBB.     
    ;XBBBBBBBBBBBBX,iBBB.                                                               .BBB,     
        .::rrr:.     iBBB:                                                               BBB,     
                      YBBB:                                                             .MBB:     
                       2BBB;                                                            .BBB,     
                        0BBBUi                                                          .BBB,     
         i.       ::.    :BBBB                                                          iBBM      
        5BBu      BBB.     ZJ, ,;rL7rr  ZBEP0Nq5q05     :rj5PFFLi                       UBBU      
       rBBL      FBB:          BBBOBBB  ZMj1NGkMBBM    7BBBBBBBBBBU   JJ               .EBB;      
      :BB   XBr :BBBBBBBBBG    ZB:  BZ    :.   .BBY     r.     .BBBv  BBB7             rBBB.      
     :BB   rBB: BBOiivrLBBk    ZB:  B8   ZBB   rBBi             SBBY  iBBBBL           PBB5       
     BBBZZBBB  ;BB      jB2    ZB:  BZ   BB1   JBB.            UBBS     BBBBBMj,      ;BBO        
     .   BBB  GB0.:7    MBi    GB:  B8   BBi   XBB           1BBB.        iBBBBBBBBBBBBBBN        
        kBL    : ,BBM   BBr    0B.  BE   BBBNqEBBBZBv       ZBBY            .LZBBBBBBBBBBBB       
     .EBBMrLPO,   iBBB  BB:    EB2.rBE   LjLLJL7i7BBL      YBBi                         1BBN      
     ,BBB8BBB0     Lj, .BB:    0BBBBB8            LBi      .MX                          iBBB,     
              .        .BB:    8Br ,BB:rBBBBBBBB  PB: :Bq                                BBB7     
     7LL0MBBBBB         BB.   .BBi  i: :NYJYY7Jr  ZB. UBP  SBBO  :GMM7               .. .ZBBk     
     BBBBMPJi:.    .FNSBBB     :r.            .irFBB.  v   MBBB  0BBBB           :FBBBBBBBBBY     
      .             FBBBBi                    JBBBBi        ..   MBBBBB0L:,.ruEBBBBBBBBBBBOL      
                     ..                        ..                 .70BBBBBBBBBBBBBU,iBBBP         
                                                                      .;XZ80BBB;    7BBB7         
                                                                            vBB1    BBBM.         

                               ,YMBBBBBBBBBBBBBBBBBBBBBBBBBBBBY.                                  
                          .YNMBBBBBBBZFFLr:.       .,:;j58BBBBBBMFi.                              
                       :EBBBBBBBXi.                          :FBBBBBBP:                           
                    :NBBBBB1:,                                   iqBBBBBi                         
                  jBBBBB2.                                          :GBBBBL                       
                1BBBBq,                                                2BBB8                      
               jBBB0:                                                   jBBBB                     
             rBBBE:                                                      .kBBB7                   
            jBBBr                                                          UBBB2                  
           YBBB7                    .       .,:XBMu.                        SBBBU                 
          UBBB:                   7XSi     .;r:ij1BMBJ.                      UBBB5                
         LBBBi                  rMMJi5.     ,ii:    :L2U:                     XBBB.               
        iBBBX               ,:0BB7,:7Gr,   .;r;        :25r.                   MBBS               
        8BBB.            :rXqXjr .iFUk1J    :i:7GMGBBBM7rYLi                   rBBB               
       1BBBi                ..YNBBBBBj1S,   ..:SXj,;YLFSGX,                     ZBBq              
      .BBBX               r8BBBBBBBB8Yr7.       .::,,.                          .BBB:             
      qBBB:              :qSYr:,::. ....                                         JBBE             
      BBB0                           ..,                                         :BBB             
     ,BBBi                          :,..                                          BBB,            
     uBB0                         :Y:             .r:.                            BBB:            
     NBBU                       .:i;r752r   .iLvi. .7J;                           BBB:            
     MBB7                      ,:,  7BBBBBM8BBBM:.   .YU:. ...                   .BBB:            
     MBBr                     7Li       .ruv,         iLLi:,,                    rBBL             
     MBB7                  .:r7r,                     :r;:...                    YBBL             
     qBBU                  ,;i:.:LBBBBBBBMSUjULr::rXBBL  ...                      BBBBBNj,        
     2BBS                  ...  vBBZi.             ,BB:                            5BBBBBBBBBOPk7,
     :BBB:                       jBS,:r7P;  r,iBBBBBv                                 ;UMBBBBBBBBB
      MBBM.                       iBBBBBBBBBBBBBBBB.                                      ,i7U1FMB
      :BBBq                         .M8SL,:,.  .r:                                               J
       kBBBr                                   ,:,                                              .B
        5BBBi                          ...,....                                               .UBB
  i:     rBBBJ                        ..::,,..                                     :LUr,   ,LBBBBB
XBBBN:.    2BBBE,                                                                  BBBBBBBBBBBBBu.
BBBBBBBBBBBBBBBBF                                                                   ;qBBBBBBBY.   
BBi 0BBBBBBBBOvi                                                                      iBBBL       
BBr    .,:::                                                                          .8BBX       
BBL                                                                                    LBBB:      
BB1                                                                                    rBBB5      
BBB,                                                                                   .ZBBS      
BBBBi              .rB0                                                                 UBBO      
UBBBBi          ,YBBBBB1                                                                UBBB      
  BBBBBPi,.,:7UBBBBBZ7BBO                                                               jBBB      
   YBBBBBBBBBBBBBBZ:  YBBM                                                              jBBB.     
     .JOBBBBBB0U.      ZBBM                                                             LBBB.     
                        BBB0.                                                           vBBB:     
                         5BBBB                                                          rBBB:     
                          BBBBL                                                         7BBB:     
         ;.       :i.      BBBr                                                         rBBB:     
        5BBu      BBB.      ,  .irL7rr  ZB0P0qN1q05     :rj5XF5vi                       YBBB,     
       rBBY      FBB:          BBB8BBB  ZMU1qZXMBBO    7BBBBBBBBBBU   ,                 UBBB      
      :BB   XBr :BBBBBBBBBO    ZB:  BZ    :.   .BBJ     r.     .BBB7  BB,              .NBBX      
     :BB   rBB: BBOii7rLBBk    GB:  BO   GBB   rBBi             SBBY  MBBS.            ,MBBY      
     BBBEGBBB  ;BB      JBU    0B:  BZ   BB2   jBB.            UBBF   ,MBBBB1i.     .  :BBB.      
     .   BBB  ZBN.:7    MBi    8B:  B8   BBi   XBB           1BBB.      :ZBBBBBBBBBBBBBBBB:       
        kBL    : ,BBM   BBr    0B.  BE   BBBNNZBBBEBv       GBBY           .UMBBBBBBBBBBBB:       
     .ZBBM7YPO,   iBBB  BB:    ZBU.;BE   LjLLYv7i7BBL      YBBi                  .,:  .GBBBj      
     ,BBBMBBBN     Lu, .BB:    NBBBBBG            LBi      ,MP                          UBBBi     
              .        .BB:    8Br ,BB:rBBBBBBBB  XB: .1:                                BBBN     
     7LLNMBBBBB         BB.   .BBi  ::.:NLYYJ7jr  GB. UB2  SBBM                          JBBB     
     BBBBMXJi:.    .FqFBBB     :r             .irSBB. iB7  MBBB  ir            :JGBBBB01:XBBB     
                    FBBBMi                    JBBBBi    .   ..  rBBBFi. ..:vkMBBBBBBBBBBBBBBu     
                     ..                        ...              iBBBBBBBBBBBBBBBBF:UBBBB0Z5i      
                                                                  .7ZBBBBBBBB8:    iBBBq.         
                                                                           rBB.    rBBBO.     
																		   
                        ,2BBBBBBBBBBBYri,         ..:iUOBBBBBBBBq.                                
                     .LBBBBBBB57,                          :rNBBBBZL                              
                  ,XBBBBBB7                                    iMBBBBBY                           
                UBBBBBU:                                          7BBBBBJ.                        
              :MBBBP:                                               .UBBBBk                       
            .OBBBN.                                                    7BBBB.                     
            OBBBr                                                       vBBBBi                    
          LBBB0:                             rji                          LBBBM:                  
        .BBBB7                   ,L:      :irUBBBGu                        :BBBB:                 
        8BBB7                 .LFkLUi     ,i:,.::;JUvr.                     :BBBBr                
       PBBB2               .vUBOYirXq     :;r.       iku,                     BBBB.               
      7BBBO            .:L0BOE,  7ukE.   .:;:.:uN8E1J:.rJ;                     BBBZ               
      BBBB:            :ri. ..L2XMMUS7    ,,:NBBLUBBBBBMi                      :BBB,              
     iBBBY               .78BBBBBBB8jL.    ..:,,  . .,,:                        XBBM              
     EBBG              ,EBBGFJj1U7i::.          ,.,.                             BBBv             
     BBBL              .::          ..                                           jBBM             
    7BBB.                         ..:       ..                                    BBB:            
    jBBM                         :i.            ..                                BBB7            
    qBBN                       .rL.             ,:U7.                             BBBv            
    PBBN                      ,i.,JMBBB0riYMBBS.   ruv.    .                      MBBL            
    qBBq                    :ii     :SMBBBGUi.      iJY:::,.                      BBBr            
    YBBB                  .777:                     ,rri.,..                     ,BBB:            
    iBBB:                .r7i:..;FMBBBBBJUUPXYUvPqBGL......                      7BBN             
    .BBBr                .,,..;BBBBBM0UULr..     .0B1   ..                       LBB,             
     8BBZ                     :BBY           .vL5ZBr                              BBBu.           
     LBBBL                      YBBBBBBBGkBBBBBBBBr                                EBBBBG:        
      BBBBJ                      .GBBBBBBBBqUL5j                                     :MBBBBBu     
      .BBBB7                       ..         :.                                        :BBBBB7   
       .BBBBL                             . ...                                           ,NBBBBr 
        iBBBB7                      .:ii::,.                                                :BBBBi
          LBBBB:                                                                              kBBB
            XBBB.                                                                   :u:        FBB
XMBB1        BBBBU:                                                                 0BBBB7     .BB
BBBBBB:   .2BBBBBBB:                                                                 :BBBBBU    OB
BB7MBBBBBBBBBBBr,7i                                                                   UBBBBB8   BB
:   :BBBBBBBP.                                                                         GBBBBB: iBB
i     ..:,.                                                                            :MBBBBBJZBB
Br                                                                                      5BBBBBBBB1
BB                                                                                      YBBYvGEr  
BBBi                 ,                                                                  :BBU      
BBBBk.           .i7BBF                                                                 :BBG      
 :BBBBBS:   .iJMBBBBBBBM                                                                .BBB.     
   7MBBBBBBBBBBBBBBNirBBB,                                                               MBB,     
      vGBBBBBBM5,     iBBBi                                                              MBB,     
                       vBBBi                                                             EBB;     
                        ,BBBP7                                                           0BB7     
                         :BBBB:                                                          PBBJ     
         ;.       :i.     .BBBi                                                          NBBj     
        5BBu      BBB.     .:  .;rL7rr  ZB0P0qN1q05     :rj5XF5vi                        kBBF     
       rBBY      FBB:          BBB8BBB  ZMU1qZXMBBO    7BBBBBBBBBBU                      kBBF     
      :BB   XBr :BBBBBBBBBO    ZB:  BZ    :.   .BBJ     r.     .BBB7  Lj                 PBBu     
     :BB   rBB: BBOii7rLBBk    GB:  BO   GBB   rBBi             SBBY  BBBGi              8BBi     
     BBBEGBBB  ;BB      JBU    0B:  BZ   BB2   jBB.            UBBF   uBBBBBMu7:.        BBB,     
     .   BBB  ZBN.:7    MBi    8B:  B8   BBi   XBB           1BBB.      .uBBBBBBBBBBBMv:YBBN      
        kBL    : ,BBM   BBr    0B.  BE   BBBNNZBBBEBv       GBBY           .LSMBBBBBBBBBBBB:      
     .ZBBM7YPO,   iBBB  BB:    ZBU.;BE   LjLLYv7i7BBL      YBBi                    ,:7NBBBBr      
     ,BBBMBBBN     Lu, .BB:    NBBBBBG            LBi      ,MP                          UBBBY     
              .        .BB:    8Br ,BB:rBBBBBBBB  XB:  Y:                                FBBB     
     7LLNMBBBBB         BB.   .BBi  ::.:NLYYJ7jr  GB. 2BF  SBBM                     ..   :BBB     
     BBBBMXJi:.    .FqFBBB     :r             .irSBB. :B:  MBBB               .r1MBBBBBZiXBBB     
                    FBBBMi                    JBBBBi        ..  rBB1;,..,iJXBBBBBBBBBBBBBBBB2     
                     ..                        ...              :BBBBBBBBBBBBBBXi:   .BBBBr.      
                                                                   :YkGGOFr7BBB,     1BBB7        
                                                                            YBBF    ,BBBL 
																			
                       :BBBBBBBBBui.                 .r5BBBBBBBBU                                 
                     rZBBBBUi:                            .iuBBBBBFi                              
                  :8BBBBL                                     ,2BBBBBB;                           
                LBBBBM:                                          :SBBBBB.                         
              .8BBBS.                                               7BBBB5                        
             NBBBX                                                    7BBBB:                      
            OBBBi                                                      ,BBBB.                     
          :BBBq,                                                        :BBBBv                    
         vBBB7                            ;Fuii,.                         SBBBB.                  
        7BBBL                           .;U8GMkkY7i777:.                   jBBBB.                 
       :BBBE                          ..ri...       .iv:                    JBBBB:                
       BBBB.                    ::      .ir:   rSEBBBBG,                     YBBBB                
      2BBBr                    2qJr     .rr:.2BBBBBF7;.                       jBBB5               
      BBB1                    GBi7NU.    :::LBB, .  .                          kBBB.              
     7BBB.                  uMk.iL1k0:    ...  ,,.,                             BBBM              
     NBBS                 :MBO ,iqOS1u.                                         rBBBr             
     BBB7               iPq,  qBBBBBur:.                                         0BBB             
     BBB:              .jL .Y0BBBMFL:...       .   ,::                           YBBB,            
    ,BBB,                 rBBBU77:    ,,           .irLYv:,.,,.                  ,BBB7            
    :BBB                 ,MMvi       :,.       .iY7    iLj7;:,.                   BBB2            
    iBBM                  .         r:   .   ,GBBk,     .:;::..                   BBB5            
    :BBB                           :Y:iLBBBBBBBr     .:vLr   .                    BBBU            
    :BBB:                         .i. ;r777i:.   ,jF77LMBB                       ,BBBr            
     BBBL                         :,           YZOu,   rBJ                       JBBB,            
     1BBB.                       :Yi.   .YBBBEL.    :PBB1                       :BBB:             
     :BBBX                      .7r;..JGBBB7       SBBBO                       .BBB.              
      XBBBS                     :i:.,BBB2   rMMkBBBB8L7                        YBBBBBOY:.         
       BBBBv                     .   YBBB5MBBBBBBBr   ,.                         :kBBBBBBBv.      
       .BBBBr                           .GBBBP:      .                               .JMBBBBB     
        LBBBM                              ::      ,..                                   UBBBB:   
         :BBBBr                               .:i::.                                       rBBBN  
           BBBBF                              ..                                             BBBr 
OBq.        7BBBNi                                                               jZ.         NBBE 
BBBBB5,      MBBBBB;                                                            XBB:         7BBB.
BMBBBBBBBMBBBBBBBBBP                                                            BBB.         iBBB.
Z   iMBBBBBBBOL,.i:                                                             MBBi         7BBB.
Bv     .,,.                                                                     JBB8         MBBM 
BB                                                                               8BBZ      :MBBB: 
BBBY:                                                                             BBBP   .BBBB8,  
:EBBBBOj,                                                                         .BBBBB8BBBE     
  YZBBBBBBBqSU2U11kX0S1MU                                                          :GBBBBBBN      
     .rNBBBBBBBBBBBBBBBBBB                                                            ijEBBL      
           .::i::::,,. :BBB,                                                             8BB:     
                        ,BBB1i                                                           5BBM     
                          BBBB.                                                          7BBB     
                           BBBBU                                                         ;BBB     
                           .BBBBq                                                        :BBB     
         ;.       :i.        .i.                                                         .BBB:    
        5BBu      BBB.          :ivrrr  ZB0P0qN1q05     :rj5XF5vi                         MBB7    
       rBBY      FBB:          BBB8BBB  ZMU1qZXMBBO    7BBBBBBBBBBU                       5BB1    
      :BB   XBr :BBBBBBBBBO    ZB:  BZ    :.   .BBJ     r.     .BBBv                      jBBS    
     :BB   rBB: BBOii7rLBBk    GB:  BO   GBB   rBBi             SBBY  YY                  UBBq    
     BBBEGBBB  ;BB      JBU    0B:  BZ   BB2   jBB.            UBBF  ,BBB2i               EBBu    
     .   BBB  ZBN.:7    MBi    8B:  B8   BBi   XBB           1BBB.    .5BBBBBBBBMEur,     BBB7    
        kBL    : ,BBM   BBr    0B.  BE   BBBNNZBBBEBv       GBBY         :UOBBBBBBBBBBS. .BBB,    
     .ZBBM7YPO,   iBBB  BB:    ZBU.;BE   LjLLYv7i7BBL      YBBi                  ::LSBBBOMBBB     
     ,BBBMBBBN     Lu, .BB:    NBBBBBG            LBi      ,MP                        MBBBBBB     
              .        .BB:    8Br ,BB:rBBBBBBBB  XB:  :                               SBBBB:     
     7LLNMBBBBB         BB.   .BBi  ::.:NLYYJ7jr  GB. UBL  SBBM                         1BBM      
     BBBBMXJi:.    .FqFBBB     :r             .irSBB. iB7  MBBB             .,:7YU2P2,   rBBE     
                    FBBBMi                    JBBBBi        ..  ,2J7LuSqBBBBBBBBBBBBBBSrrXBBB     
                     ..                        ...             vBBBBBBBBBBBBBB07r7ir1BBBBBBBB,    
                                                                  ..,,,..  YBB8      ,BBBv ,r     
                                                                            OBBB,  ..XBBB:  
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
