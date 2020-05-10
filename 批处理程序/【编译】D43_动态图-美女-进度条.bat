@echo off
rem ----------------------------------------------------------主代码
mode con cols=190 lines=90
color f0
set /a D43_app.firstPrint=0
set /a D43_app.size=65
set /a D43_app.lastPrint=0
set /a D43_app.blanklines=1
set /a D43_app.spaceCounts=6
set /a D43_app.addLength=65
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
mode con cols=190 lines=80
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
--
--
--
---
---
, ............:.,,:,:,:,:,,,:,. :BBMPr:.,..   ;80EMMBr::iiiiii;i;i;iriririi
. ...........,:,,:,:,:,:,:,:,,. XBMN751;.irL;.,Z00OMBN,iiiiiiiiiiiiii;iriri
, ,.,.,.,.,.,.:,:::::::::::.,,..BBOMSYGr.LN7ii7GNqBGBZ::iiiiiiri;i;i;i;irii
. .,.,.:,:::.,:,,::iiii;ii;:.. SBB2::Lv. :557::8POGMBS:iiiiii;iiiiiiiririri
, ..:.,...::.,:,:,:::::::,r,. 7BBMS.,5,,,..:, 7MMEGMBi:iiiii;iii;iiiriririi
. .,:.....::.,:,,::r::::,:r: :BBBBPir2ir,,.. ,MBEZGBBi:ii;iii;i;iiiriri;iri
: .,i.....::..:,,,:i:,:::,r.,BBBBM8JU7r.....:kB0ZGMBBi::;iii;i;i;iri;irir;i
,..::,.,..::.,::,::r::::::i.GBMBBM8PjL7vi:::jB8qGMMBPi:ii;i;i;iiiririririr:
: ,:i.,.,.::.,:,:,:;i:::::irBMMMBMBZJ7iii7JkBMM8BMBEriiiri;i;i;iri;i;i;irri
:..::,.,..::.:::,::r:::i,,iFBMMBBM8Buuvr71OBMO8OOMGUiiiiiriri;iri;iririr;r:
:.,:i,:.,.:i,,:,:::ri:i:::XqBBBMM88NYLjJLFBG888O8MOJi:iiririririri;iririr;i
:..:i:,:,,:i,::::::7:::i:;qEBBBBMO0NUujLjBEBEOMBMB8L:iiririririririririrrri
:.,:i,:,:.i:,:i::::ri:i:::kEqBBBMZ87kNP0BMMBMBBBBBBi:i;iriri;iriririr;rrrii
:.,:i:,:,::;,::::::r:::i,:i:.jBBMBMiXBBBMMBBBBBBBBB2:iiririririririr;r;riri
i.::r::::,ii::i:i:iii:ii::r,:FBMBBGkBBBMBMBBM7rrYLqMj:;iri;iri;iririri;;r;i
:,,i;:::,:i;,:i::::ri:ii:iri7MPPBM0BBBBBXqOE;i:,..,JB5i;iriiii:iiiiii;ii;;:
:,::r::,:,ii::i:i::r;:ii::7:LZ:Z8PMBBBO7YEZUri:...:,XBLivqS1SU1uYvv7YvjLLYJ
:,,ii:::::ii:::::::riiii:ir:Y,7MqBBBMr:vj2XkY7i:::,:ik5;irrv7EBSjkY1F52UY1L
:.::r,:,:,ii::i:::iri:ii::r:iLBE1XB2.:L7r;YJUYLii:::::Urri;irur:;iriii;irii
:,,ii::::::i:::i::iriiii:iiLBOjZi,7i iY7:::7vYLvii:i:irvrr;r;iir;7;rrrrrrri
:.::;::::,:i::i:i:i;i:ii::vqNFvYY::irir,Yvv7L7Y77ii:i:rr7rrrr;rrrrrr7r7r7rr
:,,:i::::,:i:::i:::rii:i.;51jjkUuLrrii::rYk57v77rrii::ir;r;7;r;rrrr7r7rrr7i
i.::r::,,,ii::i::::;i:i:rjJJ5u5PXUvii::::,7qJriiii;ii:;rr;rrrrr;7r7r7r7r7rr
:,,:ii:::::i:::::::rii:iUUj2YuSEN0j7:,.::r:5XLii:iiiiiirrrr7r7r7r7r7r7r7r7;
i.::i:ii;::i::i::::iriirSuuUULYuEGZJ7:::i.:YM1L;i:iii:ir7;7r7rrr7r7r7r7r7rr
i:::::,:,:,i::ii::::::,iP5jv;rrrrYFq5P1jY. :1BXU7ririiirr7r7r7r7r7r7r7r7r7;
i.::::::::i:::i:::i:i:i:7PPUJ7v77;LFESBBBkL:,:200L7i;i;i7r7r7r7r7r7r7r7r7rr
:,:::::::iri:ii::::i:iii:;UNXULL7L7JYLP8NXY7i:.:v12Lriir77r7r7r7r7r7r7r7r7;
i.::::::::i:::i:i:::iiiii::iJPSuuYJ7LrLuF5S2UL7:::rLj7rrL;7rrrrr7r7r7r7r7rr
:,::::::,:,,::i::::i:i:iii::,;kSuYYYYLvjXNFkSFJLrr:::YYv7rr7r7r7r7r7r7r7r7i
i.::::::::i:::r:::i:i:ii;ii::,:UuYjYuYY7L20kkSXUUYY7rrJLLi7r7r7r7r7r7r7r7rr
::i;iirY7;rYr:v7ir7YiirLirr7;:,YSjL77v7v77JFSPPPFFUUJjLu7rrrrrrrrrrrrr;r;7i
i:vri:;Ukjr;r,55UjJ7::rY7i7vr::7XjuLv7L7L777Y2X0800FULL777777r77v77777v7v7r
:i7L77r5Ek7LL75Oq15UirrXYri1L7;JE5UkF1YJYYLLr7rYYvJXS2YL7v7v7v777L7L7v7v7Lr
JrY7YYYLYY5YYLYY1UUYJYjY252UjYv7BBri7rri:::,...     :77r777r77777777v777v77
Yrrrr777r7r777rrr7r77v777v777LriFBS.,:::::,,....... ,7r7rrr7r7rrrrr7r7777vr
7i7r7r7r7r7r7r7rrr7rrrrrr;r;r;r:rBBj::i:i::,....... ,r7iri;iii;iii;iii;irii
L7LYvL7L7LvLvLLL7LLYYYYjYuj1U121JMBM,:::,,.. ...    :Lr7r7r7rrrr;r;ri;irii:
EuUU15F1FU2jUjUjuYjJjjUU1U2U555UjUBk::::,....   ..:;YrrrrL77YvLLv7L7vvv7L7v
F0NqX0PqPPFS1FUF1F2FU11F5PPqPNXq5FFF5k2UYYvYLLvLLYLLrrLX5F1kFXSS5SFkFkFPSXF
S51uUU5U1u225U2jjjUJUU1UF2F1XSNkk1P2SSXXkFk1SYL7vr7rrrr7L7v7v7L7v7YvL7YvL77
k1JujUUUJUJUuUuuJjYUYuYUU55XkPkkF5qkU522UUJYvvr7r7rrr7;irL7v7L7L7vr77LvL7L7
S152FU5U1J2uUuUjUjUUk255k5k1115FF50qXUF22uUYYv7r7r7r7r7r77YvLLY7v7YvL7YLJv7
USUF2Uu1uUuUJUu2u5SEYJYUUuUqkSFk25SFP51F22YuYLr7r7r7rrr7rv7LvYvYvSZYLYYYLL7
U55u5U1U1U12F5F1SSNqENEZ8EGqqkqF5255SkF2512j2Jv77r7r7rrr7rL7LYUYYjFU2UU2ULL
UPUUU2U55k25U521j1255k2SFkkkFPS1UFUS1FFSUUuuYj7777r7r7;7rLu2uUuUYYYYLYYuYj7
5Xk251F1521U2UUjUU5U51F1XFk5XSEk21S2F1FUSUUJJLLrv7vr77vr7vUYYLLLYLJLJYJYUJY
2FFF2FU11FU5UF2S5kSPkNkPXPX0PP8Ou11F2F11uUU2u2jYLYLv777vrU21U2U22525U122u5u
1U5u2j1152F15252F5SFkSXk0P0NNqG8XJ1uUYUU2juvjLLr7r7r77L7Y252F112F21U1U2UUUJ
U0q51FU51FU12F5k5kSXSXkNq0PqSZNGMYJ2uUYUuUU2UUYYYjvLLj7vYYvL7L7L7Lvv7L7L7vr
1qN5XSk5F15U1UkFPkPkk5SSqkq50EEZBNvjUuUjuYUu2jUYuJjLJLLLv7LLYvYLY7LvL7YLLv7
1qqFF1U2U1U1U515UF2kkNPqqNFSEGGB8SUjYUuUJuYjYYLYLJLJ7LLJLJvYvv7v7YYJLJLYLLr
2XE2FJ5U1U51F211XFN0ZkX5XF5kOOB05UFUuuUjUYUjUYYYYLYvLYJLJYJLJLYLuNJvYLLLJYY
jNPS51252FFS5kFSFXPOZMGOGO0GZMqX25UjYuJJj2JuJJYJLLLYJjYuYYLYvYvjjS2FFS11LL7
1kE2P1S1kFkFk5XFXSqP0NZqNqEGOqq1112JuJjYJJUYJvYvLuJvYLYLY7YvYLLLL7YLJLYLLLL
UP0F5F1FU1211kFk5SFS5qXPXSqM0qk121UUYuJUJjYuYuu5F17LvYLYLYYYLYYYLYYJLYYjYjL
F1N112F1515US2FU12SSqkPSPSZEqkSUFUFuUYUJuJuYUUkFkUS5S15FSU1252F211S1F255FF5
21SPSXXqqNXNPNPEqE08Z8Z8EZ0NXX21U522U2uUJuu5Sk1X2SFXSXFS252FSXSXFk1SSF2XFP5
FP81Xkk5XFPkqSPXqkNNENZq0NZXq55U5U5UU2S252kkSj1P7.:i  i..YJ,rrrrLr:i;jYrrii
FkXS2525U1UF2F1P5S5PkNXqqNFX5UJUjJJuJUU2u5UJYu5Fi::: :ri.7L,,::, ,:i.7i:,:,

---
, .,:.....::..:,:,:i:.,.:,;,,.,.:..  BBMMOBBBBBBBM8..iiiri;;ri;iririrrr;r;i
.   .  .   . ..    ,...,. :.        NBBBMBMBNBBMZGME..,::::::::::::::::::i,
. ,.,.,.,.::.,:.,,::::iii:r,,.,.: .BBBB00XFU5BBNGGMBB::i;iriririririr;rir;i
. .,...,.,...,:..,,:,:,:::::,,.., NBBE:,..  ,FBE8B8BB0,ii;i;i;iiiiiriririr:
, ,...........:.,.,.:,:,:.,,:,,..iBBk::,:.. ..28NOM8BBi:iiiiriiiii;i;i;irii
. ............:..,,:,:,,,,,:,:,..MB8Fui:,:,:,.:MkZGMMBY,iiiii;i;i;i;i;iriri
, ,.,.........:.,,:::,:::,:,:,, :BBM2XGi:uqUL:rGX0M8OB5:iiiiiiiiii;i;iiirii
. .,.,,,,,::.,:,,::i:iiiiir:,,. rBOXjuk,.7qUi::GPO88OBv::;i;iiiii;i;i;irir:
. ..:.....::..:,,.:::::::,7,,,. BBZ:.7: ..ii: iOOEEZBM::iiii;i;i;i;iri;irii
,..,:.....,:.,:,,,:r::::,:r:,, JBBZr:P:i,,..  1BEOZOBB::i;iiiiiiiiiriririr:
: .,:...,.::..:.,,:i:,:::,7::.iBBBBuvLr,,.,..iBBNOZMBB7:ii;i;iii;iririririi
,..::..,..::.,:,,,,r::::::r:..MBBBM0UYvr::.,:SBM0M8BBq;ii;iii;i;i;i;i;iriri
:.,,i.,.,.::..:,:,:i::::::7:.7BBBBBMF7rrr:iiSBBGO8BBM;riii;iii;i;i;i;i;ir;i
:..:i,.,,,:i.:::,::r:::i,:7:.XBMOBBBOjri:7jMBBZ8MBMMq;iiiriririri;i;iririr:
:.,:i,:,:.ii:::,:::;i:i:::7,iqBMBBBEBN1uUuZBBZMZMGMZqii:;i;iriri;iri;iririi
:..:i:,,,,:i.::::::ri::i::r;kEBBBBGMNXj1j2ZMMM0MBMZOS::;i;i;iri;iri;iriiiri
:.,:;,:,:.:i::i::::ri:i:::viUNBBBBBG5jG0ZMBOM8BBBMBBj:ii;iri;i;iriririr;rii
:..ii:,:,,:i,:i::::r:i:i::r:rq1GBB8OYXBBBBOBBBBBBBBBk::ii;iriri;iriririri7i
:.::r::::,ii::i:::iri:ii::7::,.7BBBBOBBBBBBBBZULkOBBEY;iriri;iririri;irrrri
:,,ii:::,,:;,:ii:::ri:ii:iri:irEBBMBBBBBG0MMv:,..,:NNJ7rrrii:i:iiii;i;iiii:
i.::r::::,ii::i::::;;:ii::7ii:;1BBBBBM17YFZJi::....:MGYi7PSUFU1uYvv7L7JvvYY
:,,ii::::::i:::::::riiii:ir:,:;X:LBZi:iv7U5ULr::,::,LBL;irrv7EBSJFj1SF2UY1L
i.::;::::,ii::i:i::ii:i:::rr55j1:,7 :J7iirYYY7ri:::,:XLiriri;Ur:ii;iiiii;ii
:,,i;::::::i::ii:::rii:i,:jGFPUJ7i::ii:7::rLvYri:::::Yvrrrrriiir;r;rrrrrr7i
:.::;::::,ii::i:::ii;:i::vUjS5X2Jii:i.:5JYL7LL7ii::::;Lrrrr;rrrr7rrr7r7r7rr
:,,:i:,::,:i,::::::rii:ivj1Uu0qqjr::.:irL8u7rrr7ii:::77rr7rrrrr7r7r7r7r7r7i
:.::i::::,:i::i:::i;i::LUvYLLYNGkYi...i::k5r;i;iiii:ir7r7r7r7r7rrr7rrr7rrr;
:,,:ii:i:,:i,:i::::riiiFj7iiii75XujLii, :SNLiriiiiiii7r7rrr7r7rrrrrrr7r7r7;
i.::i:iii::i::i:::iirirk1v7r7rr7XZFGBMr ,UBu7ii:i:i:;7rr7r7r7r7r7rrr7r7r7rr
:,::,:,::::i::i::i:::::uqULLvvrvYJ7BBBFY::U8ULiiiiiirLr7r7r7rrr7r7r7r7r7r7;
i.::::::::;:::i:i:i:iii:YX1YYLL7YYJUS1U7r:,;k1Liriiir77r7r7r7r7r7r7r7r7r7rr
i::::::::ir;:ii::i:i:iii:rPSjjYYvLLFXF52Y7:::LUJrri;;7r7r7r7r7r7r7r7r7r7r7i
i.::::::::::i:r:i:iiiiiii:LqUYYLJL7r2Sk55JY;::;vJrri77rrrr7r7r7r7r7r7r7r7rr
:,::::::,:,:::i::::iiiiiii:22uYuJuYYYqkkFSuJ7i:iiYrrL7r7r7r7r7r7r7r7r7r7r7i
i,::::::::i:::r:::i:::ii;i:ikJJ7L7L7LjqkX5SUUYLri7YvLi7r7r7r7r7r7r7r7rrr7r;
:::iiiiLrirLr:77ir7Yii7LirirFUYJ7LvL7vYkPNSk21uuLYLYrrrrr7rrrrrr;7r7rrrrr7i
i,iii:iUku7rr,S5UJjL::rY7i;;1jYYJvLLYvLL2X8Nq22YYLuL7rv77r77777777v77r77vrr
ii77rrr1Zk7LY75OP1SUi7rSYriL22YJjjLJJUYjLYY1PZXUvYLY7L7L7v7v7v7v777L7L777Lr
J7YLYLYLUUULYLYY1UULYJjJU1UXBMNkk2u77i:,,...:vSX2L7;rr7r7r777r777777L7v7L77
Yrr77vr7r77v7777r7r77L777vr7Oq:i::,:,,...,.. ....vrrir;7rr;r;rrr;r;7r7r77Lr
7i7r7r7rrrrr7r7r7r7r7r7rr;r:rBY.::i::::,,.,..   .77rr;riiiiiiii:iiii;i;i;ii
Y7LLvL7v7vvLvYvL7YLLLLJjJUj2LEBu,iii:::,....   :77rrrvv7r7r7rr;r;rrri;i;ir:
0UUu55F1F2UJujUjuYUJjJUu1U5U2jBBi::::,,.  ..:;YY7rr;r;7r7Lv7L7LvY7vrv7v7v77
SqNNPNPqXXFX152S5S2S1F2FFPXqPXXBurr7r7777vLYLJ7r;rrr;riv1S1S5kFk2FSk5k5PSk1
k25u1U5U1U2U1UUJUJUuUu2U51XSk5k1EP0qNPPSkJL7vrr;rr7;r;ri77v7v7L7vvY7YvYvL77
F1YUJ2uujUjUU2ujYjJuLJYuUF5XFPSX5NqPSPUUUJr7r7rrrr;r;ririr7L7vr77vr77v7vrvr
S5F2FU5U1jUUUYUjUjUUS155kFk151F1FUkPX5SuuJL;rr7r7rrrrrrrri7LLYY77rL7L7JLYvv
USUF12j1j2uuYUuUU1SEYjJujuUPSSFk1F1NSXSFjUY7r7r7;7rrrr;r;r;LvL7LvS0Y7YLYLY7
U52u5UF25U2US1FUF5XqNqEE8NZPPFqPNFSkqkkSFU1Y77vr7r7;rrr;ri;rYYUJjuSU2UUUULY
UXUUU2UF5S1S2FU2j2U12S2F5SFkFXkk2F5XkPXPSUuU777L77r7rrrr;;iLUUUUYYLYLjLJYYv
5kXU12S2F55U2uuJju2U2U12S5XSXFXFq1S1kkPXqS5UUYY7777rrrr;rrivJLYLYLYYYYJYUYL
25552521U5U5252F5SFXSqSPXqX0PP5qGPUkFXXP5FuuJYr7r7r7r7r777rU2521U525U122U5u
5U5UUu515152FU5252F1kSXX0qNq0PP0O01FXSkU2JUjUYYLY7L7v7vvLLj5F15U511U5UUUUuJ
U0qF1FU11F15U5551kFXFXkqP0q0XPX8ZBF1U2uJYUu2U2YjvYLL7LvYLYvLvL7v7L7v7L7v7Lr
1qNFPSk5F212UUSFPkPSS5S5kkNXX5ZZOBOLuJUjUjUJuYv7YLYLLLLvY7LLYLYLYvLLYvYLYL7
UqXFF5UUU1u1U1U5U52kFPPPPqkSUPZMMMS1YUjUu2u2uuYJYYLJLYvYLJLLvL77rLYuLJLJvLr
5PN1FJ122U125212SFqZEkk5XF55XZMMESF11JujUjUuUJjYjYYvLYULJYjYYvLLuqJ7LvvvJLL
U0qSF1U5US5F5S5F1XPGEOEOGOZNqMOEkk25UUJuYuJUJUJYYYvJU2YJYYLYLYLjjX2k5S52Yv7
US02P2F2kFk5k5S5kkqSNNEN0qqS8MEkXUSUUUUJuJJJuJJLYL25j7LLYvLvYYYvLLYLJLY7YLL
UPEF2F15U2212S5X5F5S5XXqXP5N8GXk25UUUUjUjUjUJUJujS2Y7YLJLJLLLYLJLYYYYJLJYjv
F1q551F55152121U2255XkPkPkXEOkP11UUu1UUjUjuJUjuUPSF1F151S2525U5212F1S2F5S55
15SPSPqNPNkqPNPNN0EGE8ZOZG0OPPkF22U2U2U2uUuUU5FPF55XSXFSU2USSXSXFPFFFF2kFPF
FXGFPkXFk5PkXSqkqkqP0NGNEPZNPPS1S21u2u2U1U12kSXPr.:i  ;..7Y,rrr;7;:iiYYrrii
FkqS5525U1UF2FFP5S2kkqP0XNqPF5jjYjYuYuJujUUSjU15i::: :ri.v7,,::, .:i.7i:,:.


---
---
---
---
---
, ............:.,.,.,,,,:.:,:,,.: 7BBj:.,.  :2BqMMMOBBX,iiii;i;i;i;i;i;irii
. ............,..,.,.,.,,,,:,:,.,.MBFi:::.   .UMqMOMMBB::iiii;i;i;iri;iriri
, ,.,.........:.,,:,:,:::::,:,:..:BMNjr:ii7i:.7NSGB8GMB7::ii;i;iii;i;i;irii
. .,.,,,,,::..:,.::i:i:iiir:,:,..YBBEBGi:XZB5irESM8Z0BBr:ii;iii;i;iri;iriri
, .,:.,...::..:,,,:::::::,7::,:.,5BkrJ2..iJ2J,iEEZGqZBO:iiiiri;i;i;iri;irii
,..::.....,:.,,,,,:;::::,:r:,::.:OB7,Y......  iBGZN0ZBM::;iii;i;i;iriririri
: .,:.,.,.::..:.,,:i:,::::7::::.LBMur2ii::,.. kB0EO0MMBL::;i;iriiiririririi
,..::,.,..::.,:,,,:r::::::r:::..MB8ZLJ7:.....:ZBN808OBOYiiiii;i;iri;i;i;iri
:.,:i,,.,.::.,:,:,:ii:::::7::,,UBBBMqYj7r::,:LBBEEGMMMPiri;i;i;i;i;i;iririi
:..:i,.:,,:i,,::,::r:::i::7i:,;BMBBBMj7iiii7YBBOqMOBOMJriiiriririri;iririri
:.,:i,:,:.ii:,i::::;i,::::v::.SBMBBMBE2rirj2BBOq8OBMMO5iiiii;iri;iririr;rii
:..:i:,,,,:i.::::::ri::i::ri::kBBBMOGMMX25jFMMN88MZOPM1ii;iriri;iri;iri;;ri
:.,:i,:,:.ii::i::::ri:i:::7:;F8BBMOZZ015kUYPM8MZ8MO008u:iiri;iriririri;;rii
:..ii:::,,:;,:i::::r:::i,:7;iUSOBB8G00iX8ZZBOBOMMOE8OMY::;iriririri;iririri
i.::;::::,ii::i:::iri:ii::7::7qP0BBGMq5OBBBMMBBBBBBBBOk;iiri;i;ir;ri;ir;rr;
:,:ii:::,,ir,:i::::riiii:iri::,.,PBBMMBBBBMMMBB8EBBBB8Ujrrii:i:iiii;iriii;:
i.::r::::,ii::i:i::r;:ii::7ii:,:20MBBBBBBGEEMUr:::7EBNU7Yk5USU5UYv77LvJv7YJ
:,,ii::::::i,::i:::riiii:ir:::i72:.kBBqjrYFNLi::...:2MU7rrrv7EBFY5j2S51UY1v
:.::r::,:,ii::i:i::i;:ii::r:2U5Jr:,L2ii;vLFFY;i::::.iMMrririiUr:;i;iii;i;ii
:,,:i::::::i::ii:::riiii::75EqUUri::,7i;:rYULvii:i:::BBrir;riiir;rrrrrrrr7i
:.::r::::,ii::i:::i;;:i::ijuFqkY7:i:: :v::LvY77ii:i::EErr;r;r;rr7;7rrrrr7rr
:,,:i::::,:i::i::::riiii7Li7UES2i::::i21YYLJYLri:i:::N1vr7rr;rrr;7rrr7rrr7i
i,::;::,:,ii::i:i:i;i::7jrr;7UEj7::.:vi702L7v7riiii:i05;rrrr7r7rrr7rrrrrrr;
:,:iii:i:::i::i::::riii5Yr;7;Lk2JY:ii:::P2rri7rriiii7BYrrrr7rr;rr7r7r7r7r7;
i,::i:iii::i::i:i:iiri;FU7777r5Nk0BU: :iEU7iii;iiiii2Sr;7r7r7r7r7rrr7r7r7rr
:,:::::::::i:iii:i:::i:LFJ7L77YYXBBBrr:7Mk7ri;iiiiiv7ii7r7r7r7r7r7r7r7r7r7;
i,::::::::i:::i:i:i:iii:YFuLLLLjkS0uj7::Z0Jrri;i;i77rr7rrr7rrrrr7r7r7r7r7rr
:::::::::ir;iiiiii:ii;ii:FFUYJLY1NF1jLi::FFLrririrLL;7r7rrr7r7r7r7r7r7r7r7i
:,i:::::::i:i:r:i:ii;i;iirNujLJLUkk5SjYi:i1JvrrrrrJr7;7;7r7r7r7r7r7r7r7r7rr
:,::::::::,:::i::i:ii;ii::U5YJYjY5kPFFJYi:iLYr;r;v7rr7r7r7r7r7rrr7r7r7r7r7i
i,:::,::::i:::r:::i:iiiii:v1jLYYYYXPP52JY;i:LLri7Y7r7rrr7r7r7r7rrr7r7r7r7rr
:,iriiiLrirv;:77i77Liirvi;;XJYvL7vYNqN55juvriJ77jL;rrrrrr7r7rrr7r7r7rrrrr7i
i,;i::iUku7i7,F1UJYLi:rY7i;UUjL777LUN001FU2LYLJJjr7r7rv77r7r7r7r777r777777r
iir7rrr5EP7LY71MqSFU;7rFYr:JUUjYLjjuUE0N11U2U25UvLLYvL7v7v7Lvv7v7v7LrL777Lr
Y7YLYLYLjU2LYLYY2UUYYJuJUUUEZ5SUu77ii:LP0F2J5Svr7r7r777r77777r7777L7L7v7L77
Yr777777r7rv7777r7r77v7vrr0Bj7ri::,:,:,r5GNSui rrrrrir;rrr;r;rrr;r;rr7r777r
7i7r7r7rrr7r7r7r7r7r7r7rri78r.::i::::,,.,:i.   rrr7;r;riii;iii;iii;i;i;i;ii
Y7LLvL7L7LvL7YLYLLLYLjJuYULqBJ,riii::,..    .i77irr77Yv7r7rrr7iriririririr:
0UUjF155FUUjUu2uUYUJUjUU2u1YEBL:;i:,,..,::vYj77;r;rir;77LvLvLvYLY7L7LvLvL7v
5qqPXqPPSk5k1F2F5F25252FFPkX5BMii;i77JYUuUY7;7;r;rrriiiUFF1S1S5S2kFSFS5kFk1
S21uUU5U2U2U2uUJUJUjUuUU52SFS1OPPFkk0PFY7r7r7;rrrrr;r;;i7vL7L7v7vvLvLvLLL77
F5YUJUjuJUjUuUujYuJuYjYUU51XSk5PqqSS12Yj77r7r7rrrr;r;ririrvL7L777Lr77v77r7r
k2525U2U2jUuUJujUuUUS251SSFU515USXP55UuYLr7r7r7;r;rrr;r;;i7vLLY777LvY7YLYvv
U5u122j1jUujYUuUu1S0YjjUJUuPFk5S1FkqFFuuJY77r7rrrr;rrrrr;rivLLvL7S0Y7YvYLY7
U12U5U5U5U2UF1SU55XNNX00GNEXXSXXqSS1NF5UUYL7v7Lr7r7rrrrrrii;YYuYYjSU2UUUULY
UXUUU1251S1SU1UUJ2U1UFUF1F1k5XFkFS2kXPkS5FjJvL7vr7rrrrrr;riru2UULYLYLJLJLY7
5SSU22F2F11U2UuJjuUj1U22F1SFX5X5k2SSqXNkSUUY7r7r7r7r7rrrriirJLYvYLYLYYYYUYL
2515U5U2U1U121U11SFkSkFkSPkNXPSk5k1S5NS1UUjULJYLvL77rrrr;7rY55U2U5U1U2U2U1u
5U5uUj5211525U1U5251SFXkNPNqNPqSO0S5kU1jUU22jvYLY7777r77vvLUF25U511U2UUUUjJ
u0q525U51FU1U5152SFk1XXPXNPNkX1ZOMUF51JUYJYULv7L7L7v7L7LLY7v7L7L7L7v7L7v7Lr
1PqFXFkFFU1UUUF5kFXFF5S5XSPkX5NEGBSY15FYJYuYJLJLYvLLLvLLJLLvYvYvYvLvYLYLYL7
UqXFF1UUU1U1u2U521USFXXXkPkSUXZ8OMXULJYUYuJuJJYjYYLYvLLjJYvYLY777LYJLJLY7Lr
1XN15J1UUU525U11S5P0ESS5kF51PZ8M8FPUUuuYjYuYjYYLYvL7LY5jYLJLYvLLuqJ7Lv7vJYL
UNqF5221UF5F1S5F2kPGE8EOG80N08OGSqUUU2JjYYYUYJvY7YvJUSuJLYLLLYvjuk1S5S52YL7
US02k252S5S5S5FFSFPSqq0qNPPP8OOSX55U2UuYJYYYJYJLYLUSU7vLLLL7YLL7LvYYJLYvLLL
UXNF2F15U221UF5k551S5XkPkkS8ZOSXF5uUUUuUjuJjLJYYY55J7YYYLYYYYYLYvYYJYYLJYjv
F2q551F1115U1U1U2U5FkSXSXSGZOXXF1U2u1uUu2uUYjYjjkkSUF151F2521U5222FUFU51S11
25SP5PPNPPkPPNSNq00GEGEG0ZZ8NXkFU1U2UUU2UUUUU1FXF51kSkFSU1U5FX5kFX5SS5UkFP5
5kG5kkkFSFPFXFXXPkqX0PEPq080NkX21U5U2j2U1U1U55XPr.:i  ;..7Y,rrrr7r:iiJJrrii
5kPS55U1U1UF211X1F1SSqPNqZNN5SjjJuYuYjYjYUu52115i::: :ri.v7:,::, .:i.7i:,:,

---
---
---
---
---
, ............:...,.,.,.,.,.,,,.:,, .7MBBBBMBBBBBMBBB8r,:iiiriii;i;i;i;irii
. ............:......,.,.,,,,,..:,. iBBBM8XS0BMZNEN8MBBv,iiii;iii;iri;i;i;:
, ,.......,...:.,,,,,.,,:,:,:,:.:...BBUii,,,LZMkOEM8MMBB::iiii;iri;iri;irii
. .,.,.,.,::..,..,,::::iiir:,:,,:..8BS::,:...iqZOBMMMMBBi::ii;iiiri;i;i;;;:
, .,,.,., ::..:.,.:::::::,7,:::,: 7BB7::i:..  YEZMBMMZMBY,ii;iii;i;iriiirii
, .,:.....,:.,,,.,,i:,,:,:r:::,,:.GBOBSiiX007:7NXBMM08OBJ:iii;iii;i;i;i;ir:
: .,:...,.::..:.,.:i:,:,::7::::,:,BBZPB,.75O8:rN0MMEGGBBr:ii;i;i;iii;irir;i
,..::,....::.,:,.,,r::,:,:r::::::7BM;7, ..::. rBG8P0ZOMBi:iii;iii;i;irir;ri
:.,:i.,.,.::..:.,,:;:.::::7::::,irBXrv.,::... UBEN8NOOBBU:iiri;i;i;iririr;i
:..:i,.,..::.,:,.:,r::,:::ri:i:::iBBY2r:::...:XMS8OZOMMBF7:;i;i;iriii;ii;r:
:.,:i,,.,.::,,:,:,:;i,::::7:i::,ijBBEjYi:,:.:iEBEZMEM8MMFriiri;i;iririririi
:..:i:,,,.:i.::::::r::::::ri:i:,7BBBBULLr;i;iYBBEGMMMOGMuriiiriri;iriririri
:.,:;,:,:.ii:,:,:::ri:::::7ii::,EBBBBZY:::rL5MBOEGBOBOMMFrii;iririririrrrri
:.,:i:::,,:;,::::::r:::i::ri::,iBBMMMBNGPUu1ZB8GEMMMMZqBSr:;i;iririririr;ri
:.::r::,:.ii::i::::ri:::::7:::;SBBMEZBBBBF21q8MGMMM8BL5MSiiiriri;iri;ir;rr;
:,,i;:::,,:;,::::::r:::i:iriir18MBOEGBBO7NNSPO8MGBMOMSOO1r:i:i:i:ii;i;iiii:
i.::r::::,ii::i::,:;i:::::7iir2EBBMZBBBXiSM8BMBMBME0GOMZNFUUFU5uYv77Yvj7LYJ
:,,:i:::,::;:::::::r:::i::7i:irLJiiBBBBZ5BBBMMBBBMZMOBBBS577r0Bkj5Y1S52uJ5L
:.::;::,:,ii::i::::ri:i:::7ii:: .:XBBMBMBBBBBBBBBBBMBBBBqYY;;ur:iiriiiiirii
:,,ii::::::i,::::::r:::i:iri::,vOBBqXBMBBBMBP2777Uk2FBMMFj7v;iirirrr;rrrrri
:.::i::::,ii::i::::;i:ii::7:i:XOPi,:70BMUu8Yi:,.,.i7rUBGPj7r7ir;r;r;7r7r7rr
:,,:i::::,:i:::::::rii:i:iri:SXv:i,;Z8YiLOXv;;:::::rj7ZBEUrr;rr7rrr7rrrrr7i
i.::i::::,ii::i::::ii:ii::r:71r::::,:::7kq5L7ii:::irYrqBOur;r;rrrr7r7rrrrr;
:,::ii:i:,:i,::::::riii;:i;7NL::,::ii7EUk5ULrriii;i7LvMBGU7rr7;7r7r7r7rrr7i
i.::iiiii::i::i:i::i;irii:LvXu7::7kU2:NNqU5L7iiiiir77LBZBuvi7r7r7r7r7r7r77r
:,::::::::::::i::::::::i:7YjGMUU:.vY7:iGU1ULrriri;rLrNMMMUirr7r7r7r7r7r7r7i
:.::::::::i:::i:::::::ii:LU2XBBv  iriiP2vLJ7vr7;7rY75BBBMr;r7r7r7r7r7r7r7rr
:,:::::::iri::i::::i:iii:72uYBBNUririU0ur77L77r77u77BBBF7irrr7r7r7r7r7r7r7i
i,::::::::::i:i:::i:iiiiiiXUSqNk1r;rL8Sv7r7rrr77Yr:;uLr:i;rr7r7r7r7r7r7r7rr
:,::::::::,:::i::::i:iii::vP5GPku7:i5BjL77r7r7rLLi;riiirr7r7r7r7r7rrr7r7r7i
i,::::::::::::r:::i:i:iiri:vEZZS5Yr:LqU7L77r77YLr;7r7rrr7r7rrr7r7r7r7r7r7rr
::ii:iiL;i;Lr:77ir7Yiirviri:rGNN517;:j2L777v7LJri7;7r7r7r7r7r7rrr7rrrrrrr7i
i.ii:::U5Jrr7:11UjYL::;Y7;rr:18PX2jrii5L7777LULiv7vr7r7r7r77777777v777v7L7r
i:r7r7rUEXrLY71O05FUi77FJriUrUqEPP2Yri71r77Y5jiYJYvYvYvv7v7L7v7L7L7v7vr777;
YrL7LLYLJUULYLYLUjuLYYjj121UYukqZXq5j;L277UXL...L77r777r7r7r7rv777L7L7L7L77
Yrr7r7rrr7r777r7rrr7r7r77L77iUFkEEPq1125UXPr    i7rr;rr7r7r7rrrr;rr7r7r7rvr
7i7r7;rirrrrr;rrrr7r7r7rr;r;v7L;jE01F5SPEU: . . :rri;i;iiiii;i;iii;i;i;i;ii
L7vYLL7L7LvLvLLYLJLYLJYUU2UUMU:i:YGNFXkFi. .    ,j777777rrrrrr;r;rrririri;:
0Uuu11F5FUUuUj2jUjUuUu1U11FUFBv:r:7YLi,      ..,ir7r7r7r77v7L7L7L7L777vLL77
1PXPPNPNkS5S211F1FU5U22SSqPNSBBiii,,:::rri;77LvLr;2PSkFk1F5S1X5F2FFk5k1kSk1
k15UUU1U2U1U5UUjuJuJUU12F5FFPFBj;7YYSF1jJLL77r7rrirrv7r777v7v7L7L7Y7LLL7L77
52jUJ2uuYUjUjUjUJjJUYjJUUFFXkkPOXq15U2Lv7vrrrr;rrriii7r7r7777v777vr77L7Lr7r
5212FU1U1jUuUJuUUuUUS251PSX5F125Ek5jUju7v77r7rrrr;ririvLYLLvLLY7v7YLLvYvYv7
U5U52UU5jUUuJUjUj5S0jjJUUUUPSkFSFqkUYUYL7L77rrrr;rir;rirvL7LvL7LvS0L7YLYLY7
U52U1U521u1UF15USSNPNq008NEPSSPkPPNUUYULYLY7vr7rr;rir;rir7v7YYuJJJFUUu2UuLL
UkU2UUU12S1SU5U1U52FUS1F5S5S5XFXkPPZuujUvLLYvvr7rr;r;r;riLU2uUuUYYYYLYYjYJ7
5kSU12k252221UUJUu1U2U1151SFk5kSkSPq5JUjY7Lr7r7r7rr;rir;iiuJYLYLYLYLYYjYUJY
2FF525U225U125255FFkSXSXSqkNPqSP5S1XujYJLLLY7v77r7rrirrriiYSU2U2U525u2U1u2J
5UFUUu52525UFU5212F2kFXSNXNqNPNXNXPUjjUjuYYLYvv77rr;rr7;riu5F2FU551U2u1uUjY
UENF25UF55U2U5552XFkFXkXk0XNPNkPS1uUYujjLYvYvL7777r7r7;rir7YvL7L7Lvv7LvL7Lr
1Pq1kSkFF2UU2UkkPSkSk5FFXSqSqFFXkjuYuYjLLvLLLLL7vr7r7;7rr7LvYLLLY7L7YLYvYL7
UqkFF5uUU2U5U5FS1S5kSPkqPqkk21qqLJYuYuYjYYLYLLvL7v7L7L77vLLYLL7L7LYJYJLJvLr
1X02Fu1UUU1251F1k5XZEkS5kF15XEMkUYjYjYjLYYJLYYYvLvLLYvYvLLuYYvLvjqJ7LLv7jYL
UqXF5125UF5S1kFkFXXGZMZOGGq08MXX22uUjUjJLJLJLYvL7YLY7YYJLYLLLLvjuk2F1S55LL7
UF02k112FFS5kSXSXkXXNqEqNF0G8kXF2u2U1u1UUujvYLLvYvYvuUuLLvLvJYYLLvYYYLYvYLL
jk0F1F5FU55F5XFPFX5kFXSS1qGOPPFSUUuUJjJujJ7v7v7YJuUF1JvYLYLYLJLYLYLJYYLJYuv
S1q251S5F1F2F1F5F5kFPSPS0GOXXSFU2UUj2uUjUJYLYLuU5SP51U55FU5U2U5252F1SU51F15
11kPFXXNPqXPPNP0qEEGEG0E0MNqkFUUU2U2uUU2uUjUJUuSXPFSFkFF21USSXSkSX5Fk52XFX1
FkE1PXX5kFPXqXNqNqE00q0PEqNSSU2U2U1UUU1u2jUuU1XPr.:i  ;..LJ.rrrrLr:iijJrrii
FSPX15UFU12S1FSqSPkXSXSXXX5FuUuuYujUj2uUjUuF5F1Fi,:: :ri,YL,,::, ,:i.7i:,:,

---
. .,:.....:,..:...,::...,.i.....,.,.,7riri;iri;iririri;iri;ir;rirrr;7rrrrr;
.          .  .    ...... ,.         i::::::::,:,::::::::::::::::::::::::i,
, ,.,.,.,.:,..:...,,::::::;,,.,.:,:.:7riri;ii:::i:iiii;iiir;;iririririririi
. .,.........,,..,.,,,,:,:::,,..:,,.:7ii::,,,:,,.,.::iiiiii;iri;iri;;rir;ri
. ............:.,.....,.,.,.,,,.:,:.:ri,,iJ588B8MZ0Y:.::iiiiriiiiiri;i;irii
. ...........,,......,.,.,.:,,.,:,,.:;,7EBBBBBBBBBBBB1:.:iiii;i;iriri;iri;:
, ,...........:.,.,.,.,.,,:.:,,.:,:.,iEBBBBMOMBBBMOGBBB5,:iiiiriiiriri;irii
. .,.,.,,,::..,,.,:::::iiir:,,,,:,, .BBMSU77vZBMqqqGEMBBS::ii;iiiri;i;;r;r:
, .,:.,.,.:,..:.,.:::::::.7,:,:,i.. EBS::,,..;ZNGOMMMMMBBi:i;iiiii;i;iririi
, .,:.....,:..,,.,,i:,,:,:r:::,:i. JBGi:::.   iG0MMBOM8BB7:ii;i;i;i;iri;ir:
: .,:.,.,.::..:.,.:i:,:,:,r,:::,i.:BBPUri7Yvi.:SqGMMM8GMBv:i;iiiri;iririr;i
,..::,....::.,:,,,,;::,:::;:::::i.YBBXBU.JE8X;:XPMMMEGZBBY:iiriiiri;iririri
:.,:i.,.,.::..:,,,:ii,:,:,7:::::i.ZBqY1..,JY1::PG8M0EGMBBi:i;i;i;i;iri;ir;i
:..::,,,..::.,,,.,,r,,,:::r:::::i,GBvL ..,..  :M8ZNZNM8BOi:;i;iririri;i;ir:
:.,:i,,.,.::..:.,,:i:,::::7:i:::r.XBUJriii:.. YBZ0B08OOBBYiir;ri;i;iriririi
:..:i:,,.,:i.::::::r::::::r::i::i,ZBqu7:.,.,,:FBEMOE8M8BM1iiiriri;i;irir;ri
:.,:r::,:.i::::,:::r:,::::7:i:i:iYBBBuj7rii:i;MBMGMEBZMBMLriri;iriririrrr;i
:.,:i:,:,::i,::::::7:::i::ri:i::7BBBBq7iiii77NBBE8OMMM8MGv;iiririririririri
:.::r::,:,ii:::::::ri:::::7:i::.FBBMBBPYL;YU8BBGZ8BOB8OMGY;i;i;iririri;irrr
:,:i;:::,::i,::::::r:::i::ri:::uBBMMOBBBBXUX8BEGZBMBOEOBqY:iii:i:iiii;iri;:
i.::r::::,ii::i::::;i:i:::7ii;FZMMMZZ8BBBPXq8MMOMMOM05MME2uUF21jYvvrYvj7LYY
:,,ii:::,::i,::::::r:::i::7ii7jZBBBZZBMBUkMMOMMMOOEOEMGGZJi77ZBSjFj5SFUUY1L
:.::;::,:,i:::i::::;i:i:::viiiLUNF2ZBBBBPqBBMBBMMNM8MMBMGXr:;Ur:;iri;iiirii
:,,ii::::::i:::::::ri::i:iriii,,:  SMBBBMBBBBBBBBBBBBBBB0X27iiir;rrr;rrrr7i
:.::;::::,ii::i::::;i:i:::7i;i:,;7EBBBBBBBMF1Y1XMGJ2BBBME2UY7;rrrrr;rr7r7rr
:,,:i::::::i,::::::rii:i:iriii:YqMNS1MBB0ji:.,.:i77.iBMM0SUY7rrrrrr7rrrrr7i
:.::;::::,ii::i::::ii:i::i7iirS27,iuk00qU7r:::::i:7j.YBGGP577rrrrr7r7r7r7rr
:,:iii:i:,:i,::::::ri;ir:iiirLri::r8Z7JMUj7r:i:iiiiUY7MB8ZJ7;7r7r7r7r7rrr7i
i.::iiiii:ii::i:::iir;r;i:7Lv:::::::i:NN2YLii:iir;rJ2;BBBNuirr7r7r7r7r7r7rr
:,:::::::::i::i::::::::i::1Ui:ir;LY57uMNjJ7riiiriri7YrMOMZu7r7rrr7r7rrr7r7i
:.::::::::i:::i:::::::i:::GqJrrXq52LrLMk2YLr7iririi;LLBZM827rrrr7r7r7r7r7rr
:,:::::::iri:::::::::i:i:LBOY  :jJr;rGSFUj7vrr;rr7;7L0BMOMur;7r7rrrrr7r7r7;
i,:::::::::ii:;:::i:i:ii:rBMj  :Yr;;SXJuUJY77r7rYYJLi2BBBNri7r7r7r7r7r7r7rr
:,::::::::,:::i::::::i:i::7BBMU7rLr7E2vYYJ7vr7r7Yj7:iBBELrirr7rrr7r7r7r7r7i
i,::::::::::::r:::i:i:iiii,LBZ1r;7YkGYYLj7777r7vr:::r7r:iir;rr7r7r7r7r7r7rr
::ii:iiL;i;vr:77ir7Yi;rLiriiNM5LirLBPjLuL77v77LLii:rr;iri7rrrrrrr7rrr7rrr7i
i,ii:::u5jrrr:FFUJJL::;J7;7iiZ8u7iiU0YJjJ7v7LvY;i:r7vr777r7r77777rv77777L7r
i:r7r7r1ZX7LY72MqFSU;77SY7iUr5MqJ7i;FUYY77rv7Jri::rjvL7Lv77LvL7LvL7L7v7v77;
Y7L7LvYLYU1YYYYYUU2LYYJJ251UYrE8qYr:v2Yr77LYjLi::i7r777r7r77v7v7v7v7v7L7L77
Yrr7r7rrrr;rr7r7rrr7r7r77v77rr7OGqjrik777uJkuri7rLv7rrr7r7r7r7r7;rr7r7r77Lr
7i7rririr;r;r;rrrr7rrr7rrrr;ri:rMZquYqJYjUXui,,...:rri;i;i;iii;iiiririii;ii
L7vL7L7L7L7YvLLLLYLYLYYujUu1U2UUuGEqXq111k7.       ;vv77r7r7r7;rrr;ri;i;ir:
NuUjU2F15UUuUu2uUJUuUuUU1UF1F1F0UYOXkFk5u:.   . .  ;Lr7r77v7v7LvYvL7v7vLL77
5PPPX0XPkXFS55252F2F212F5PPNq0XZG;vX5UYi...        2qkFk1F1F1XSF1kFkFS5k5X5
F25uUU2U1U1U5uUjujuJUU22F1F5XSXFBvi:i:, .         .LYr7777v7v777L7Y7LvLvL77
51jUJUuUYUjUuUJUjjYUYjJUUSFkkPkS8Fr77LL7i;ii;rr7r7;rr7r77L7v7L777v777v7L77r
F2221U5u2jUuUJUUUj2US1F1kkk551F2P0XFS1SjjYYLYvL7v77rYYJLL7LvLLY7v7YLLvYLYv7
uFU12UU1j2uuYuJUuFkEYJJUUUuqSk5X50X1uUYY7v77r7rr;ri;7JLLvv7LvL7vvSNYLYLYLY7
U11U1U121u2UF152S5NqNNGE8N0qkSPXNqNSUYjLL7777r7rrrrir7L7Lr77YLuYJjFUUu2UuLY
uXU2UUU51S1S1525U115US5k5SFk5XFqkX0NYuJY7Y7v77r7rrrrir7jjuuUjUUUYYYYLYYjYYv
5kSU11S2F2121UUJ2U2U1U55S1S5k5kSXSEFuYjLL7L77r7r7r7rriiY5uuYYLYLYYJLYYjYuYY
1FF525U125U5U52SFkSXFPkkFqkqXqkqFk5UJUuJLYLL77r7rrrr;ri712U1U521U12FU2U1u1j
1UFuUu115212S212F1F2XFXS0XNN0P0XNXkUjJuLLLL7v77r7rrrr;ri2112F2SU555U1U2UUjJ
U0q5252F15212F5F1XFkSXkqXNXqXNXNXSjuJuYYvLvv7vr7r7r7rri;7LLLvL7L7LvvvLvLvLr
1PN1kSSSF21U22XSPkXSX5FFXSqXqXqXkuujUjUYuYLLL7v77r7rr;ri77L7YLYLY7L7YvYvYL7
UqPFFFuUU1U52F5S1k5XFXkNPqXX5kSUjuJjYuLYYYvY7vr7r7r7rrrrLjLYLL7L7YYYLJLJvLr
5XE2Fj1UUU12S1F5kFNZEPk5kF5FqkjYuYuYjLYYYLYvYvv7777r7r7rYYjYYvLLjqJ7L7v7jYL
UqP555152SFk5kFkFXPZEMZ8OOqZ8NYuYjYuJjYJYjLYLLvL7v77777YYJLYLYvjjkUF5F11LL7
USEUX555SSXFPkPSXkPkPXqkPqGEq2UuUJuYjYjJuYjYYvLLY7LvYLLvLLLvJLYvLLJYYLYLYLL
UPEF1FFF155SFXSqSXFkkXFFkG0021u1UUuUYjYjYJLYLYLJYYYJYYvJLYLJLYLYLJYYYYYjYjv
S1P1F2S5k5S1kFkFk5kSPFXX80qF2U2jUuUu2UUYUYJLYYYLYYULU2F5F25U1U515251FUF1515
25kPFXXEq0PqqNX0qEEZ0EE8q0S2U5u2U1U1JUJjYjYJYUJu2S5FSkFS25USSXFXSXFSSF2XSX5
FkGSPkPSkkqXqXNPqPqXN0GqNP5U1U1251F1UjUYuYujUj1Xr,i;  ;..7Y,r;r;7;:iiYYrrii
FkPkFF1S1F1kSkkNkPSPPNSkk1JUjUuUu1uUuUjjYujUUFSki::i :7i.v7,,::, .:i.7i:,:.

---
, ..:.....,,..:....:,.....:.... ,.,.,7ririri;i;iririri;i;irir;r;r;7r7;rrrr;
.                  .   .  .          i:::::::::::::::::::::::::::::::::::::
, .,,.,.,.:,..:...,,:,:::,i,,,,.:.:.:7ririri;i;iiiri;iriiiriri;;rr;irir;r;i
. .,..........,..,.,.,.,,:::,,..:,,,:7;riri;iii;iiiiiri;iri;i;iri;ir;rir;ri
, ............,.,.........,,,,,.:,:.:7ririiii::,:,::iiiiii;i;i;iii;i;iririi
. .......................,.:.,.,:,,.:v;;ii:,.:;7rr::...::ii;i;iii;irii;rir:
, ,...........,...,.,...,.,,:,,.:,:.i7rii,:YMBBBBBBB8Uv:,:ii;i;i;iriri;irii
. .,.,.,,,::..,..,,::::iiir:,,.,:,:.:7ii:jBBBBMMMBBBBBBBL.:ii;iiiri;i;;r;r:
, ..:..., ::..:.,.,::::::,r,:,:.i,:.ir:iMBBMMMBBB0OBBBBBB1,:iiii;i;i;iririi
, .,:.....,:.,,,.,,i:,,,,:;:,:,,i,:.i;rBBG7:.::i75BMZMMBBB0::ii;iririririri
: .,i.....::..:.,.:i:,:,:,r:::::i,:.:7BBP:,,:.  .jMEMOBOBBBL:iii;i;i;irir;i
,..:::.,..::.,:,,,:r::,:::r:::::i::.:BBP2U::.  ..iP80MG88BBS,ii;iriririr;ri
:.,:i.,.,.::..:,,,:;i,::::7:::::r::.qBG0ZGii1uv:.,q0NG8GOMBL:i;i;iriririr;i
:..::,,,..::.,:,.,,r:,,:::r:::::i:,rB5.rv, iGX7L;70EXO8MGBBY:ii;ir;ririr;r:
:.,:i,,.,.::.,:.,,:i:.::::7:i:::;,,GBr7r..,.7k2i:7ONZOMGOMBr:irir;ririririi
:..:i:,,,,::.:::,::r:,::::r::i::i.uBMrLYri:. .. .UMME8E8GBM::;iriririririri
:.,:;,:,:.::,:i,:,:r:,::::7:i:i:iiBBMjYr......,:UBB8OZ88BB7:ii;iriririr;rri
:.,:i::::::;,::::::7:::i::ri:::,iBBBZj7Y7i::i7r2BBBMMMGMBM:ii;iririri;ir;ri
:.::r::,:,ii::i::::ri:::::7:::::MBBMMYr;L7LLYL2MBBMMM8MMBXii;iririri;i;irrr
:,:i;:::,::;:::::::7:::i:iriirUMBBMOBBkjvUU2YXBBBMGM8MOBBY:i:i:i:ii;i;i;;;:
i.::r::::,ii::i::::ri:ii::7i;rukOBBEOB8SS2U5MBBMMGBMM8MMZ2U2kU5jYLv7YLu7LjJ
:,,i;::::::i:::i:::rii:i::rii72BBBM8MBMMGMMBMMOM8MMBZ8MBFrr77ZBSjSu5XF2UYFL
i.::r::::,ii::i::::;i:ii::7iii;rU7SBBBBBBBBMM8Z0MOO0SBBBNi;ir2r:;iri;i;irii
:,,ii:::,::i:::::::riiii:ir;ii:::.FBBBZX1NGBBBBBMMO08B8BMririiir;rrrrrrrr7i
:.::i::::,ii::i:::i;;:ii::7iriiir78Njr7rv1ZBBBBBBMBBBBMGMXiirrrrrrr;7r7r7rr
:,,:i::::::i::i::::riiii:ir;i;:::r27::,:iY20MBOUiB8BBBMMXMF7;rrrrr;7rrr7r7i
i,::;::,:,ii::i:i:iii:i:::ri;i::vXPLr::::,:.:7::.5MOBBBMPuEU7r7rrr7rrr7r7rr
:,:iii:i:,:i::::::i7;;ir:i;rri70BBSj7rii:i::,iLYU7YGBB8M8S2277r7r7r7r7r7r7i
i.::iiiii:ii::i:i:iir;riirjLriYFZONuJ7rii:i:i:r7LiikMMMGMGXY7r7r7r7r7r7r7rr
:,:::::::::::ii:::::::,rJY;i::iYL8P1Yvi;ii:i:::::v2kEBO8MMqJ;7r7r7r7r7r777;
i,::::::::i:::i::::::,vU7irrLkMOP0G1j77i;iiir:::iY0riLBO8Gqur;7r7r7r7r777rr
:,:::::::iri::i:::::::SN7ru1LBqUYq0XUY7rir:71Lir7S:,.;FBMBE27rr7r7r7r7r7r7i
i,::::::::::i:i:::i:i,FB:  .ik2LJqqFFJYrriir5jY7vr,.,v1BBBBFvr7r7r7r7r7r7rr
:,::::::::,:::i:::::::UO  .rJXJYuZ25UuLL;ri;rri:,:,,,1YBBBB2;rr7r7r7r7r7r7i
i,::::::::i:::r:::i:i::rBBM7i75Uk0kU1JYv7iri;iiii::.:5UBBBqi;r7r7r7;7r7r7rr
:,iiiiiL;irvr:77ir7Y;rrrrUBP7irJqBX12ULL7rirrriri:,,,irSB1:ir7rrr7rr;7rrr7i
i,;i:::uFJrrr:FSUJYYi:;Yi,jMk7ri70NU5uJLLr;rr;i:::::::7ir:rr777777v77777L7r
iir7r7r1ZP7LJv5M0FkUr77kYr:PBPvriY02JuJJ7vr7iriiii::,iYL777L7v7Lvv777v7777r
JrL7LvYLjU2LYLLYUuULYYJY152LFB0Yr:55YvJYL7L7ririi:::::Y77rv7Lrv7v7L7L7L7L77
Yrr7r7rrrrr7r7r7rrr7r7r777rriuMOUr;kYv7YvL7Liii;::::,:r7r7r7;rr7;r;7r7777Lr
7i7rrir;rirrrir;rr7r7r7rr;r;r:rPMFLk5LvLL7L7i:iii::::,;i;iiiii;:ii;i;i;ir;i
L77LvL7L7v7vvLLLLYLYLYYUj2U5U2YUEMPNX2YYvYJJri::::::::7Y77r7r7rrrrrri;irir:
0uuu12525UUu1u2jUjUjUu2u22FUF2S2UUEqXFUYuJYYUYLrrrr;rrUiL7L7LvLLL7L777LLL77
2qPPXNXqkXFk2F5S5S25152F5kkPP0PNkk50XS2u7:.. ,.:,,.:,. .Sk5k5kFS5SSXSSFXSXF
SU1uUU1U2U1U5U2uujUJ2U2U1U51XkqXPFkqZi7ii:,.           ,J7v7L7LvL7YvLLYLLv7
51jUY2juJUuUuUjUJjYUYJYuUSFXkqkXSX2qOi;ri::,...... ... vLLvv7L7L7v7v7L7Lrvr
S15U1U5U1j2jUJuu2uUukU51XkXF55F5XFSPZi;::.:.... ... . :UJvYLLLYvL7YLLLJLYL7
uFU12UU1u2UUJUjUuFSEJJJUUuUNkSFXSkFqPu7i,...         .rjLv7LLLvLvSEYvYLYLY7
U11U1U515u2UF5F2SF0q00EEONEqXSqPNPNkqSP51Y7ii:::,,::irv7L7vvYYUJjjF2UU1UULY
ukUUU2UF1kFk1FU1u55F2kFXFkSX5XSqPPkPFF2k1Xk2JuJuYjYuLL7jjUu2u2U2JJYJYJYjYjv
1XSU55S2F2111U2j2U1251F5SFSSXFXkPXX5q11UuLJ7LvL7v7777r7u1uuYJLJLYYJYYYuYUJY
1FF12F2225U51F5SFXkPSqkPSqkNqNXNSXFN55UUJuv7r777r777r7;u52UFUF21UF15U1U5U5j
1USU2u55F252S1FFF5S1XFPX0XNNENZqN1PqF52jjjY7v7777r7r7rr7S251S1S2F55U1U1UUjj
UE0S1F2F5F1F2SFk5XSXSXXqXNq0PPPPUSkXU22Uu2YYLLLL7v7777;7vYvYvL7L7LvLLYvLvLr
5qN5XkkSS15U15XkqXXkXFSSXkNXPPO155X1FujYUYvLL7v77r777r7r77LvYLYLY7LvYLYvYL7
2NXSSSUUUF152SFk5SFPkqPNqNkXqMP21512uFUUuj7LvL7L7L7L77rvYJYYLL7L7YYjLJLjLLr
5PE1Fu5U12F1SFkFXFqGZPXFXFS0MM5u5J5UUJjUUu2JjYL77r777r7vjLuYYLLLjqJLYvv7jJL
U0qFFF5F2SSkFXkXSXqG8MGOGZN8MMLujuj2U1uuLL7vvLLYLLLvrY7uYYLYLYvjjX1SFkFFYLv
UkEUPFSFXSPkqXqSqXqkNPNXZ0OOBNYjUjUuUU22UuUYYvL7Y7LvuLLLYLYvJYYLYLJLJLYLYYL
UP0S5SFS5kFkkPSqkqkXkXFEZOMMXFYuuUjUjUuUuUuuLuLLLuYuYLLjLYYYLJYYLJYYYYYJYuL
S1q1S5kFSFkFXFXFSFXkNkEZM80F1j1jUuUJ2uUYuYJjUuujuuuLU1FFS2F2525152S1k2F2F15
1FXPSPP0N0qN0EqGEZZ8N88MEPSSU2j2U2uUjUUUJjJuYjYujUu5XPFS252kkXSXSPFkkF1PSP5
SXGSNPPkqkNqZNENEN0NGGOqqXS2FUUU125Uju2UUjUjuJjUr,ir  ;..vY,rrrrvr:iiYJrrii
FkNPSX5X1S5XkPPEX0XEE0SF5FuUuUuUuUj2YuLjLjLYLjjUr::i :7i.Lv,,::, ,:i.7i:,:.

---
, .,:.....,,..:....:,.. ..:.... ,...,rri;iri;iriri;i;i;iriririr;r;7r7ir;r;r
.   .  .   .  .    .   .  .          ;:::::::::::::::::::::::::::::::::i:::
, ..,.,.,.:,..:...,,:,:::,;,,,,.:.:.:7r;r;ririri;iririririri;ir;rir;r;r;rri
..,,.....,....,....,.,,,.:::,:..::,.:Lrriri;i;ii:i:iiiiri;i;i;iriri;;ririri
, ............:...........,,,,:.:,:.:7rrri;ii:,.,.,.,:i:iiiiii;iii;iririr;i
. ............,..,.........:,:,,::,.:7rr;;::.:7U55ju7i...:iii;i;iiiii;iriri
, ,.,.........,...,.,.,.,.,,:,,.i,:.i7r;r::;XBBBBMBBBBMUL,::iiiiriririririi
. .,.,.,,,::..,..::::::::ir:,:,,:::.:vr;:iPBBBBBEMBBMBBBBO:,:iiiiririr;riri
, ..:..., ::..:.,.,::::::,7,:,:,i,:.i7r:vBBBOXZOBM8kBMBMBBB:::;i;iri;ir;rii
,..,:.....,:.,,..,,i:,,:,:;:,:,,i::.i7:jBBq7,,.,,ivB88MBMBBB:iiri;iriririri
, .,:.,...::..:.,,:i:,:,::7,:,:,i,:.iiJBB0i.,,... 788EMOMOBBU:iiiiiiriririi
,..::,.,..::.,:,.,:;::::,:r:::::i::.:LBB0Uq7,.....,kON0MEMMBu:iii;iririr;r:
:..:i.,.,.::.,:,,,,i:,::::7:::::r,:.iBBLkEGiiUSYr.,2MkNGG8BB7:iiriririr;rii
:..:i,.,..::.,:,,:,r::,:::r::i::i:..5Bj,:i..:EPL7vi08XXGZMBBi:iririririr;ri
:.,:i,,,,.::.,:,,,:;:,::::7:i:::i.,UBBirY,,,,i15r,iEZkNOM8BMii;irir;riririi
:.,:i:,:,::i,::::::r:::i,:ri:i::::qBB8rY77i:.. . .vMOGGO8BBL:;irir;r;ririri
:.::i::,:,ii::i::::7i:::::7:i::.;8BBBEULv...,,::ruBBB8OEMB2:iiriririr;rrrri
:,,ii:::,,:r:::i:::7:::i,:ri::,:EBBBMELv7L;ii77Y2MBBGEGMMBiiirir;rrririr;ri
:.::r::,:,ii::i:i:iri:ii::v:ir5GBBBOOMUr7rYjuLj5OBBGNZM8Bqii;irir;riri;;rri
:,,ii:::::ir::ii:::7i::i::ri;uPGBBMO0BBX55YUjXOBBBOEZO8BBL:iii:ii;i;iiiri;:
i,::r::::,ii::i:i::;i:ii::7:71MBBBBZOBBMBOGOBBBBBOGGBMMBNjU1S25uJLv7LvjvLYY
:,:i;::::::;,::i:::riiii:iri:i;7LqBBBBBBBBBBMMMBMMZMMB8BYrrL7EBSu5u5SS2UJ5L
i.::r::::,ii::i::::riiii:i7i;::.iUBMPjjL1EBBBBBBB8OGM8MMYi;irur:;iriiiiirii
:,:ii::::::i::i::::riiii:ir;i;:iJXv;:,.,:::2XL5BBMZG088Bui;r;ii7;rrr;7rrrri
i,::;:::::ii::i:i:ir;iii::7i;::,uFLi::i:i:::U:.YBMGNZGOOGi;;rir;rr7r7r7r7rr
:,:ii::::::;:iii:::rii:i:i7;:irkOPY7iiiiii::7rvUMBZZMBOEESi;rrr7r7r7r7r7r7i
i.::r:::::ii::i:::i;;ii:;7YrrvXBBSU77iiiiii:i2ZBBBMMBBMqkNJ;7r7r7r7;rr7r7rr
:,:iii:i:::;::i::::riirLL7ii:i7UMXJvriiii;iirkEMu1GBMBOMkPj7r7r7r7r7r7r7r7i
i,::ii;ii:ii::i:i:i:;LYrrir7UZOPMFjvriiiiiiirir7r;MOMGM8OFLr7r7r7r7r777777r
i::::::::::i::i:::::iMYr71kL2EJFGqUJrriiiiirii:r5Z5NM8ZMEkirr7r7r7r7r7r7r7;
i,i:::::::i:::i:i:::7M: .,:rXYL5NF5Y7rriii7riirYS7..FBOOG1rirr7r7r7r7r7r7rr
:::i:::::i7r:iii:i::7M   i7SYLLq25UuvvrriiLj77ru:,,:jBBBO5vrr7r7r7r7r7r7r7;
i,i:::::::i:i:r:i:i::rBBqr7LUYUqSUuYL7rrr;rri:::,.,7LPBMBFvr7r7r7r7r7r7r7rr
::::::::::::::i::i:i::LEBU;r7u081FUJ77rririi::::,.:jrGBBMUirr7r7r7r7r7r7r7i
i,i:::::i:i:::rii:iii::,qOJir;5MXF5YY77ir;7irii::.iYFBBEUirr7r7r7r7rrr7r7rr
:,i;iiivii;vr:77i77Yi;rr:MGUrriqN5jjLLrrirri::::,:.:rPYi:rr7rrr7r7r7r7r7r7i
i,;i::iuFJr;7:5S2JYY:irLi;B0U7ir0jY7L77rrrri::i::,,i7i;rr7vrvrv7v77777L7L77
ii7777rFZX7YJL1O0SFUrv7XYirB82ri117v7v7v77iiii:i::,7YL7Y7L7v7v7L7v7v777v7vr
Y7L7LLYvuU2LYLLYUUULJJuJ21JJMMS7uFL7v777Y7iii::::,:rY7777rv7L77777v777L7Y7v
Yrr7r7rrrrr7r7r7r7r7r7777vrr;0BqFXJYv77LL;irii::::,ir7r7r7r7rrr7r7r7777v7vr
7:rrr;r;ririr;rir;rr7r7rr;rii:YE05FjY7LYLii:iii::::i7rri;iriii;i;i;iii;ir;i
L77L7v7L7v7L7LLYvYLYLYYUuUU5UUYFP5ujLYYJLvii:::i:ii:7L77r7r7rr;rir;riri;ir:
NJUj52SU52UuUU2uUJUjujUU12F255SU0GE12UUYYLYr7;;::,. :L7rv7L7Y7LLLLY7L7LLL77
UXqqXqkPSX5F121F1F1F252k5XSPP0P0NkFSuJr;::,,..      ;EFS5X5F1k5S1SFk5FFXkX5
F11uUU1uUu2U1U2uUu2J2j2U1U5FPSPkN7i:::,.  .         ;Yvrv7L7LvLvLvJLYLYLLL7
FUYUJUuuuUJUu2jujjjuJJYUUSFXkPXqZF:rrri:...... . .  iLr7r77vvL7L7L7L7Lv77vr
SU1U1u2UUj2jUJuUUuUUk151XSkFFFS5EZriri;i:....      .7rJLY7YvLLY7v7LvLvYYYvv
uSU2UUU1u2uuJuuUU5SEJJJUuuUNXXFkSMv;i:,:.         ,r7rrJvL7L7LLLLkNL7LLJLY7
U55U2U115U2USFk2S5qqNNE0ONEqPk0P0NqUj7;i:,:,:,:i77Jv7;r7vr77YYuJjjSU2UUUULY
uXuUU2U52F5S1F22u21F5S5SFkkXFXSqkXXNPPkX2UJjYujjLL77rr;rJ5uUu2UUYYYYLjYJYJv
1kk215S151521UujUU1UFUF5kFkFXkXXPPN5kSk1SjJLL7v77r7rrrri7UUYYLLLYLYLjLjJUjY
2F5F2FU1U1U52FUkSXkXkqkPkPXNXNPqkX5SFkUUuY7v77r7r7r7rrr7iL21U222U5152U25U5j
5UFU2UF2F2F1S1F1F1S1SFkSNXNNEq0NNkkFk55UUL77L777v77r7r7rr;52k1F2F11U5U2uUjJ
20NF2FUF1F112SFk5XFkSXXNPNPNPNPNX51NPS11UjvLLLvL7vr7r7r7;rLYLL7L7L7LvL7LvLr
1qq5PSSFF25U12kSPkXSX5kkXXNPqSq802FS01F15uJLL77r77777r7r7;7LYvYYY7YLYLJLYL7
UNPFS5U2U5U51F5S1S5XSPXqPqSPSNZM1F1NXS12uULYYY7L777v77rvrrLYLL7L7LYjYJLYvY7
1PE1Su221UF5S1FFXSNEGqXFPSFFEEMG21SSXFS15UjYjYYvL7L7L7vr7rjYYLLLuqj7L7LvjYL
u0qFS51S5SSX5XSXFqNO8M8MGGN008MEJ5U2U1U2u2jYLYLLLL7L7v7vLLYJLYLjjk1SFSS1YY7
UX01q5k5kFXkPkqkPkPPNq0PqqZ0G8B5YuUjUUU21UULJLY7L7LvLLJvLLLLYLYvYLYYYLYLLLL
UP0F1F5F2SFkFPXqkPkXSqXPXZZOMMP2YujuYjYUU5UUuujUJYYYYjLLYjLYLYLYLYYYYJLjYuv
S5P5FFX5kSk5kFXFXSXkqXqq8GMOEUUU2jujUJujUYuJUjUJ2uUU1JjuS1525U5U51S2S2FFS5F
1FXPkPPEN0qNN0q0EG0GEG088M0PU521uUuUUUu1UUJUJUu2j5FSF11F2F2FFXSPFqFkFS2kFPF
SPOSqXqSPXqPNP0P0qENENO8OPPUF22U2Juu2u2U1U1jUu25r,i;..r..7Y,7rrr7r:i;Jjr7ii
FXqXSS5S5XFqkqX0qNXNqZ0qSSuUuUjujjLYYjuUJuYjJjjU;::: :7i.Lv:,::, ,:i.7i::i.


---
, ..:.....,,..:....:,...,.:,,.,.:.:.:v7;rrr;rir;ri;ir;;irir;rrrir;r;rir;7;i
.   .      .       ..  .  ,  .  ... .r:i:i::::::::.....,,::::::::::::::i:::
, ..,.,.,.:,..:...,,:,:::,;,,,,.i,:.:v7rr;rrrii:,,:i;ii:,.,:iiri;irir;r;r;;
. .,...............,.,.,.,,,,:.,:::,:Lrrrriri:,i2BBBBBBBZkL;.:iiiriiir;riri
. ,...........,............,,,,.:,:.iv7rr;r::iEBBBBZMMBBBBBBN:,:iiii;iririi
. .........................,,:,,:::,iLr7rr::UBBBBBMMM0OBBMOBBBY,:ii;iiiriri
, ,...........,...........,,:,,,i::.;v7r7::0BBXU5FXSUMB0MMMGBBBS:i;i;iririi
. .,.,.,..,,.....,,:,::::ir:,,,,:::,iYr7ii8BN7,....:jB08MMGZGMBB7:iriririr:
, ..:.,.. ,,..,...,::,:,,.r,,,:,i::.rL7i:PB8r::,:...vP808EENZNMBU:iiriririi
,..,:.....,:..,....i,..,,:;:,:::i::,;YrijBBZ0v:i,.. .5MqXZ0ZEZOBr:i;iririri
: .,:.,...:,..:.,.,i:.,,:,r,::::;:i,7L7rBB5FO;i181Y::LMX5NGZENMBr:;iriririi
,..::,....::.,:,.,,;:,,,,:r:,:::;:::rL;5BJ:r. .UZ0JLivZG1P0GP0GBi:iri;i;iri
:..:i.,.,.::,,:,:,:;:,::::7,::::7:i,7LrEB7J.....ii:..iGMOk0N8OBk::;iririr;i
:..:i:,:,,:i,::::::r::::::r:::::ri::rLLBOLj7i::.. ..:jBBMGSNBBBv:;iriririri
:.,:;,:,:,ii::i::::ri:::::7:i:i:7:i,77ZBOUJr,.,,i:rruSBBBENGBBBrii;iri;irii
:.,:i:,:,,:;,::::::r::::::7i:iiiri:,rkBBMur77i:iir7YuSMBBO0MBBBL:iiriririri
:.,:;::,:,ii::i::::ri:::::7:iii:7::,jBBBBS7i;rLYYvLvSBBBBMMGBBBv:iririrrrii
:.,ii:,:,,:i,::::::r:::i,:riii:irir5MBBMMBBX11jJvLL0BBMBMBMOMBB5:ii;iriri7i
i.:ir::,:,ii::i:i::;;:ii::7ii:i:7ir70MBBBMBBBMMMBBBBBBO8MMBOBMB8;iririrrrri
:,,i;::::,:r::ii:::riiii,:riii:ir:;2BBBBBBBBBBBBBBBBBMEGMBMMOMOBv:i;i;iri;:
i.::r::,:,ii::i:i::;riii::r:ii;ii::,UUr:::::72M8BBBOZqEGBMZEO88BE77rL7J7LYJ
:,:i;::::::i,:ii:::rii::,;777riirYYvYji:,:,,,iYBBBBMZMGBBBG0GBOM0FY1SF12YFL
i.::r::::,ii::i:i::ii::i7r;ii:::77PX5Y7ii:i:::.rZuBBBBBBBBBZEGBMPiiiiiiirii
:,:ii::::::;::ii:::;::Uuiii::iiJ7rFNjLri:i:i:i:;Y.iBBBMBBBBM0ZMBNrir;rrrrri
:,::r::::,ii::i:i::i:7BY:i2jYXXPFUB1Yrrii:i:iii7L: 1MMMMBBB8N5MB2irr7r7r7rr
:,:ii::::::i,:i::::r:Mv   .vFUriiFXu77;i:i:iiiiLLi.5BBMBMBMGukBX:r;7r7r7r7i
i.::i::::,ii::i:::ii:7E7:,7Y7:::115L7rriiii:iiirj:iNBMMMBM8FYLSiir7rrr7r7rr
:,,:ii:i:::i::i::::r:iBB2rr7:i:U1UjL7r;;i;i;7ri7v,LOBBMBOBqur7irr7r7r7r7r7i
i.::iiiii:ii::;:i:iir:iOUii7riUFjvL77rriii;vvirY7iZBBGMMBMX7;irrrrrr7r7r77r
:,:::::::::i:iiiiiii:::O2;irLSqUjL7Lrr;rirY2YJYr,:YOB88BBBUvirr7r7r7rrr7r7i
i,i:::::::r:::;iiiiii::NNL;ivESjU7vrrrrirvvr7i,.:,iZMEBMBM7irr7r7r7r7r7r7rr
:::i:i:::i7riiii:;i;ii:5GU;;iS1UYL77;7r7L7:::::i:i5qZBBBMLirr7r7r7r7r7r7r7;
i,::::::::iii:r:iiii;ii;B5YiiUkL7r777r7YJrri;i::rYJYqBBjr:rr7r7r7r7r7r7r7rr
:,:i:::::::::iii:i:ii;i:NMU7:1U77v7L7vLLii:::,,;vUr;ir::irr7r7r7r7r7r7r7r7i
i,i:::::i:i:::r:i:;iii;:rB0J75Jr77L7YYJi::::::;rYYr;rirr7r7r7r7rrr7r7r7r7rr
:,:iiiivii;Lr:77ir7Y;r77,5MqFXJj7YvYYjriiiii:r7LJv;7r7r7;7rrrrr7r7r7;7;7r7i
i,ii::iUSj7;7:5F2jYLiirLr:GPXFUjjvYYY7ri;:ii;7YYYr7r7rv7777r7rv7777777v7v77
ii77r7r10k7LYv1OESF2r77kJi70UUjULJLYr;iii;i;:YUJ7LLLvL7v7L7v7v7v7v7v7v7777r
LrL7LLYvJJULYLLYujULYYjj1UY5E55uUuUL7;ii:..  ,Ur7r7r777r7r777r777r777rv7L77
Yrr7r7rr;rr7r77rr7r7r7r77v75F2Lvr::.          77rrrrr7rrr7r7rrrr;7rrr77777r
7:;iri;i;i;i;ir;rr7;7r7;r7urrii:, .           7rri;iririiiriii;iii;iii;ir;i
L77LvLr7777L7YYJvYLJYuj2U5Nririi,...          rYv7r77777r7r7rr;r;ririri;i;:
Njuj121U2UUuUu2UUjUUU2F5SSEUirr::..        .:irvL77r7r7r77L7L7LvLvL7777vL77
1PPXkPkkFk5522U1255FU55PX00Brr::,......::r7YLLrriL5XFk5S1S1F2k1F1FFkFSFXSX1
SUUjUU1UUu2u1UUjUjUJ2UFFPkqEk7Lrv777YLYLYvvr7rriri;77r7rv7v7v7v7L7YvY7YLLv7
FUYuYUUuJUJUu2jUUUjUj2u5SqX0EPSSSkJUYY77rr;r;r;r;riiirr7r7777v7L7vr77v7vrvr
5U1U2UUuUj2JuJUUUuU2XSFFPkPSXSSU2UY7v77r7rrrr;r;r;r;iiLLYvYvLLY777LvYvYLYvv
u5U2uUj2uUjuYjUUUFXEjuu2U120qqXkJ1Jv7L7vr7r7rrrrrrrr;ri7LL7L7LvL7SNYvLvLLY7
u12U1U525U2U51k5FSNN0NZZMEZNqXGk2J2LYvv77r7r7;r;r;rrr;;ir777YYuJYjFuUUUUULY
jSUUU2U52F252511U11S1kSkSPXPFXkEXUuULYLL77r7r7rrrrrrrr;ir1jUjUuUYYYYLYLjLY7
1SSU21S2121U1uUjUU5U5251SFkSqXqq01UUUYYYYvvr7rrr7;rrrrri;uUYYLYLYLJLJYjYUJY
2F1FU1U2U1u1UF2k5PkPFPSXFXX0PNXqSku1UjLYvv7777r7r7;r;r;r;UU1U511UF21UUU1U2j
2U1jUu51FUF2F25UF1S5XFXkNkNN0q0qP2UuUYLLYLLv777r7r7rrrr;72FUF252511U1U1uUjJ
UNq125U52F252FFS1SFkSPkqPNPNPqP05UuUU2YuYJLYvL77r7rrrrr7rYLLvv7L7L7L7L7v7vr
2Pq1PFk5F21U1UkSPXXSX5kSXkqkkF8SUjUuUjJYJLJLL7L77r7r7r7rLvvvYvYLL7L7YvYLY77
UPX5S5uUu2U1255S2S1XSXSqPqSFFBkUjUuUjuLYLJYYLYLLLLvLLL7LLJvLvL7v7LYjLJLY7Lr
2X02kj2U1UF1FUF5XSPEZXkFX521M8YYUu2j2jjYjLYLJYLvLvYLYYLLYYjYYLLLuqj7L777jYL
u0q5S11F1SSXFkFk5XP8GMGOZZ0M8kUUu2jUuuJUJjYYLJvJLJLjYjYuYYLYLLLjjS255SF1LY7
US01k1S2SFkFPSXSXSPXNqNXqPOEE5S22jUUUJjJuJuLJLYvYYujYvJLLvLvYLL7YLYLYLYLLLL
jkEF2F15UFFF5XkXSXFkSqkkk8ENPk15JUjUjUjUYYLv777Yu2uYvYLJvYLYLJLYLJLYYJLJYjv
S2X5F1S5S5k151F1kFXSPXPPM80PX15U1jUuUjUuY7v7LLU2k551FU52FU1U1U1U11SUSU5FS15
15SqSPPZN0qqqqP0NE08EZNOMGqq1F1FU2jUj2u1jujUj25qSkFkFX55U1U5FPFk5XFSSF1XFX5
FPGFPSXSPkPSPkqPqqZN0qOOZq025251S11UUjUu2u2UF1kPr.:i  i..vY,rrrr7r:irJjrr;:
FXXX55252F1k5kFkSqXPk8OESPU2uUUUuUu2jUuujUU1U25Fi::: :7i.vL,,::, .:i.7i:,:.


---
, ..:.....,,..:.,..:,...,.i,,.,.:.:.:vrr7;rir;rii::.,.,,::ii;iririr;riririi
.   .      .       ... .  ,. .  ... .7:i:i::::...:irrri:....,:::::::::::::,
. ....,.,.:...:...,,:,:::,;,,,,.i,:.:L7rr;ri:,ijMBBBBBBBBM0v:.iii;;ir;ririi
. .................,.,.,.:,,.,,,:::,:Yrr;ri::5BBBBEM88BBBBBBMv.:iiiiiririr:
. ............,............,,.,.i,:.iv7rri:;BBBBBMMEqMB88ZMMBBE,::ii;i;i;ii
. ........ ................,,:,.:::,iLrri:vBBXr77v7YEB0EEMG8GBBM:iiiiiiri;:
. ,.......................,.,,,,i,:.iv7;i7BMY::....:qEqZMOONOZBBY:iiiiririi
. .,.,....,,.....,,:,::::ii,.,,,:::,iYr;iBBk:::....,rE0E8GEGEOBB7:i;i;irir:
, ..:.... ,,..,...,::,:,,.r,:,:,;:i.rL7:0BBBMrr77::.,kMFGEZ0GEBB7:ii;i;irii
...,:......: .....,i,..,,:i:,:,:;::,rYiLBOJq2.iq8Bji:UGFkG0GN0GBv:i;iri;iri
: .,:.,...::..:.,.:i:.,,:,r,:,::r::,7LrSBvi,. ,vYN1::YOSXNGEqkGMv:iiriririi
,..::,.,,,::.:::.:,r::,:,:r:,:::ri::7Y;GBJ7..:.,.  ..Y88qZ0NqOGEiiiri;irir:
:..:i,,.,.::,,i::,:;:,::::r:::i:7:i,7L7MMLUi::i,,..:r5BMGXPqMMMqi:iiriririi
:..:::,:,.:i.::::::r::::::7::i::ri::rLUBMULr,:,::i;7JPMM0XSGMMM87ii;i;i;iri
:.,:i,:,:.:i::i::::ri:::::7:i:i:7:i,rYMBBjr;7ii:rrvLUqBMEPNNBGBM1:ii;i;irii
:.,:i:,:,,:i,::::::r::::,:r::i:i7i:,rqBBB07iir7JYJ7LkBBGNMEEM8OBSi:ii;iriri
:.,:i::,,.ii::i::,:ri:::::7:i:i:7:::2BBOBBB0111Y7irUBBBkEMMNO80MMi:i;ir;r;i
:.,ii:,:,,:i,::i:::r:::i,:ri:i:irii7PM8BGBMBMOkNXEBBBMk0NMOGNMXMBqiiirir;ri
:.::r::,:,ii::::i::ii:ii::7:i:i:7i:iqBBBBBBBBBBBBMBBB8PkZ88P0ZGSMBj:rir;r;i
:,,ii:::,::;:::::::rii:i,:ri:iiii:,:5MFUuUJuu5ZB8PNBBBMFPEBqSEGNqBEi:ii;i;:
i.::r::,:,ii::i:i::ii:i:,i7r7;i:i77r257:.....,;kMMBBBBBSG0BB0X8ZN0MY77Y77YJ
:,,ii::::::i,::i:::ri::rr7ii::,:iYJP127;::,:,::iqY2BBBN0EGMBBE0OGEBqU1UuY1v
i.::r::::,i:::i::::ii,7Si:i:::ii7ii55Lv;i::::::,Y0;ZB8E0ZNMMBG8GMGBU:iii;ii
:,:ii:::,::i:::::::;:iOEi:vU7F1UPjkBjLrrii:iii::vPPMMMEG0Z08ZMONGBErirrr;ri
:.::;::::,ii::i:i::i:YG   .,X5L;:rk5Y7r;iii:iii:uYi2M8OZOGM8OGXuBSi:rrrrrrr
:,,:i:,::::i,::::::r:iFL,.rLv;,,iS12L7rriiiiii:iLJ,LBBMMZMMMZSrJYiirr7r7r7i
:.::i::,:,ii::i:::iii,FBNr;Li::7FLjYL7rrrii:iiii7r,1BBBMMOMMP7r;iirrrr7r7rr
:,,iii:i:::i::i::::;ii.N2r:r7ivSYv7L77rr;rii77irv;LBZBBBOBMB17ir;7rr;7r7r7i
i.::iiiii:ii::iii:iir;iqXrii7YNuY7L77rr;ri7Ju7JY7,jjUBB8OOBBF7rrrrrr7r7r7rr
::::::::,::i:iii:i:i:i,5NLi;rXSjLY77r7rr;7vYv7;::::vM80MOMBBvrrrr7r7r7r7r7i
:.i:::::::i:::i:iiiiii:LMjrir1kYY7Lr777r77r::::::ivLLUBBBBGriirr7r7;7r7r7rr
:::::::::i7r:iii:iiiiiirMXv;:UuL7v77r7rvL7;i:i::rLriiUkMM2::irr7r7rrr7rrr7i
i,::::::::iii:r:i:iiiii:q81r:jj7v7L777vv7iii:::iU7r;rii:i:ir7r7rrr7r7r7r7rr
:,::::::::::::ii:i:iiii:;BNurPL77LLYLYL7:::i::iU7rr7rri;irrrr7r7r7r7r7rrrri
i,::::::i:i:::i:::iiiiii:2MSk1jLYLYLjLvii:i:iijLrr7rr;rr7r7r7r7rrrrrrr7rrrr
::iiiiiviiiv;:7rirrY;rr7:iZZPSUUjJYjLLiiirrr;JJ7r7r7;7;rrrrr;r;r;r;ri7;rrri
i,ii::ij5Jrir:UFUJJLii;Lr:JXSU5U2jULY7rii::,:YLr7r7r7r7r7r7r7r77777777vr777
::r7r7i1ES7LYL2OqFSUr7rkYr:q52JYiii:....     ijYLYvLvL7L777v777v7777r7r7r7r
LrL7vvLLJJuLLYYLuuULjYUYU5Lrrii:,..          .Yr7rrr7r7r7r7r7r7r7r7r7r7r7rr
Yrr7rrrrrrr7r7rr;7r7r7777ULr;ri:...          .vrir;r;r;rrrr7rr;r;rr7r7r7r7r
7:riri;iii;i;irirrr;7r7r7rUi7ii:...          .7rriri;i;iiiiiii;i;iiiii;irii
v77LLL7v7v7L7LLYvYLYYjJUU2EU;i,, ... ..::ir77rrL7L777777r7rrrr;riririiiiir:
PYuJ2U5U1UUjUuUUUuUuU2FFXSqk7r7777LvYLYLYvv77rri7r7r7rrr7r77v7v7L77777v7v77
UkXkSkFXFF15212F1F5S2SFPX0N8kF2XUJLL77r7;rir;ririruPSS1F252F2k1F2F1k1SFkFS2
1UUJUjUjUj2U1U2uUj2u1USSPXqSNkUjU7Lr7rr;rrrir;riiiir7r7777vr7r77v7L7v7L7v7r
2ULJJUjjJUJUjUJUuUjUuUUFFXSNXNUUuLrL7vr7r7;r;riri;ii:7r7r77777r777r7r777r7r
2U2U2jUUUJUJuJUUUuU1X5FFqkXFSkkJUYL7Lr7r7rrrririri;iiiLvL7L7LvL77rL7L7LvYv7
j1jUuuj2JUJjYjjUU5kEjuj2U21NPPXUJUvLLv77r7rr;r;r;r;riiiLLL7L7L7v7SqLvv7LvY7
UUUuUU2UUuUu11F1FSqqNNEEOEZNNP05UjULYvL77r7;r;ririr;riir7r77LLjYYY5uUUUuuvL
JFjUuUu2U52F2F11u52F5SSkSkkPFPkqJUjJ7L7777r7rrrr;rir;riiYUjUJUjjLLLLvYLYLY7
2F5UU1FU222U2uUuUU5U52F1SFkFXkqSuJuLLLYvL7vrrrr;rir;riiiujjLLLvvYLYLYLYLuYL
U122u1uUU2u1U5UFFPSXkPkPSqP0PNX5YuuUYJYJLL77r7;r;r;ri;irU1u2U2UUu222UUU2uUJ
Uu1JuJ1U1U5USUF252F1S5XkNkNq0qXjuJUjYLYLY7v7777r7rri;ir7FU2u1U522U2U2uUjjYY
uqP1U2U125U21F5S5kFkFXSqPqXPSqUuJuJJvLLYLLvv7777r7;77L7L7L7v7v7v777v7v7v7vr
UkX2X5F1521U1UFSPSXFk5SFkFPF52uJUJUYYLYYYLYvv7v7v7Lv7rL7v7vvYvLLL7L7L7L7Y7r
jPk112juu2u2252S1S1kFXkPkP1XNULjJjJjYYLYLYLLvLvLvLvv7YYYLY7L7v77rvLJvYvY7Lr
UkNU5JUU2U52F2F5kFq00Xk5FUF005UuUJuLJYjYJYY7L7v7v7YYjYJLYLYLY7L7JPY7v777YLv
jPP551252FFkFk5S5kPGZ8E800G0S521uUjuJUJjLL7v7vLYY2UUYJYJLYLLvLvYYFU5252ULL7
UFNUk252S5F1SFXFkSPSqqqFqGZSPU5UuJjJujY7L7L7L7uj5uv7L7YvL7L7YLL7LvYLY7L7Lvv
jSP12521U1252kSkFkFS5X5XZGkX12U2jUuUYjYYvYLYYU1kUY7L7YvY7YvLvYLLvYLLLYLJLJ7
5Uk251S251SU5251F1S5PFPEMNPS2U1U1UUuUJjjuJjj12511U551UF25U2U2u1U2U5U5U51F21
11SkFXXNPqPPXPkNq0PZN0EMZ0F5U121U2UUu2YuYuUF5uYX5kFkFkF5UUU51X5k1k5S55US1k5
1kG5kFk5SSXSXSPkXPPXN0MG0Sku521U221U1uUu21kUujFXr.:i  i..7L.rrrr7r:iiYYrri:
2kXS12U5U1uS1F1kFXFkPZZNFFUujUYjYujUJujUUFJLJU55i,:: :ri.v7,,::, .::.7i:,:.

---
, .,:...,.,,..:...,::...,.i::,,.:.:.:77rrrri:..rF0O88ku7r:.:;irir;r;rrr;rri
.          .  .    ...... :. .  ... .ri::::.,L0BBMEGZBBBMGj: ,:::::::::::::
, ..,...,.:,..:...,,:::::,r,,,:.i,:.iL7r;i:LBBBBBZMZBBBBMBBB5,:i;ir;riririi
, .,..............,,.,.,,:::,:,,:::,:Yr7iiPBBBOOZEFMBB0ZEMMBBB::i;ir;rir;ri
, ............,............,:,:,i::,iv7iiqBZr:::::JBBXZ8MOMOBBB::i;i;iririi
. .........................,,:,:i::,iYiiPBFi::,. .:kENMBMM8MMBBr:ii;i;irir:
, ,...........,...,.....,,:,:,:,i:i.;LiuBBXri::    iOGGMMMMOBBBi:i;i;irir;i
. .,.,.,..,,.....,,::::i:i;,.:::i::,iv;BBMBB:vSPYi.:PMSMMMMMMBBr:;i;i;irir:
, ..:.... :,..:...,::,:::.r,,:::r:i,r71BNYFi iNEB1rikZFGMOMNZMBv:iriririr;i
,..::.....,:..,,.,,;:,,,,:;:,:::i:::rL0BJ;   .ii7r.:UGP8MMZ00MMv:ii;;ririri
: .,:.....::.,:.:,:;i,:,:,r:::::r:i,77MBYLi::,.   .:SOGZMEENMOMr:i;iriririi
,..::,,,,.:i.::::::r::,:,:r:::::ri::;YMBuUi,::.:.:ij0BGGq0ZZGMM5iiir;ririr:
:.,:i,,,:.i:,,i::::ri,::::7:::i:7:i,r5BB5LL::,::;;LuGB8NkSBNOMMGu:iiriririi
:..:i:,:,,:i,::::::r:::i::ri:i:i7i:,rBBBUr;7rr;77YY1MB0qkNMGEMMBU7iiiririri
:.,:i,:,:.:i,:i::::ii:i:::7:::i:7::,5BBBMj7irLUUUv7NBBE0GqO8ZZBMq7ri;i;irii
:.,:i:,,,,:i,::::::r:::i::7i:i:ir:i1BBMBBBBNkPU7iruBBONZ0Z0M8OMBM1iiirir;ri
:.,:r::,:,ii::i:i::ri:i:::vii:iiL;YFGMBMBMBMB000qOBBN0EEGZZ8BGMMBZririr;rri
:,,ii:::,::i,:i::::riiii,:ri:i:i7i;5BBBBBBBBBBBBMBBBZENZZE0ZMMEMBBY:ir;r;ri
i.::r::::,ii::i:i::iiiii::7:iiiii,iLGSJJYv77jLPMXSMBBMO5OOZNMMEZBBki;i;irr;
:,,ii:::,::;:::ii::riiii,i77rri:ivLkPji:.....:ikZFNBBBBkPBMOZM00MB0;:iir;;:
i.:ir::::,ii::i:i:iii::rvri::::,rY2EPjvi:,::::::NSU8BBBq0GBMMMMPMBM7L7jLLJj
:,:ii::::::i,::i:::ri:rXi:iii:irr;rX2J7r:i:i:i::7PP8MBBMZZMBOMGEMB0UFS5UY5L
i.::r::::,ii::i:i:iii:MG;:JUrk0uqkMZUv7ri:i:iii:LLLFBBBBMEMMMMMMBBY:iiririi
:,,ii:::::ii,:i::::r:LO    .LFLr:YqSY7rriiiiii:iYYiiMBBBMEOMGMBBB1:rirr7r7i
i.::r::::,ii::i::::;i:X;,.7v2ri:YFkuYrrr7;;ii:ii7jirM8BBBEMOMMBOUi;r7rrr7rr
:,:i;::::::;:::::::;::UBZ7iY;::J5jJuYvr7r7iiir:i;Y:UMjBBBBMMMB0v:i;7r7r7r7i
i.::r::,:,ii::i:i:iii:.107i;viYSjLjJL77r7;r7j7iiYYiEPLBBBMBBBMkrrr7r7r7r7rr
:,,iii:i:::;::iiiii7ri:1EviirU02YY7v77rrirv1jJvYLi,riJBBBBBBBB17;rr7r7r7r7i
i,::iiii;:iiii;ii:ii7riLBurirUZYULL7777;rr7r777:,::i7OB5MBMPBNLirr7r7r7r77r
:,::::,::::i:iii:i:i:i:iMPrri1XJjj777L7rr7i;::::::iL7Y;7BBGOBvirr7r7r7r7r7i
i,::::::::;:::i:iiiiiii:08uiiJ2YY7v77777L77rrii::rL7rii7Z5FE7:rr7r7r7r7r7rr
:,:i:::::;rriiiiiiiii;i:rBPL:ujLrLJLvL7Y7r;rii::iL77r7rr:::iirr7r7r7r7r7r7i
i,::::::::iii:riiiii;iii:FB5LSJvLYUuYvY7iii:i::ivr7r7r7rrrrr7r7r7r7r7r7r7rr
::::::::::::::ii:i:iiii;::OMNNujJUjUYY7rrrii::i777r7r7r7r7r7r7r7r7r7r7r7r7;
i.::::::::i:::i:i:iiii;ir,vMGkSUUUUUU77r;ir;ri777r7r7r7r7r7r7r7r7r7r7r7r7rr
::i;iiiLii;vr:77ir7Y;7rLii:20P1FU1JJY7r7ii:i:i7Lr7r7r7rrrrr7r7rrr7rrr7r7r7i
i:iii::UFj7r7:5k2jjLi:rL7;iiU1UYLi::.   .     .Lvr77777777v77r77777r777777r
i:r7rr;5GX7LJv1MNkkU;77ku7i1rr;;i:..           jYJLLLL7L7Y7L7L7v7v7v7v7777r
YrYLYLYLjuULYLYLUu2YjYUJ2SFX7r7ii..           .7vr7r7r7r7r7r7r77777777v7L77
Jrr7rvr7r7r7r7r7r7r7777v7vrUu7r:..             7rr;rr7r7r7r7rrirrrr7r77v7vr
7ir;rrr;ri7rrr7r7r7r7r7r7rr7Sr;:i:::::i:r;r77;rr7ir;r;ri;ii:ii;i;iiiiiiirii
LrLYLY7L7Y7YLYLYLYLYYUu11F2Sq51kF1JUjuLYvYLv7vr7vL77rvv7r777r7rriririiiii;:
NjujUU521UUj2U1U1j2U12XSPXqkq0q22Lv77r7r7r7;ririrr7rrrrr77v7L7vvL7L7LvL7L77
2qPPSPkPSS1F2F5S5k5X1SkqPE0ZEEFUjj7v77r7r7rrrr;riiJqSXFkFF1F1S5k5kSXFXFPkX1
SU2uUU1U1U1U5U1U2U2u55XXqPPXNXkJUYLvY7v77rrr7rri;ii;vr77v777vrv7v7L7L77vL77
F1Yuj2uuJUuUu1uUuUUUu22FSqPNXNXUJ2LLvLr777r7;r;ri;iii7r7r77L7v7L77rv7L7L77r
55125U2u2uUuUj2U2U21qSkSqPNSXSN1ujJvLLL7v77rrrrrr;rii7YvYvL7LvY7v7LvY7LLYvL
uFU5UUU2uUjUJUU1UkqGUUu125FE0qqFJUujLYvv77rrrrrr;rrri;7YLY7L7L7LLF0YvYvYLY7
U1UU2U221U2U55SFXk0NZZZGMZ8EEPESuJULL7L777vr7rr;r;r;rir777v7YYUJjjSUUU2UjLL
jkUUUUUF1k251kFFUS5FFXkPkXXqkNP5JujJYuYYLL77rrr7rr;7iiiYJUuUuUUUYJYYLJLjLJv
1FFU12S1F11U522u1252SFXSkkXPNNXjuuUJjJjLjLv77rr;r;r;;i7JjjjLJLYLYLJLYYjYUJY
1FF521U125U51S5XFPXPPqkPXqPG0Z1UYUjYvLLYvL7v77rrr7rri;71U1U1UF22U121U1U1U1j
2U1U2j1552F1S1F5k5XFXkPPEqE08FUJujuvYLYLYLL7777r7;r;rrj1S22UF2F1555U222UUjJ
U0N525UF1S1F1kFXFPkPSNPNNZqq5uYjYUJjYjYYLY7v7vrvr;rv7YYY7LvY7L7v7L7v7L7v7Lr
2XP1PSk5S1525FXkqkNXXFkkPkPPSJjYuJYLuLJLJLLvLLYvY7LrvLL777vLJLYLY7L7LLYvYL7
uqXFF1UUU1U12S5SFkFkXNqNXPPEqSU2U2jULjJYLYvLLYv7r7LUjUJYLJLLvL7L7YYJLjLJ7Lr
1kE2Su1U1251S1SFPk0GGPXFSXOPk25U1u1UUJYLY7LvLLYYuU5jjYJYJLJLJLLvjquvL7vvYYL
uqqFF5UF1SSXFkFXFPq8ZOZ80M0N25U1UUJUJYrv7v7LvJJ52UYjYuJuYYvLLY7JjXUF5F51LY7
2SE2X1F5XSX5XSPSqkqXNqNNMZqkF21U121uuJL7LLJYuU552JLvL7LLL7LLYLYLYvYYJLYLYLL
jk051F5F25255XSPkXkPSXX88GXSU515U522JujUYuYU1F5Z2JrLLYLYLYLYLYLLvJLYLYLjYjv
52X555XFS5S5S5F5SSXFXP8OMNNU52FU5152FuUjuj5F1YjFF1S5F151F112221U1251FUS5F55
55SXkqX0qPq0PPPN0Z0G0ZGMZNF12F212F2F21UUuFFPSUJPFPSPkXFk25UFFPSXFPFSSF1kFPF
Fk8FqSkSSSPkPkqXqqNq8ZMM0PFU522U51F15U5UFkUv2Ukqr.:i  ;..vY,rrrr7r:;iJJrrii
5PPk152F2FUS5FkPSXkZNGOZkXjUUUYjjUjUuUj12uLJj1FSi,:: :ri.Lv,,::, .:i.7i:,:.

---
, ,,:.,.,.::.,:.,.:::.:,:,;::::.:,:.:7r::XBBBBBMMZBBBBMMBMi.iirrrr7;rr7rrr;
.         .. ..  . ,......:. ...... .;::NBE1U25S2MBB8MEG8BM7.::::i:::i:i:i,
, ,,,.,,,.:,..:.,,::::i:i:r::,:,i::.:;vBBU:,,...YMBX0P0Z8MBB2:;ir;r;r;r;r;i
. .,...,.,.,.,:..,,:,:,:::::,::::::,,YBBJ:::....,58qG8ZMOBMBB;irir;ririrrri
, ............:.,.,,:,,,,,,,:::,i::.:BBBBJi;r:,..rMNMMBMM8MBBriiririr;r;r;i
, ............:..,.,.:.,.,,:::::i::.7BBNBU.JZBXr:rG00BMM0ZGBMi:;i;ir;;ir;ri
, ,.,.,...,...:.,.:,,,:,:,:,:::,r::,MBLi: .i5kBLir8XEMB880ZBMi:iriririr;rri
. .,.,,,,,::.,,,.::::i:i:ir:::::;:,iBEL:.,,,,:.,.r0GGBO888GBGr:;iriri;;riri
, .,:.,.,.::..:.,,:::::::,r:::::r:,rBS27r:i,,...:JMOMG8ZMMMMBr:i;;riririr;i
,..::.....::.,:,,::r::,:,:r:::::i::BBXuL:,,:,::rLGBMNEGMMM8MBN::irir;r;riri
:..:i,,.,.::,,:,:,:i::::::7:::i:;.UBBFL7L;i:i;771MBqE8MMB8MMBB1iiir;riririi
:..:i,,,,,:i,::::::r::::::7i:i:::7BBBNrii;rv7YLjqB80NMMMMMOMOB8Liiir;rir;ri
:.,:i,:,:,ii::i::::ri:::::7:i:::2BBBBB8u77YU1uLYBBG0MMBMMOM8MMMY7i;iriririi
:.,:i:,::,:;::i::::ri::i::riirrSGqOBMOBB8SF17iiXBBN8OBOMMMZ88BOSr;iririr;ri
:.::i,:,:,ii::i:::iri:ii::7iiirLqBBMBMEBB08P8OBBMMGZMMOZMO8qOMBZJriir;ririi
:.,ii:::,,:i,:i::::7:::i,:7;ii;FBB2LBBBBBBBBBBMBMMZMOB88MMZOZMBMu7iriririri
:.,:r::,:,ii::i:i::ri:ii::7iiii:r,.:EFj7LvUUkY:ZBBO0MMOEMOGG8ZMBMviirir;r;;
:,:ii::::::i,::i:::rii:i:irii;::::vYi:...,:iiU, XB88ZBGENZE8GGEMBZ:iirirr7i
i.::r::,:,ii::i:i:iri:ii::7ir:::UNP7i,,::::::rE:.kBOMMME8ZMEOZGOMMYi7rrrrr;
:,,i;:::,::;:::i:::7ii::.iY7::7qBB5J;i:::::i:i22vrMBBMZO8MZGZOGMGBjiirir;;:
i,:ir::::,ii::i:i:ir;::rLv7i:,ir58FL7;i:::::ii1v2iJ8MGGGMMGXGGOOMBU;L7jvLJJ
:,:i;:::::i;::ii:::r::LLi:.,.;L1E8UY7rii:i::::;YLv:kZOOBMBOOGMGMMMNUSSFUY1L
i.::r::::,ii::i:i:i;:7qiivuUMBZFZ05LLrriiii:::::rUiJMMBBBMBBBMMMB1Yiii;irii
:,,i;:::::ir::i::::r:LM7,::7BkLv5E5u7rrri;:7r:,:iUYr5BBBMBMBMMMBXrir;rr7r7i
i.::r::::,ii::i:::i;:Ej   .:1LrLN55uYrriiirFYi::7ji.:kBBBMBOBGNUiirr7r7r7rr
:,:ii::::::i:::i:::;:iqUY7;LuYikXUUULvi;iir5YY77i.rL7UNBBBBMBGY:irr7r7r7r7i
i,::r::::,ii::i:i:iri,;BBFr:;J1EXjUYY7ririirrii:,.i7r:FBBMM8BGuir;7r7r7r7r;
:,:iii:i:::;::ii:ii7ii:,vBY;iijM1UUY7Lr7iii;:::i::::,7UBBG8BBN;rr7r7r7rrr7;
i,::ii;i;:ii::;:i:i;7rri:kOLri;EPj5YL77rrirrriiii:::iUBBEqBBGrir777r7r7r77r
i::::::::::;:iiiii:i:i:i::OZLrijP2YJLLrrirrrii:i:i::iLLvivjJr;;rr7r7r7r7rv;
i,::::::::r:::i:i:i:i:ii;:rBGYiiXj7LYLLrr;7iiii:i:::rrii;ii:rrrr7r7r7r7r77r
:::i:::::i7riiii:iiiiiirii,rBOLijU7vLYLvr7r7;i:i:i:ir7r7rrr7r7r7r7r7r7r777i
i,i:i::::::ii:r:i:iiii;irii,rMBU51Y7LLYYY7iii:i:i:::777r777r7r7r777r7r7r77r
:,::::::,:::::i::i:i:ii;i;ii::kBGqUULYYuY7i::i:i:i,r77r7r7r7r7r7r7r7r7r7r7;
i,i:::::::i:::;:::i:i:iiriiii:,YBEkUjYUUuYviiiiii::rL7777r7r7r7r7r7r7r7r77r
i:iriiiL;irLr:77ir7J;rrLirr7ri::7Nk1uJr:.:::,::::i:i7vr7r7r7r7r7r7r7r7r7r7i
i,iii::UFj7r7,5S2JJLi:rY7r7Lr:i:ijY77i:.             rL777777777v7v7v7v7v77
i:r7rr;5GX7LY71M0kkU;77SJ7;5Yv777S;7ii:, .          .jLL7L7v7L7v7L7v7v777vr
J7YLYLJLuu2YYLYL2U2YjYuJU552ULJvJP7ri.,.          . ;Lvr7rv7Lr77777r77v7v77
J7777L77r7777v7777777v7L7v777v77LPri:,..           ,Lvr7r7r7r7r7;rr7r77L7vr
7i7rrrrrrr7r7r7r7r777r7r7r7r7r7i7SX2Fuu7rii::.... .r7rririiiiiri;iiiri;irii
L7LYvY7LLYLYvJLYLYLYYjJ2U21F1S1S1k5S12uJYUjJLjYjLjLLrv77r777r7rr;r;riii;ir:
0uUu1U1252UjUuUU2u1U2U55k5kFXSPSS51ujLLr7r7r7r7rrrYv7r7r7777LvLvLvL7L7L7L77
FNXqkNXPSS1F1SFF1k5k5SSPkqN0NZNEXSUuYY77r7r7rr;rrr:r5XFS5F251k5F2SSX1XSXFk5
k22jUu521U52522uUu2U51kkPkPXPkqkP52JUjYLL7L77r7rr;;i7777v7L7L7L7v7YvLvYLL77
k1JUj2UujUUUu1uUuUU2u2U55XkqXqXqFFjjYJ7L7777r7r7rrrii7r7r77v7v7v7v7v7LLvr77
k151F21U2j2U2j2U2211PSkkPkPkXFPSkUjYjLvvL7777r7rrr7i;LYLLvL7LLY7L7YLLvLLYvv
uF21UUu1UUjUYUU12kqGUUu11F5EqPkP21uUUuYjYY7vrrrrrrrriLLLvL7L7YvLvS0YvY7YLY7
UF2U1U115U1U55kFPkENZZGGOGO0qPESUJJLYvYvL777L77r7rr;rrL77r77YYUJJjFUUu2UULL
UkUUUUUF1F2F1S5FUk5FFXkqkXkPXNPSuUuUJYYL7v77rrr7rr;rir7JJUUUuUUUYYYJLJLjYjv
5FFU11k1F152521u12F2SFkSXSPXEk2uUuUUUJUYJLL7v777vr7;rr2uujuYYLYLYLJLYYuYUjY
2SFF152115UF1S1kFPPXXqXPkPqGP2JUJUuuLYLuYJLLv7rrrrrr;jU2j1U1u521U511U121U1J
5U1u1u1551S1S1S1k5XFPXqXEq00UYUjuJULYLYLJLL7L7777r77Y1F1FU2US1F2F1FU2U2UUJJ
U0qF2FUF2S1F1kFkSqXPS0Pqq0X0k2JjYuJUYuYJLYLLvL7LvL7vLjYY7LLY7L7L7L7v7L7L7Lr
5XX1qFS5k1F2F5XkqkqkPSXkqSNPk2FUUJJYuJuLYLYvLvL7L7LLYLL777LLJLYLY7L7LvYLLL7
U0PFF1U2U2U11k5kFkFkXPPNXqqkU11F55UUYjYYLYvLvLLL7vYUYuJYLJLLLL7vrYYjYJLJ7Lr
1kE2Su525UF1k1SSqkE8GXXFkq0152F2FU2uUYjLL7L77777Yj2YjYJYJLjLYLLvjqJvYvL7JYY
uqP5S52F5kSXFkFXFXqOGO8OEZkFU51F15UuYjYYLYYYYUjFUUYjYuJuLYLYLYvJjS2SFS55LL7
Uk0UX1F1XSkFXkXkqkqkPq0P8PFU1252F1F2ujujjJU2XXkP1jLvLvYLYvLLJYYvLvYYJLYLYLL
jXN51F5F25155kSPSXkXkP5E0X15252F2515uujUu1FPkUUN1j7YLYYJLJLYLYYYLJYYYYYjJjL
52X555kFS5S5k5F1S5PSXSNGEFFUF2F15551S25USkSLYYU5F1k5S1F55222125U52F5SUF5S15
51kXSqXNXNPqXqPNqGEG0Z8ZXSUFU5252F15152SPPUFSUuP5PSXSXFS25USFqFXSX5Sk55X5XF
SX85qSXFFFXSXXqkqPNXNGMEXF51F2F1F5S1F2Fk2LYL52kqr.:i  r..LJ,rrrrvr:i;uur7ii
FPPk152FUFUS1FFX5XSkkMEN55uUU2uUuUuUuU2J7YYuj55ki::i :7i,YL,:::: ,:i.Li:,:.

----
, .,:.....:,.,:.,,,::.,,:,r,:,:.:,:.:;:UBBUY12XN0BBBBMMMB7.:;i;irirrr;r;rri
.          .  .  . ,...,..:. ......  :2Bq;,,...:2BEqPE0ZMB7.,:::::::::::::,
. ..,.,.,.:,..:.,,::::i:::r,:,:,i,: .8BGi::.....vNNX0XZZOBBJ:i;iri;iriririi
. .,.,.,.....,,..,,:,:,:::::,::,::. UBBBZ;:vr:,..XEGOMOMMMBB:iiii;iri;iriri
, ............:.,.,.,,,,..,,:::,i,.iBBqM5.iXMNr::S8PBMM8OZBBr:;i;i;iri;irii
. ............,..,.,.,.,.,,::::,i:.MBL:.  ,YJBL,:NX0MBGZN8BB::iiiii;i;iri;:
, ........,...:.,.:,,,:,:,:,:::,i.iBPYi,,,,,:.. :NNZBM80NEBGi:;iiiii;i;ir;i
. .,.,.,,,::.,,..::::i:i:ir:,::::.LB1u;i::::...,JMGM8MEM8MBP:iiii;iri;i;ir:
, ..:...,.::..:.,.:::::::.r::::,::BB2Lv:,,:,::iLBB80GGOOMOB0::ii;i;i;iririi
,..,:.....,:.,:,,,:;::,:,:r::::,:kBBjLr7i:,ii;;kB8kZMOMMGOMBY::ii;i;iri;iri
: .,:...,.::,,:,:,:i:,:::,7::::.UBBB1:::i;7r77uMBX0GM8BOMZBMM7:i;i;iriririi
,..::,.,..::.:::,::r::::,:r::::5BBGMBZYvvuU1JUNB0E0MOMMM8M8MMFiiirir;ri;ir:
:..:i,:,,.i:::i::,:;i:::::7:;7qZGM8PBBBUU2Ui:7BMEEMMMGMOMGMMBk7iii;iri;irii
:..:i:,:,,:i,:i::::7i::i::7iivSBBBGEMBBk5FU1FBBMNOOBOMOMZM8MMX7r:ii;i;i;iri
:.,:i,:,:.ii::i::::ii:::::7:iY0GZ1MBBBBBBBBBBBBGGZMO88MZ8ZOOBNYr;iri;;;irii
,..:::,:,,:;,::::::r:::i,:7i::,,:.5MZqFSPqO7:GBMZMOMNMMGZMEMBMYriiiri;i;iri
:.,:;::,:.:i::i::::;i:i:::Lii::,rrL::..,,,rY  PBMZBZEEG8GGGZBBS;;iririr;ri;
:.,:i::::::i,::::::rii:i,:7iii,ikJi:.,,,,,.jY, qBMBZNZ0B08Z8MBGL:;iriririri
i.::;::,:,ii::i::::ii:i:::7ii:ik0v;::::::::iLr7,ZBME8EMO8GM8MMBjiirir;;ir;i
:,,ii:::,::i,::::::rii::.i7::7GBSJr;::::::::777v1B8MMBM8NG8MOMBJ:ii;i;:iii:
:,::r::::,ii::i::::ii::iLLr:rYUPNjL;i::::::,:r7PB800BBMqE0MGMOBPL7v7Y7Y7LYj
:,:ii::::::i:::::::r::7Jri,::rYBNUv7ii::::,:,,i1EFvUGBOOEG8MMBOMU2j5SF1UY2L
i.::r::::,ii::i::::iiLL:::iYk0qEZUYr;ii:::i:::irU2YUMBBMMOMOBBqLri;iii;irii
:,,ii::::::i,::::::irErivFPi;NL2NSjv;r:i::L;,:,iv::5:5BBBBOBBGriir;ririrrri
i.::r::::,ii::i:::::iOY   .:2Yr2q2ULvii:::YYri7i. Nr :BBBBBMGiiirr7rrrrr7rr
:.,:i::::::i,::::::iiB   :rkF7rqF1uJv7ii:::vi;:,.iL...SBBBBZi:irrrr7r7rrr7i
:.::i::,:,ii::i:i::i::2BB7iiYUjqSUUYLrrii::::.:.,,...:FBBBMEYir;7rrrrrrrrr;
:,,:i::::::i::ii:::ri:iqEGri:7UBX2uj77;r:i:;ii::,,.,.jUBBBG2;rrrrr;r;rrrr7i
:,::i:iii::i::i:i:iir;i::ZG7r::kOU2jL7rii:ii;:::,.,..UBBBMLir;rrrr7rrr7r77r
:,::::,:,::i:ii::i::::::,:ZMYriiXPJY7vrriiii::::::,,.rv5Ur:rr7rrr7r7r7r7r7i
i,:::::,::;:::i:::::i:i:i,:EBU7:rFYrv7v7ri;i;i:::::.:ri::irrrrrr7r7;7r7r7rr
:,:::::::i7i:iii:i:i:iii:i::SBqY:jU7r777;r;iii::::,,,7rrirr7rrrrr7r7r7;7r7i
i.::::::::::i:i:::i:i:iiiii:,7BB1YPY7r777Li,:::::::.i77r7r7r7rrr7rrr7r7r7rr
:,::::::::,:::i::::::::i:i:i:,:FBMqFJL777L;::::i::,.:vr7r7r7r7rrrrr7rrrrr7i
i.::::::::::::i:::i:::ii;:i:i::,7S8k5LLvYLL;i:i:::::i7vr7r7r7r7r7r7rrrrr7rr
:::;:iiLiirLr:77:r7Yi;rLirr7;i:i:.U0F1Yvrrr7rrr7rrii:;i7;r;rr7;rrrrrrr;rrri
i,iii::u5Jrrr,5S2YYL::;Y7r7vr::i;.YJvri:.             :Lvr7777777777v77777r
::r7rri1ZS7LY72MNSkUi77SY7;1Yv7v7i2Lii::,.            vY7v777v7L7vr777r777r
YrL7LLYLuuUYYvYL2uULYYuYU15UuLJvLrGL7;:,:.           :J77r7r7r7r7r7r7r777r7
Yrr7r7r7r7r7r777r7r77v777777r777rrk7i:...            L77r7r7rr;r;rrrr7rv77r
7i7rr;rirrrrrr7;7r7r7r7rrrrrrrr;riU5jri:,..         irririiiii;iiiii;iiirii
v7LYvL7L7LvLvY7L7vvLvYYUjUu1U52S5UUqkPFSuYvL;7;;;rrL7777;r77;rrriri;iiiiii:
0uuj2U1U1uUjUjUuuYUjuj2U5252SFXFF2S21UUjULYLYLYLYLLvYr7r7777L7L7L7L777v7L77
FqPPkPkPkF25251F1F2k1F5kFPPNNEqEXS15UuLY77r7r7r7rri;iukk5F251k252S5X1kSXSX2
k12juU2u5U2U5UUJUJUJUU55SFkSXSXSq1SUUYY77rrr7r7rrrriri77Lr77v777L7YvL7LvL77
55JuJ2UjjUjUu2JuJujUJuu22SXPkPSPSPSFUUjULLvL77r7rrr7;ii7r77v777v77r77L7vrvr
S552FU1uUuUuUJUuUUUUXFSFXkPFS5kSkSSUjYjL777rrr7r7r7rri7vY7L7LLY777LvL7LvYv7
U5u1UUj2uuJuJuUUukXEjjJ2U21NPXkXSS11YJYL7v7777r7rrrrrrrL7L7v7L7L7F0Y7Y7LLY7
U5UU1U211u2U51S5SFNNN0EGOEZqqXNXk2122uUYJLY7vrr;7;r;rir77r77YLUYJjSUUjUUuvL
ukUUuUu52S1FU5U2U5152S5XSXkPSPSk25UUYYYYLYvY7v7L77r7r;;jYUuuuUuULYLYvYLuYJ7
FFF211S2522U1UUjUU5U51SFSFXkqXXUUUUjUJuvL7Lr7r7r7rrrri7jjjJLLvLLYLYLYLJLUjY
2F5525U125u1252k5XkXPPSPkXPEPE12jUjUjUjujuLYvL77777vrrJ5u2u2u522u121u2U2uUJ
5U1u2j111U52F2F2S1k1kFXX0XNqZqjYujuYUYYLjYLLYvL7vrrrvvF2FU2U5U5U515UUU2UuJY
j0q125U51F2F2F5kFXXPSNPNqEqNqEJYJUJuJJLYLYLL7v7v77r7vJYL7vvL7v7v7v777L777vr
2PP1PFS5S25U22SFXSPkXFkFPSNkqS1uUJjYUYJLYvY777L7v7YLLLL777LLYvYLL7L7LvLvLv7
UqXF51uUuUU22F1F1FFkXqPqXq5kS5U2U2uULjYJLYLL7L7LLJLJYjYYLYLLvL7v7LLJLYLY7vr
1X02Fj1U1U12S151PkNZEPk5kFPkXU2U1j2UUYjLYLY7v77LJjjLJLYLYLYLYvLvjqJ7L7v7YLL
UqX151U52F5k5k5k5XP8GOGOGG0P11U2U2jUjuYYLvvL7YY2JULJYjYjLYvLvL7YJkUF5F12LL7
US0Uk252kFS1kFkSqSPkqNEq0NNS1U2U2U1UuJuJJYjj15XX1Yv7L7YLL7LvYLYvL7YLYLY7LLv
jkN12115U1U11FFS5kSkSPkXkEk5U1U5U1U2juYUjUUFS1Uq2Y7LLYLYvYLYLLLLvJLYLYLjYJ7
52P152S5F1F2F25U11kSPkqXENXU1U5U52125U2U11PUjYj1FUF1F2F1521UU21U1UF25UF5515
15SSSPPqXqkPkqXqqE0GEGG8EN51U1U2UF151F25FPF5FjYP1XFXkkFSU1UF5XFk5S5FS51X1kF
FkZ1PSS5FFkkXSPkqXqPEqNEZSFU5U1U2251FU55PYvL2UkP;.:i  i..vY.rrrr7r:iiJJrrii
FXXk25U5U1UF255X5SFXkqPEkFUUuUjJYJJUuUU57vLJY25Si,:: :7i.L7:,::, .,i.vi:,:.

---
: .,:.....::.,:,:,,::.,.:.r::,,.:.  BB5;rii::78B0PEqZNMBY.iiri;irrrirrr;r;i
.   .  .   .  .   .:......:. .  .  1BS:,.. . .vOSEE8ZZZBM:.::::::::::::::i,
, ....,.,.::.,:.,,::::i::,r::,:.: 5BBMSirL7::.:O8EBMMOMMBk:i;i;iririri;irii
...,...,.,.,.,:,.:,:::,:::::::,..iBBNBu.rEM8ii,ZEN8MOMOMBq,ii;i;iririririri
, ,...........:.,.,,,,,,,,:::::.,SBYi.  :LUM7.:kEkOOMZ8GBu:iriiiiiii;i;i;ii
. ...........,:,.,.:,:,,.:,:::,.:B8Ji:,,.,.....q00OMGZ0MBj,iiiiiiii;iiirir:
, ,...........:.,.:,:,:,:,:::::.:BGuv:i::,....7MMZOEZqOMB7:iiiii;iii;i;irii
. .,.,,,.,::.,:,.::i:i:iiir:::,.LBXUri.,,:,::i1B88qNEOZMM7:ii;i;i;iii;i;ir:
, ..:.,...::..:,,,:::::::,7:::,.BBPL7rr:::::irqB0PXEGG8OBj::iiiiii;i;iririi
,..::.....::.,::,::i::::,:;::,.XBBNr:::;ir;772ZBSXXGNZZMMNr:iiiiiiiriri;ir:
:..,:.,.,.::,:i,:,:;i::::,7:,,1BB8BZUr7vUu2JLuBOqX0000OGMZLiii;iii;iriririi
,..:i:.:,,:i,::::::r:::i,:ri70MMOZZBB8U2UL:::OB0q0qG0GZEEO7r:iiiiri;iri;iii
:..:i,:,:.ii::i::::ii:::::vrYXMBBX0BBN22uLJ5BBOXEqENZEONG0viiiri;i;i;i;;rii
:..:i:,:,,:i,::::::r:::i::rrUBBBN8OBBBBBBBMBBBPkqNX0EE8GGOYr:iiri;i;i;iriri
:.,:i,:,:.ii::i::::ii:i:::7:i::.r0BBBBBMBBBuFBBPZqP0GPOEGMUrii;i;i;i;i;irii
:..:i:::,,:;:::::::rii:i::ri::,.:LNPLr::iiLY iMOZOEEEqZOZMUr:ii;iiiririri;i
:.,:i,:,:,ii::i::::;i:ii::7:i::,JU7::...:,:7L .PMOBEZP8GMMU:iiriri;irir;rr;
:.,:i::::::i,:i::::riiii,i7::::jBqL;::,::::iJ7 iMMBMEZEO8MY::;iii;iririrrri
:.::r::::,ii::i:i:i;;:i::::irjkY2Xj7r:::::::rL: kOBBOEM8OZY:ri;iririririr;i
:,,ii:::,::i:::::::ri::vr:7qS82rq0jYr;:::::::77 LBBBZOMMEMUi:i:i:iiii;i;i;:
:.::r::,:,ii::i::::ii:;Ur:rri:rUOX5Yvii:::::i:r:7BBZ8OMEOBNuSu1UYvv7L7Y7vLY
:,,i;::::::i,:i::::r::jJi:..iJL:FNFUL7i::::i:i:i,MMOZMGZZkr7rNBSJ5J5SFUUY2L
i.::r::::,ii::i::::i:Y2:,.,7U77iLGSUY7r::,::i:ii:GBOMBBEFiiiiur:i:;iiiii;ii
:,,:i:::::ii:::::::i:kY:,7P1rrii7qUuYYri::::i7r,:UqBBBBMYiir;iirir;iirir;ri
i.::i::::,ii::i:::ii:1qLi.,r7;rivXULYL7ii:::ri. :vXBO8BB2;r;rrrrrrr;r;rrrrr
:,::i:,:,::i,::::i:;:rBB   ,77rrrPUYvLrrii:ii,.:.:NMZMBOJr;r;r;r;r;rrrrrrri
i.::i::,:,ii::i:i:ii::BB1JU;:iLv7PkYYv7r;:i:;:...:GMBMGvrirrr;rr7;rr7r7rrrr
:,,:ii:::::r:i:::::ri::MBBM2r::7YZM2YJ77ii:ii:...JBBONriirrr;r;r;rrrrrrrr7i
i.::iiiii:i;::i:i:iir;i:LXMGS7i:i7NNSYL;r:i:r:..:rY7iiiirrrrrr7rrrrr7rrr7rr
:,::::,:,::i:iii:i:i:i::,ijMMEur:::ruS7rii:iri..:L;ii7rrrrr7;7r7rrr7rrr7r7;
i.i:::::::;:::i:i:iii:iii,:i0MO5jri:,75riiii7i..7Lrir77r7;7r7rrrrrrr7r7r7rr
:,:::::::ir;:iii:i:i:iiiii:::NGMPkuYi:Ujiii;7:.:7Urrrvrrr7;rrrr7r7;7rrr7r7i
i,i:::::::iii:i:i:iiiiiiiiii:rSXGENk5YjULrrrL,::U2Lr7rr;r;7r7rrr7r7r7r7rrrr
::::::::::::::i::::iii:iii:i::jujX0ZP5jUYrrL;:,,rGUJrr;rr7rrrrr7r7rrr7rrr7i
i,::::::::i:::r:::i:i:ii;ii:::uYYLu1ZNFLLvUY7i:  ;v;r;7r7rrr7rrr7r7rrr7rrr;
:,:iii;Lrii7;:77:r7LiirLirr7:7B0UUYJJSPP2j:      :7r;rrr;rrrrrr7rrr7rrrr;ri
i,ii::ij5j7;r,55Ujjv::;Y7r77i7Zuj77ii,,,,        :Y77r7r7r777r7r7r7rv77r7rr
ii7vrrr2Zk7LYL1ONFFU;rrSYriU7vv::::::,.,..   .   :YLvv7777r777777777r77777r
J7L7YLYLjU2YjYJL2UUYYYJJUU1UJL17r;;ii::,,        i7;777r7r7r7r7r777r7rvvL77
Yr77rL77r7r777r7r7rv777v7L77r7YXirii:i.,.      .i7;iirrrrrr7rrrrrrr7r7r7r7;
7i7r7rr;rrrir;r;7r7r7r7r7rrrrrrjLii::,. .  .,:77vrririr;;iiiiiiiiiiiii;i;ii
L7LYLL7L7L7LvL7L7LLLvLLjJUu1U5USXSuUYYrv7LLJYY77;ri;i;irr7rr;r;r;r;;iiiiir:
Puuj1U125uUJUjUjjYujUjUUUU1255k1FkXSXXXJYLLr7rr;ririiirirvL7v777v777v7vvL77
FPkPkqSXSS2521252F2F152S1kXqPNPNPX11U5j777rrrrir;r;ri;i;:jFF1S551F5S1SFk1S1
F2UjUU1u1uUu2uujujuJUj12S1FFXkPkPFX11Uj77r7r7rrrr;riririiiv7v7v7v7L7v7L7L7r
F2YUuUUUJUJUjUYjJjJuYJYuUF5kkPkkSk1SU2uj7v7777r7;r;rrririirv7vr77vr7rL77r7r
F11U5U1uUJUjUJUjUuUUF252PkS152F5k5k5Fu5UJ7L77r7r7rr;ririri7vLLL77rL7L7YLY77
uFU1UUjUuujjJUJUu250YYJuuuUPkSSX5k5k22U1LLLL77r7rrr7rr;riirL7LvL7FNYvLvYvL7
U5Uu1U1U2UUU515U51XPNq0N8NZqPXqXNXX1F5522YLLY7L77r7r7rr;rir7LLuYJY5UUuUUuvL
uSUUuUU1U51SU5UUj2U2UF2F1X5XFXFXSk5S1XU2UU7v77r7r7rrr7rrirYUjujuLYLYLJLYLJ7
5FSU12F152Uu2ujJuuUU1U12F1kFkkPSXSS15U2U2JJvYLL7L7L77r77rvuLYvYLLLYLYLJLjYL
UF55U122U5u125251SFk5kFSSXk0PqkqSX15UUu125UJLJLYvL7v7L7L7jUUu1U2U2UUj2u2uUJ
UUFjUj1U1U125U121152S1SFqXNN0q0q0k2u2uUYJLYvYvL7L7L7L7YvYU1UF15U2U5UUU1uujj
U0q2U5U55FU12F2F2kFS5XkqP0PNPNXqkkY2U5UjYUvYvL7LvL7LvLvYvvvL7L7v7v7v7v7v7Lr
2kX2XFFF5U1UUUS1S5XS5251XFqXPXXSNk2jUYJYLYYLJLLvL7L7LLY777LvY7YLY7L7v7Y7Y77
UPXF11uuuUUUU1U1U52SFXkPPqkX5PFXPkUjYjYjYJLYLYvLvL7YJuYYLYvYvL777LYJvYLYvLr
2XN25j2UUU2U5U2U55PNEkF1k5SkEPPqqFUjuYYLjYYLL777L7u2ULYLYLJLY7L7jPY7L7vvJLL
jPP111U1U51S2F15UkkZ0OEM8MZGqqPEF5JUuUYYvYLY7LvYL11JLJYjLYLLvL7YYSU55F21LL7
U5NUk15UF1F2F2S5S5kkPPNPZ0EXqqNSkuUUUjUuuJJYYLjj52v7L7L7L7L7YLL7L7YLYLL7LLv
jkN1U521UUUU2F1F21UF2SFqXqkPk0PSUUu2uUjUjUjUJju55YrLvLLYvYLYLLvLLYLYLYLYYJ7
2UX212521U2U2UUU2U1USFXkqXqP0qS5Uj2U2jUjuJujUu52F2F21U52FU2UUU1U2U52Fu12F21
51FkSkSNkXFPSPSXXNPE0Z0GZ8EZNNF5j2uUjUjUuUuU2kUX5SSkSX5FU22F5kFk5S1S512kFkS
2kZ5kSS5k5kFS1kFXFkSXkNP0N000SS22jUuUjUjUu25k2Sqr.:i  ;..vY,r;rr7r:iiYJrri:
1kkk22U2uUu522UF252F2SSNPqqZk5UjYjYjLJYjYU22LU2Fi,:: :ri.vv,,::, .:i.7i:,:.

---
, ..:.,...::..:,:,,i:.:.:.r,:,,.: :BBjr;r:::PBOPZZMZM8BZ,i;iri;irrr;r;r;rri
.  .   .  ..  .   .,......:...    ZBv:,,    ,qNqEO8OGMMB:,:::::::::::::i:i,
, ..,.,,,.::.,:.,,::::i:::7::,:..PBB0Li7jr:..7M0MMBOMMBBY:ii;iiiriririririi
...,.....,.,.,:..:::,:,:::::,:,.:BBOBU.j8BGr,iEEqBOMOMOBv:i;iii;iii;iriri;i
, ,...........:.,.,,:,,,:.,:::, uBELi  :juOi.:Xq0OB8E0BBJ,ii;iiiiiii;iri;ii
. ...........,:,.,.:,:,,.,,:::,.kBU: ..,,. . ,18qMMGPGMBv::iiiiiiii;iiirir:
, ,...........:.,.:,:,:,:,:::::.qBSYi:i:,....rGBZGZNG0MMJ,iiiiiiriiiriiirii
. .,.,,,.,::.,:,,::::i:iiir:::,.PBFui:,:.::::YNBNEPZEO8BS::;i;iri;iii;i;iri
, ..:.,., ::..:.:,:::::::,r:::,:BB1LL7;:::::iu0BNXPZE0GMO7::iiiiiiii;iririi
, .::..,..::.,::,::;::::,:r:::.2BBSr:::iir;LY1MBkqPGNZ0MOUi:iriiiii;i;irir:
: .,:.,.,.::,,i,:,:ri,::::7::.;BBBBU7ir7u22J7uBM0q00ZEO0MUr:ii;iiiririririi
,..:::.,,,:i,::::::r:::i::r::LBBOZBBBB551j::7PYEEE0EZGGEGkriiiiii;iriri;ir:
:..:i,,,:.i:,:i::::ri:::::viLqZOMPGBBBkSurv2BrYNZ0EqE0OEONviiiri;iriri;irii
:..:i,,:,,:i,::::::7:::i::7;70BBMZZBBBMMqBB0M5:JkZNN0GEOZOL;iii;iri;iri;iri
:.,:i,:,:.ii::i::::ri:i:::7iLJU7LqOBBBBBBBBBBBMM8X80ZENZO8U:iiriri;iriririi
:..:i:,:,,:i:::::::rii:i,:7i::...YEBBB5J7rv25jJBB08OZ8kGMMJii;i;i;irir;rir:
:.::i,:,:,ii::i::::r;:ii::7ii:::PBBE5r:::.,:;L:,BB8MBZPNBMY:iiririririr;rr;
:.,:i:::,,:;,:ii:::riiii,:7::::EMjrJYr::.,,::;2 :BEBBBNOM8Li:;i;i;i;irirrri
i.::r::::,ii::i:i:ir;:i:,ii:JkBU::uP177i:::,:iYi MGMBM8MBNUi;i;i;i;irir;rr;
:,,i;:::,,:;:::::::rii::rL.rMBP:,Y1P1urri:::,irj q8BOMOMMBLi:i:i:ii;iririr:
i.::r::,:,ii::i::::;i::iN7i:i..:FFU2FULrr::,::rL.qBMMMBZ8X2uSU5UJLL7L7JvvYY
:,,:;:::::i;,:i::::7ii,vUr::..riv1U511Yvii::::i7 0BBMBMGjii770BFJ1J1FF1UY2L
:.::r::::,ii::i:i:i;i::UYi:,:r7iii2kUuUvri::::;r.BBBBBMFr:iir27:i:riiiiirii
:,,:i::::,:;,::::::ri:vGYi.:UJiii:70JJLvrr::::ir:BBMOBB2rririiir;r;r;rir;ri
:.::;::::,ii::i:i::iiiSqkY7,.i7ii:7q2v777ii:::;,.kB88MBJr;rrr;rrrrr;r;rrrr;
:,::i::::,:i:::i:::r:r1PGBN.  :7;i;N5Yr7rr:i::i:.8BMMB1;irrr;r;rrr;7;rrrrri
i.::;::::,ii::i:i:i;i:JU8BB5u;::rLL5EJvrvii:i:i:UBBBGF;:rrrrr;rr7;rrrr7rrrr
:,,:ii:i:::;:ii:::ir;i:UuNBBBE7:,iYSBXLYr7ii:::iXZSv::r;rrrr;r;r;7rrr7r7r7i
i.::i:iii:i;::;:i:i;r;;iLYLUGEPJ;,:iPMPu7rr:i:iLk7i::iYr7r7;7r7rrrrr7r7r7rr
i,::::,::::i:iii:i:iii::,LujU8ZNUL::,;jqYrii:i:FSv;iirLrrrr7;7;7r7r7rrrrr7;
i.::::::::r:::;ii:i:;iiii:2ujUZG8kjri:::17;ii:iLkLr::;Lr7;7r7r7r7rrr7r7r7rr
:::i:::::ir;:iii:iiii;iii:75YLYPZOXkJvi,:X7iii;JJL7;:7r7r7r7rrr7r7r7r7r7r7i
i,i:::::::iii:;:i:iiii;i;:i5ULvv1EOEPS1YrUYrr;LX05Yv7rrr7r7r7r7r7r7r7r7r7rr
::::::::::::::i::i:ii;iiii:j2jvL7Y2Z8Gkk25jLvY7r752J7rr7r7rrrrr7r7r7r7r7r7i
i,::::::::i:::r:iii:iiii;i::FUUYuYYJXqOZSYLLui:7ri;i7r7r7rrr7r7r7r7rrr7r7r;
::iiiiiY7i7Lr:vvirvYi;rLi;rG0kJLr;::,,:YqE1U:  Yr7;r;rrrr7r7r7r7rrr7r7r7r7i
i,r;::iU1uvrr,SFUuJL::;YriuUrii::,,,,.. ,::    7777r7r7r7r777r777rvr777r77r
iirLr7;1EkvLYLFOESFU;rrkYr;2iriii:,:::..      ,7;LLLvL7v7v7L77777777rv777vr
J7L7YYjLjU2YJJJY1u1YJJjj2UUF1iri;::,:..    .:i7;rirr777r7r7r777r7r7777L7L77
Y77v7v77r7r77v7vr7rv7v7v7v77kYii::.....::rr777rriiii:rrr;rrrrrrrrrr7r7r777r
vi7r7rrrrr7rrr7r7r7r7r7r7r7r7jYrvr7LLYUJjLLrr;ririri;iririiiiiiiiiiiiiii;ii
L7vYLY7LvLvLLYLYLYLYLJJUU1u5Uk0NXXFFjJLvr7rriririri;i;irr7r7rririri;iii;ir:
0uuj525U5UUjUj1UUYUuUu1211F1SFkXSUUJvr77rrr;riririri;irirvY7L77vLvL7Lr7LL77
FqXNkPkPSk2515U51F25151kFPPNPNNNS5jULv7v77rrrririr;ririi:jFS5kFF1S5k5XSX5k1
S1UjUU5U1UUU1UujUjUjUu12S5kSPkPkqS1YuvLr7r7r7;r;ririri;iiiv7v7v7v7L7L7L7L77
S5YUuUuUJUJUjUjujUjUYJJuUSFXXqkXSP1JjuLL77r7r7r7;rir;ririr7L7v777Lr77L77r7r
F112FU1u2jUjUjUjUUUUk151PSS1F5S5kSPUUjJLYvL7777rrrririri;iYvLLL7v7LvLvYLY77
uFU5U2j2uujuJUJUU1SEJJYUuUUqXkkXFXkkUUjJYYv777rrrrrrir;rir7L7Lvv7FNL7LvY7L7
U52u2U1U2u2U515USFPqNqEEG0ZNNXqPNXqS5jUYL7v777777r7rrrri;r77LYuYjJ5U2uUUuvL
uSUUUUU5UF5k25UUj2U1US1F5XSXkPSPSkSSjuJULJLJLY7L77r7rrir7vJUjUuUYYYYLYLJYJ7
FSSU12S2522U2uuJuu2U5U51S5XFXXPkPkN2jJujUYJLYLL7Lr7;ri7v77uLYLYLLLYYYLYYuYY
2SFF2522UFu12F2S1kSkFkFkSPXEPNkPkXSUYUjULLvYvYvL7v7LLYv772U1U522U522U1U1U1J
2UFuUj521U525U1155F2k1SSNX0N0NENE52juJuJJLYLYvY7L7v7L77YF22UF15252522U5uUjJ
UE052FU55SU52F2F2kFS5kXNPEq0PEPNX5YjJUYjYYLYLLvLvLvL7YYYLLvLvL7v7L7v7L7v7Lr
1XN2PSSFFU1UUUS1SFXkF2F1PSqXqXXk0kUJUJuJJLJLYLL7v77rUUY777LLYvYLY7L7L7YvY77
UqPFF5UUU2U2U1U1U5USFXSPPNkPSX5qqXU1UUuUJULL7v77r7LUujLYLYvYLL777LYjLJLY7Lr
1k055j122U125U1255PqNkF1X5kkEPq0qS1UUjuJJYY77r77YY5UjLLvYLJYY7LvuPY7L777jLL
UPq555U1U51S2F152SSEEOZOOMZGNqNEX5U1UUjUJUYYLLLUjSUYLjYuYYLL7Y7JJSU55S11LL7
US02k252S1F1F2S5S5kFXPNXE00q0XESXU1U5UUjUjuYJYuuFu77L7L7L7L7YLY7LvYLYLLvLLL
jXN5UF2FUUUU2F1F112FUS5XkqkPkE0PU1U1UUU2jUJUJuuSSYrLvYLYvYLYLYLYLYLYLJLJLj7
1UP15255121U2UUU2U2UF1kSXk0Xq0NS1U1U2u2uUjUjUuF5F2F152F1525U2U1U22F1FU52F15
11SXkXk0PqFXXq5XXqPE0ZNZ0GZ8GZXSU5U2uUu2U2U2UFSq1SkXkk5SU12SFXSk5k1kF52kFXF
5kZFXSS5k1kSk5kSXFkFXSqPNq0PZZq12U1UUjUjUu2US2kPr.:i  i..vY,r;rr7r:iiYjrri:
FkXX11U2u2uFU2UFU5UF2k1NXqP0NE5FJUJuYJLjYUj1JU15i::: :ri.vv,,::, .:i.7i:,:.

---
, ,.:.....::..:,:.:i:.:.:.r::,,. 7B8Lrri::1BBX0qO8MOMBM,ii;iririririririr;i
.          .  .    ,..... :. .   BB7::..   LGNqGOMZMOBM..:::::::,:::::::::,
. ....,.,.:,..:.,.::::::::r::,. kBMv;iv7r:..XOZMBMMMMBB::i;iriii;i;iririr;i
. .....,......,..,,:,:,:,:::,:.,BBMBY:2MO0i,78SMMBMOGBBr:iiiiii;iii;iri;i;:
, ............:.,.,,,.,.,.,,:,.iBBqS,.ij50i.iP0GBM8q8BBr:iii;iii;i;iii;irii
. ............:..,.,.,.,.:,::: vBG;  ,.:....:ZGMO8NZEMMu,iiiiiiiiii;iii;i;:
, ............:.,.:,:,:,:,:,:,.7B0jii:i,:.,.rMBZE08E8GBE::iiiii:iiiiii;irii
. .,...,.,::.,:,.::::::iiir:::.:BM2v:,,,,:,:rGB0kZGZZ8MBYi:iiii;iii;i;irir:
, ..:.,...::..:.,.:::::::,7:::,:BBFL7ri:::::7qBkqN80GZMMq;::iiiiiiii;iii;ii
,..::.....,:.,,,,,:;::,:,:r:::.1BBFLii:iiirJjZBqqEEG0ONME7:ii;i;iii;iri;i;:
, .,i.,...::..:,:,:;i,::::7::.:BBBBYi,:ijU1YrPBNEEG88O80OY;:iiiiii;iiiriiii
,..::,.,..:i.::::::r::::,:r:::2BMMBBBBS1U5r:i1OZNG08EOZZMk7i:iiiiiiii;i;ir:
: .:i,,,,.:i::i::::ri:::::7:i2BMMNOBBBMSXvi7BukqGEGEM0OGMqL:iiiiii;iii;irii
,..:::.:,,:i.::::::r:::i,:7r7F0BBNEBBBOBku0BEGGMk8NEZ0ZMGOv::ii;i;iii;iri;i
:.,:i,,.:.ii::i::,:ri:::::7:7XBBNGqMBBMBBBBBBBBBONMG80N8MGJ:ii;iiiri;iririi
:..:i:,,,,:i,::::::ri::i,:riii:.:25BBBBBMMq2NOX0BGMB8GS8MML:iiiii;i;i;i;i;:
:.,:i,:,,.:i::i::,:;i:ii::7:::,.vkBBBEU7iir::;2L1BGMBG0GB0jiiiriii;iiii;;ii
:.,:i:,:,,:i,::::::rii:i,:ri::,iBBZULrjYii,,.,iYiSMBBB0BMGuriiiri;iiiri;rri
:.::r::,:,ii::i::::;iiii,:L:;UkM8:irv1PLr::,:.:iv ZMBGMMMBuiiiiiiiii;i;irri
:,,ii:,:,::;,::i:::rii::,Y;,v2M1.,7vr5X27i::::,iL.FBMBM8Zkii:i:i:iiri;i;i;:
:.,:;::,:,ii::i:::iii::iqS;::;r.:YYiiLUjjrr::,::viBBBBBGkUUUSU5uYL77YvY77YY
:.,:i:,:,,:i:::::::ri::kOFii::.,i7LLiYYuYvii::,::;BBBBBEvii770BSYFj5kF2uY1v
:.::;::::,ii::i:::i;i:7S8Ui::,,ii::Y15uYuv7ii::::FBBMBBkLi;i;ur:ii;iiiiiiii
:.,:i:::,,:i:::::::;:LvJEk;i,,rr::,i50vLLYrr::::iBBBZMBNrririiiriri;rrirrri
:.::i::,:,:i:,i::::i:jY7kqui:.i7v:::JqY7L77ii::::MBMMMMLi;r;r;rirrr;rirrr;r
:,,:i:,:,::i::ii:::r:LUYjNXSUJ  ,7ii78uLrr;iii:::BBBBM1iiririr;r;r;r;7rr;7i
:.::i::::.i:::i:i:i;i:UuJ28BBOi..:777kNL7;rii:i:r8BEYii;rir;7rr;ri7rrr7rrr;
:,,ii::i:,:;::i::ii7;ii1uJUYBBXq7::rJXM177rr:i::r17i::ivi7;r;rr7r7r7r7r7;7i
:.::iiiii::i::;:i:iiriri5YJ7JkZS57:.:YBOUL7r;ii:rULir:r7rrrrrrrrrr7rrrrr7rr
:,::,:::,::i:iii:i:i:i::L1uJ7Y0ZXFYr,,iFkFvrii::rFvr::i7rrrrrrrrrrr7rrrrr7i
:.::::::::r:::;:i:ii;ii:r2uYY7jqONXUv::,ijSri:i:72Li:,r7rr7rrr7rrrrrrr7r7rr
:,:::::::ir;:iii:iiiiiii:2jLr7rJPOEN1jri,,7SiiirLULLi:77rrrrrrr7r7rrr7r7r7i
i,i:::::::i:i:;:i:iiii;i:Y5LLLY7jkMGEkkjYi:ULir;ukPSULvrrr7r7rrrrr7r7r7r7rr
::::::::::::::i::::iiiii:rk2JjuuYu20GMNPSFYuJLrLi;7JL7irrrr7r7;7r7rrrrr7r7i
i,i:::::::i:::r::ii:iiii:iN5J7ri:::,;J8801ULY77v7;ri;i7rrrrrrr7rrrr;rr7r7rr
::i;ii;LrirLr:v7ir7Yirrv7j7i::,,.:,:.,:vSO5J7777r7rrrr;rrrrr;rrr;rrr;rirrri
i,iii:iu5u7r7:FS2uJL::;LYYiii:i,:::,:..  ,LjLrr77r7r7r77777r7r7rvr7r7777vrr
ii7vr7r2EX7YJL1M0SS2r77SLU77rii:,,..     ,:7i;77vYLL7L7Y7v777L7v777vr77777r
j7YvYYjLuU1JuJJLUU2YJYuJUFNrr::.....,:7L2uuLL;ri;;rr777r7r777r7777v777v7v7r
Y7r77v77r77v7L77777v7v7L77j2r7r77vLujUUUjjLLr;iriii;irrr;rr7;r;rirrrr7r777r
Li7rrrrirrrrrrrr7r7r7r7r7rrLXSXXFJjLvr7r7rri;iriri;i;;r;;ii:iiiiii;iiiiiiii
L7LJLY7Lvv7LvYLYLLLYYjJU25U1kPU1Uvr77ririririr;;iririii7rrrr;r;riririiiii;:
0UUU12FUFUUjUu2uUJUuUu55F5XFS15jUY7r7r7r7r7;r;ririii;i;;L7LvL7L7L7L7L7LvL7v
5qqPkqkqXk5F1F1F5X1F1F1kS0N0NZX2UUvL7v77rrr7ir;rir;ririiYX1k1k552kFSFXkX5k1
F1UuUu1u2u2U2UUJUjUJUu11kFXkPPE122u7Y7L7rr7r7rr;riri;iri;77r77L7LvLvL7L7L77
F1Y2uUuuJ2jUu2jUuUjuJjjU2kSqkNkqU2UUvLLYvL77rr;rrririri;i77777r77vrv7L77r7r
F251F21u2uUuUjUuUuUUk5S5PkX5F5XXXU1UuLL7Lr7r7r7r7i;iririrvY7LLL7v7v7L7LvL77
UkU5UUu2juJuYujUuFkEJjj2UU2NXqXPkFu1uv7Y7L7777r7;ri;;ri;;L7L7Y7L75EY7L7YvL7
U5Uu1U1U1U2U5152kFPqNqE08NZ0NkNqqUUu5JJYYLYvL77r7rrrriri7777LLjYJJSUUjUUUvL
uSUUuUU5UF1SU5U2J221U52k5XSqkqkqk5U2U2LYvYLL7vr777;ririiYUjUjUuuLYYYLYLJYY7
1SFU22F2122u1uuJUuUU2U52F5XSqXXXPUUuUuL7YLL7L777777iri;7JYjYYLLLLLYLYLYYjYY
2FS525U1U5U1UF1F5kSXSkSPkXk0qNPNS2uUU2YYLYvLLLr7rvr7rLjFU1UUU2U1U122u2U1j1J
UUFu2u1152F25U525152S5kkNP0NENEq2u2u2uUvLvJLL7L7vrv7jUFU1UUu511212522U2UUjJ
uZq1U5251FU2UF1F1S5S5kkqXNP0PEqE5UjUUuYLvJLYvL77rLL2uYLL7L7L7L7v7v777v777Lr
2PP2PSkF521uUUS1S5XF5U55kFqPNXqNZ152UU2jjYLr7;rr7v2ULvvr7rLvL7YLL7L7L7Y7L7r
Uqq555uUUUU1u2U225U5FkSPPNXPSXF8XF15U2j1LL7L7v7LLU1YvjLLLYLYvL777LYJLYvY7v;
1k0U5j2UUU1U1U22F2Xq0k52S1SkEXEEq55212UjUYYLLvLL25JvYLLLJLJLY7L7JqY7L7v7JYL
jXP55525252F2F15UFkE08NOGOGZqP0ZSFU5U5UUuULYLLL21jvJYjYjYLvv7YLYJk2F1S51LL7
UFEUk252F55152FUF1S5XXPPEqENNkGPX211FUUUUu1jJj211Y7vL7L7v7L7YLL7LvYYYLLvLLv
jXNF2511uUUUU125U521U55SFXSPSPZP11U5U1U2UUu2j21SUJrLvYLY7YLYLYvLLYYYLYLJYj7
F2P152F15U1u2uUuUu2U1UF5SSPkPkGXFU5U2u2U2uUuUuS252F1S2F1S21U2UFU12S15U52511
11FXkqkNPPkkkPFPkNqNNEPENZ08ZZ0P152UU2UUuUjUUFUS5kSXSk5S2UUSFkFkFk5SSF1XFX5
2k85XSS151kFS1k5PFSFXSqkqqNX0qOX5UF22j2U2U2UFFFPr.:i  i..7L.rir;7r:iiYYrrii
FkXk21U1jUu1uUU5U1U12S1XSSSPkN0q2UJuJJYjYjJ22u1Fi,:: :ri.77,,,:, .:i.ri:,:.

---
, ,.:.....::.,i,,,:i:.,,:,r,.  MBG277vPBBNZqZNGEEMBu,:;iiir;;iririr;rir;rii
.      .   .  .. ..:,.....:.  7BF;::...rk0XZEGqEPOBF ,,:::::::::,:::::::::,
. ,...,,,.::..:.,,::::i:i:r,..BBLii:... rN8BBMOGO0BG::ii;iii;iii;iiiri;iri;
. ...........,,..,,:::,:,::, YBBuriUNNv::FXBMM888OBBr::iiii;iiiiiiiii;i;i;i
, ............:.,.:,,.,.,,:,.PBBBM,iq5BL,YZMB8G0O8BMU.::iiii;iiiiiiiiiri;ii
. ............:..:,,.,.,,::,.ZBBPv .iri,.vMB88NGGMMB8:,::iiiiiiiiiiiiii;i;:
, ,...........:.,,:,:,:,:::,.kBGi ..:,...iBE08E0MGMMBP::i:i:i:i:iiiiii;i;ii
. .,...,.,::..:,,::i:i:iiir:.UBMYr::i:...;GNSO08MMGBGBU::i:iii:iiiiiiiirir:
, ..:.,...::..:.,.:::::::,7:,:BBNYi:i,,,,70qNO8ZMOMGOBEr::iiiiiiiiiiii;iiii
. .,:.....,:.,,,,,,r::,:,:r:,,EBZ5vLii:::UE8qMMO8M8Z0OGJi::iiii;iii;i;iii;:
, .,:.....::..:,,,:i:,::::7:,rBBB57:,,iruZZEE8B8MMMZEZMP7:iiiiiiiiii;i;iiii
,..::,....::.,:::::r::::,:r:,PBBBB57rvLJ1MEG08BMZOOGNG8MY;:iiiiiiiiii;i;i;:
: .:i.,.,.::,:i::,:;::::::7,:BBOMBBBBBXjUFEPGGBOG8M8GZO8qri:iiiiii;iii;irii
,..:::,:,,:i.::::::r:::i,:i:uBMMqMBBBMNGULPEqGOBNOOMEGOMZ7:iiiiii;i;i;i;i;:
:.,:i,,,:.ii::i::,:ri:i:::LY00BMEEBBBMS8XSOMMGMB8q8G0E8MM7::ii;iii;iii;irii
,.,:i:,:,,:i,::::::r:::i,:7rFBBqG2MBBBOBBBBBBBBBMNMMNGGMZJ:iiii;iiiii;i;iri
:.,:i,:,,.:i::i::::ri:i:::rivri.UqBBBBBBBGS25U8BB8BOZZMEM57iii;iii;i;iii;ii
:.,:i:,:,,:i,::::::ri::i,:r:...uMBBBBBZL:::7ri:rFBMZNOGZBOvii;i;i;iiiririri
:.::r::,:,ii::i:i::;i:ii::7:;Y5MBBBUvvi,Jqu::,:..r0BBM8qNS7:iiiiii;i;i;irri
:,,ii:,:,::i,::::::riiii,:7uqZ00S7::irrYXSLi:,,:.,rBBBMZkv:::i:i:ii;iiiiii:
:.::;::,:,ii::i::::ii:i::iL7:.,:, irrir75UUv;::::.:MBBBEPUUUFU1jYv7rY7Y77YY
:.,:i:,::::i:::::::ri::vrr,7:..,. iiii:i7YYu7i::,:,ZBMMBS7i770B5L5J1S52uY2v
:.::i::::,:i::i:i::;::v2r::Yj,,,:,::ir;ivvYjJri::,,uBEMMM7iiiUr:ii;iiiiiiii
:.,:i::::,:i:::::::i:1UUi::YY:,::;:::LJUUUYjJLii::,YBBMMX7i;iii;irir;rir;7i
:.::i::,:,:i::i::::i:SXUYr;ii::::::::iLY0UJYjLvi::,rBBBO7i;irrr;rir;rirrr;;
:,,:i:,:,::i::ii:::;:PZqFU7;:i::::::::ir2XLLvY7i::,:MB0;.rrririr;rrr;7rrrri
:.::i::::,ii::i:i:ii:rXZ8XU7i:::777:iiri7N2Lv77ii:::uJi,,:vrrr7;r;rrrr7;rr;
:,,:i::::,:;:::i:::rii:J0ZNFYri:::i7rrirrFNUvvrrii::rJ7i,,i7;r;7rrr7r7r7r7i
i.::i:i:i::i::i:i:iirii:L5PPS2jLY  ,vLjLvLPqjLvr;:::rjL::.:rrrr;r;7rrrrr7rr
:,::,:::,::i:iii:i:i:i:::2u5SqqBBqvr::rUUUuPkuvL;;:::7riii:7rrrrrrr7;rr7rri
:,::::::::r:::r:i:i:;i;iijUJU25GBFF1Li:,i7YLEPuv7;i:irYYYLYrrr7rr;rrrrrr7rr
:,:i:::::;rriiii:iiii;i;:jYY7vvLFP0N52Lr:::ir1F2rriiivuUUJ7rrrrr;r;rr7r7r7i
i,::::::::iii:r:iiiiii;iiUULUUUYjUNZ8NP2u7r:::ij1r;iir;i;ir;r;rrrrrrr;rrrrr
::::::::::::::i::iiii;iiiEULri::,::irX8OqSuYr;::jJ;;i7;r;rrrrr;7r7;rrrrrr7i
i,i:::::::i:::r:iiiii:ii7ii::,:::,:,::7uEGOXSUY77LLrrrrrrrrrr;rrr;r;rrr;7rr
::irii;L;;;vr:v7i77JrrrYL7r;ii::::::,,...:vSN0k1Lv77rr;rr7rr;rrrirrr;r;r;ri
;:;ii:iuFu7r7:552ujLiirLY77ii...... .....  .7Y5FFYY77r7r7r7r7r7r7r7r7777vrr
iirv7rr20X7Yjv1MNSF1r77S1j;:,,...::rvUU1U5JJ7rr7LUYL7L7L7777777v7L77r7r777r
JrLLYLJYUU2YjYYJUu2YJYJY25uuUYjLjLYLYYUu1UUu27;irir;7r7r7r7r7r7r77777rv7v77
Yr777777r7777v77r7777777rU0PUJ7Lr7r7;ri77YLjJjr;i;irir;r;rr7;r;r;rrrrrr777r
7i7rrrr;7rrrrrr;7r7rrrr;r;FuUL777rrrr;ri;i7LjYuJLi;iriiiiii:iiiiiiiiii;i;ii
L7vYvL7LvLLYvYYYLYLjJUU5U152JY777vr7rr;ri;i;irvjv7r7r777;r;7iririri;iiiiii:
NuuU22FU5UUuUU1UUu1UF1kkqXX2uYYvv77rrrrrririiiiirrrr7r7r7777v7v7v7v777v7v77
5PPqSXSPSk5S15252S1S5kXqqZZXUuYLvLv7r7rrrr;rir;ririrUk5F5F2F1F152FFS1kFX5kU
FU2juu2u2uUU5U2uUUUu12kSXkqk1YuvLLY7vr7rr;riririririrrrr777rvr7777LvL7LvL77
S1YUJ2juYUJUu2uUuUjUuU2SFXXN1SJULYvLr7r7rrrririr;riri7irr77777r777r7rL77r7r
F21U5U2uUjUUUj2u1UU2kFSSqXqSk1jJLvL7L77r7rrrrir;r;rirvY7Y7L7LvLr77L7v7LvL77
ukU1UUjUJuJuYuuUuSXEjUj125FEFFJuYjYJLL7vrr;r;ririri;rL7L7L7v7Y7v75EL7L7LvL7
U5Uu1U1U2UUU51F2SSNq00GZO08NX52juLJLYLL77r7;r;ririri7r7rrr7rLYJLYJ5UUjUuU7v
jFjUuUU1U52F2FU2u5552SFPPPkqFSuUYJYJLLvL77rrr7rrrri;rLvYYJJUjujuLYLYvYLYLY7
USFU2UFU22Uu2UUJUu2U15XFXFqkS2jJuYJLYLL7v7777r7;riirLLujjYjLLLLLLLYLYvYLjYL
2F51U1U1U5U1U52F1kSXSXkqXqq011JuJjYJYYLL7v77r7rrii7Uu2jjj2uUU2U1U1U2jUu1uUY
2u5uUu11121252F1F151FSqXqPEP5UJYJLJYYLY7vr7rr;vr7jq552UU5UUu521U1U1U2u2UuJJ
UEq2U5U225U2US251S5SSPXNXNXEqX1FjUjUYY7Lvv7Lr77vu2vL7LLL7v7L7v7v7v777L777vr
UXP2X5S55U2uUUS1S5kk52SFXFXkEXq15U1UUL7r777r7rLJ1JYvv77r7rv7L7YLY7v7L7Y7Y7r
UPXF12jUuUu1j221212S5PXqPqFXNqSkU522uUv77v7v7jUSUuYJLjYYLLLLvLr77LLYLY7L7vr
1kNU2J2uUu2U1U2252Xq0kFFX15POSX51U1U2UuLY7L7YUFXjYYvYLLLYLYLY7v7JqYrv777JLL
jPk515U1U2U5U51FUFkZ08Z8Z8EMZPFk15U1u2uUYL7ju2U0YjLYYjYJLL7v7LvYYSU12512vL7
U5NUS2F2515212F2S1SSPPqq0PZ88kXSFU12FUUuUJjuUUUSjYL7v7L7L7v7YLLvL7LLYLLvLLv
jkq52111JUjUu1U5U1252kSk5XNMZqFX11U525uUuUYUj12PUJrL7YvY7YLLLLvLLYLYLYLJYJ7
52X25UF25U2uUu2jUU1UF1kFkX80OqPSFuUU5U2uUjUuUuj21U52S152522UUU5U1UF25U1U5U2
2UFXSPkqXXSkFX5XkqqNNG0GEZNZG8SXU2uUU2U2uuYUuUYk2SFk5S1FU2UF5k5S5S25FF2SFk1
1kG5XFS15US5F1kFX5SSPkPPNE0PGG0F5U2U1U1UUuUU5jFPr.:i  i..vL.;iri7;:iiYYrri:
5SXkU2u1uUu2uUU1U1U51k5kPEkkSZNkUUYjYjYJYJYUju1Fi,:: :ri.77,,,:, ,:i.ri:,:.

---
. .,:.....::,,:,,,:::.,.:.;,  UBB02vjZBBOZZNZZGZMBJ.iiiiiiiiiiii;i;;;iririi
.          . ..  ..:,,.,..:  :BOri:..:L8XPXZN0P0GBU.,:,:::,:,:::,:::::::::,
. ....,.,.::.,:.,,::::::::r..BBYii:.. .rNEBMMEO0GBG,::iiiiiiiiii;i;iiiiiiii
. .......,.,.,:,.,,:,:,:,:,.iBBYi;7Uj7::2XMMOOGGEBMi,iiiii:iiiiiiii;i;i;ii:
. ............:.,,,,,.,.:,, kBM0E:7NZk7,LkMMMEGGM8BL,:i:iii:i:i:i:iiiiii;i:
. ...........,,,,:,:,,,,,:..PBBMP..7jU:.rMMMEEEMOMMG,::iii:i:iii:i:i:ii;ii:
. ..........,.:.:,:,:,:,::: 0BML..,.:.,.:BOq8088MOMMF:::i:i:iii:i:iiiiii;ii
. .....,.,::.,:,.::::i:iiii.1BG7:::i::,,:OqqOEZM8MMMMY:::i:i:i:i:iiiiii;i;:
, ..,.... ::..:.,.,::,:::,;.rBBkU::::::.iXqkOZ8OMGOEB5r:iii:i:i:i:ii;iiiiii
. .,:.....,:.,,,,,,i:,,:,:;,,MB82Yrr::,:7ZPEZMGM8M0Z807i:i:iiiiiiiiiiiiii;:
, ..:.....:,..:.,.:i:,:::,r.:MBBSrr::,;7PGEqOMMZMGEN8OUi::iii:i:iiiiiiiiiii
,..::,....,:.,,,,,:;::::,:i,LBBBB1::irY1EMPEEBOGGMEZEM0v:iiiiiiiiiiiiiiiii:
: .,i...,.::..:,:,:ii::::,i.8BMMBBBBBquYFEq0ZOB0M8O0OGMji:iiiiiiiiiiiiiirii
,..::,.,..:i,::::::r::::,,i1BBE0MBBBB0PPLSNPNMBOEM8GEM8Pi::i:;ii:;iiiiiiii:
:..:i,,,,.::,,i::,:ii:::::kGZM8NMBBBMrqP2XOG8ZBMPEMNEGBqi:iiiiiiiiiiii;i;ii
,..:i:,:,,:i,::::::r:::i,iJZBBXOEBBBMUPMMBBBBBBBNZOZNGOEr::iiii;iiiii;iiiri
:.,:i,:,:.:i::i::,:;i:::,:jjUr,J0GBBBBBBBBOqSNBBBZBZ8GG85iiiiiiiiiii;i;irii
:.,:i:,,,,:i,::::::r::ii,:i,...iPBBBBBBN7::L;;rUOBMEZ80B0Y:iiiiiiiiii;ir;r:
:.,:;::,:.ii::i::::i;:ii::r::.;ZBBBBPJJ.72Y::,..:LZBMENXq7:iiiiiiiii;iririi
:.,ii:,:,,:i,::::::riiii,:;irN8M8BJ:,v7uN5;:,,,,.:7BBM0qji:i:i:::iii:i:iii:
:.::i::,:,ii,::::,:ii:ii::7YOSY7P,.7uLruP2jri::::.:0BB8NYuUUFu2jYv77L7Y77LY
:,,:i:,::,:i,::::::rii:i,iL7:,.:7 iri;i7JUUUri::::.UBBM8L;i77PB1Y5Y1k2UjL2v
:.::i::,:.:i::i::::i;:i:i;:,:,:,:.:i;;i:vYUUuri::,,:BEMMFiiiiur:i:iii:ii;::
:.,:i:::,,:i,::::::rii:iii:::::::i:::7v7Yuj1UY;:::,:EBOMJri;iii;iri;;ririri
:.::i::,:.i:::i::,:ii::rr:::::::::i:::vJ5SuJ2jLi:::.LBBq:,7;riririririr;rri
:,,:i:,:,,:i:::::::;:iiUvr:::i:::::i:::r7q5YYUL7ii:,:ZS:.::7;rir;ririr;r;ri
:.::i:,,:.ii::i::::iiYrJF27:::i:::::::iir70UJYY7r::::iYi::::7irir;rrrrr;rr;
:,,:i::::,:i:::::::i;Gu7J17;:::;ri:i:ii;;rLZUJv7r;:::i77i:,:i7;rirrrrrrrrri
:.::::i:i:ii::i:i:i:rEEujYY7r::i7LU7rrrr7r7JN5uv7ri:::i7i::,;rr;rrr;rr7r7r;
:.::,:,:,::::iii:::::SZ0kS2ULLr::i.,7UYJLvr7vk1u77r;:::;i77Y77rrrrrr;r;rrri
:,::::::::i:::r:iii::rXXZ0GPX12LYY  :i;7UuuY7vMFUv7;i:::jUJv7ir;r;rrr;r;7r;
:::::::::ir;:ii::iii:ir777U0qNq0GBBUUri::i;77L10S17rii:i;ri;;r;r;r;rrrrrrri
i.::::::::iii:;:i:ii;ii:::uNk2SXGBBXZk5jLrrii:::iLkLrii:rrr;rrrrr;rrrir;r;;
::::::::::::::ii:i:ii;ii::U2ri:i:iiY2ENNkFUu7rii::rurriiirrr;rrrrrirrrrr;ri
i,::::::::i:::r:iiiiiirii77iiii::,,.:iJ5qEGNq11YJ77rvriirrr;rrr;r;r;rrrrr;i
::i;iiivrirLr:77ir7Yrrrv:v7viri:::::.,.,,rv1SNPNkX1jr7irrrir;r;rir;rir;r;ri
i,iii:iJ5jrr7:551jJLiirYr7J7i::..           .rLvjjU25jj77r7rrr7r7r7r7r7r77r
iirvrrrUZk7YJL18ESSUi77kJvj7i;::::,i:rrv77i::L77rrrv7L777777r7r7777777r7r7r
J7L7LLYLu2UYJLJLujuLJYjYUjk21UUYJYYvLvYJ1u5UUrr;7rrir;r;r;rr7r7r77777r7777r
Yr7777r7r7r7r7rrr7r777r777uqjU77r7rririrrLLUv7i;ir;r;;rr;r;riririri7rrr7r7;
7i7r7rr;r;ri7;r;rr7r7r7;ri72jYLr7rr;rrri;irr7vv;riririi:iii:i:i:i:i:iii:iii
v77Lvv7v7L7LvLvYLYLjJUu525U5YY7v77r7rr;riri;;77Lr7r7r77r;7iririririi:i:iii:
0ujj1U2U2UUjUU2U2U12F1kXqkP1JYYvL77rrrr;riririrrYrrir;r;7777v7v7L77777v7L77
1PkPSPkXSS5S21251F1kFPX0XEEqJJLLLY77rr;ririri;irrvJS1k1S2S25UF55U15F5SFX1SU
222JUjUj2jUu5U2u2uUUF5FkXkqkJYJLYYY7vr7;r;rir;ri;i777irr7r7rv77777L777v7vr;
F2jUYUjuYujUuUUUuUu2U22FSqXqUJYYLL77r7rrir;r;ririiir;rir;7r7r7r7rrrrrL77r7r
5UUU1U1juYUJUJ2U2U12XSkSqXNkjLJLYvL7vr7;r;rir;r;riirLvL7Lrv77vLr7rL7L7LvL77
u5U2UUjUjuJjYuu12FPGjUUFFSSSJjYjYJLL77rr;ririr;r;ri7vL7L7L777v7v7Fqv7L7L7L7
j2UuUu1U2uUU52S5SSq000GGOZ82uYJYJYJLL77rriririr;riirv77rrrrrLLjYYY5uujujj7L
jSuUuuuUUFUF2S21UF2F1kSqXqFUYJYYLJLY7L77rrrriririr;vvL7YYJYuJUjjLLLLvYvLYY7
255U2U1U5UUU1UUuUU2251XFXkkJJLJYJYJLL7L7777rr;r;;i77YLJYJYjLLvL7LLLvYLYLjYL
U5F1U5u2U1u1U55S5kSPSXFqqquYLYYJLJLYLL7vr777rrrri7JUUUJjJ2jUjUuUu2UUj2j2uUY
2u1juJ122U1U1U1251S2kSPXNqSjJYYLYLJLYvv7777r7rri7JS11UUU2UUu1U1U221U2JUjuJY
UqPUU1u2U5U2251F1SFXXqqNqZNqkX52jjYYLY7v777777722Lvv7LLL7v7v7v7v7777rv7777r
UkPUk1F15UUu22F1S5SSSFXSPqqFXSk5FUYLvr7r7r7vYJkNYJL7777rrr77LvLvL777v7L7L7r
uPX51UJuuUu2j2212F2S5XkqSEkkFSSkU1YLLL7v7LLYJ1UNuuYYLJLLvY7L77rrrLLYvYvL7vr
UkNU5jUuUuUU1U5UF5NNESS1SqqFS1kkSU2YYLYLYLUUSU1PUYJvYvL7LvYvL7v7JXY7L777YLv
JXX5U2U1u22F255F2kXEE8G8NGXX5F1P52UUJYLYYUu5UUuNYYLYLYLJLL7L7L7YYFU125227L7
uFqUF25U51F25U51S1XSPPNkqZX5S25SPF2UuYYLUuFuuYUFJY77L7L7v7v7LLL7vvLLYvL7v77
Jkq222U2JUUUU51F15155kFS0OSk22u5SkU1uuYjJUUjUjuXUJr77LvY7L7vvLvLvYLLvYvYLY7
1Uk21U522U2uUu2uUU12SFXFOENSFUUU525u2uujUjUvYLJ21u5U5U1UFU2UUu2UUU525U125U1
1UFk5kSPkkSkFXFXkNP00Z0ZEGXS21U1UFU2ujYJu5125JLSUkFSFF15uUuS5k5F5S1F512S5k5
1kZ1k5F2FUF5S5FFXFSS0kq08G05FU2U5U1UUjUU5j7vUJ5X;.:i  i..7Y.;;ri7;:iiYYr;i:
USXSUUu2JUj2u2U5U2U55SXNPEPX1UjuJuJuYJj2YvvLLu55i,:: :ri.77,.,:, .,i.ri:,:.

---
---
---
. .,:.....::,,i,:,:i:.,.,.i  5BBBBBGBBBMMG0Z88Bk.:iiiiiiiiri;iii;i;i;iririi
.   .  .  ., ......:.,.,... iBBBNk2SBBE0PEqEGOBB..,:,:,:::,:,:::,:::::::::,
. ..,.,,,.::,,:,::::::i::,::BBJri,.:2MEqMOMGMOBBr,i:iii:iiiiii;i;iri;iii;ii
. .,.....,,,.::,,:::::::,, MBU:::, ..7ENMMOMOMOBu,:iiiiiii:iiiiiiiiii;iiii:
. ............:,:::,:,:,, ;BBLi:i:::..1kqOMG8GMBS,::i:iii:i:i:iiiiiiiiii;ii
. .........,.,:,,:,:,:,:. kBPU2rvZkL:iLPkMOZqGGBX::i:i:i:i:iiiii:iii:ii;ii:
. ......,.,.,,:,:,:::::::.MBBXB,.L87v:;ZGZEkGZGMB7,:i:i:i:i:iii:i:iii:ii;ii
. .,.,.,,,::.:::,::i:iii::MB5Pi .,7Ji.iB0E0NEG0BM8;::i:i:i:i:iiiiiiiiii;i;:
, ..:.,...::,,:,:,::::::..OBqL.,::... YBE8MPE0G8MMU:::i:iii:i:i:i:iiiiiiiii
. .,:.....,:.::,,::;::::..FBBFY:.:,,,:2MMBqPNG0Z8MPr::iiii:i:iiiiiiiiiiii;:
, ..:.....::..:.:,:ii:::,.EMBq2L7::.:rMBBMEN8E8qE0Z7;:iii:i:i:i:iiiiii;iiii
,..::,....,:..:,,::r::::.;BMBBuL7r::iGBBBBGGOOGZqGG5ri:i:i:i:iiiiiiii;i;i;:
: .,:...,.::..:,:,:;i::,.UBMMBZr:,:;qBB8GOBZ888ZZ0ME7i::iiiiiiiiiiiiiiii;ii
,..::,....:i.:::,::r::,,:BBB8BBOFSUqMMEGkNBM0E08G8EOui:i:iii:iiii;:iiii;ii:
:.,:i,,,,.::.,i::::ii,:78BBOZMBBBBENEPNEG8BBBNZZ8ZO8Xi::ii;iiiii;iii;iiirii
,..:i:,:,,:i.::::::;::;Y2MBM0MBBBG7ZNGMBBBBBBBZ88GZMGr,iiiiiiii;iii;i;i;i;i
:.,:i,:,:.:i,,:::,:;i::7ZBB8ZPBBBGLEBBB8kUFFNMBMOZG8OU;:i:ii;iii;iiiii;;rii
,.,:i:,:,,:i.::::::r:::i.:7i71GBBMMBBqrrii...,vEOBBMZPYiiii;iiiiiiiiiririri
:.::i::,:,i:::i::::;i:i:.,i,ijGMBMBB775i:,..,.,:uBBO8Ejii:iiiiiiii;iii;irii
:.,ii:,:,,:i,::::::r:::i,:ri:;SEMBXY7MFJrr::.,.,.UBMPN7iirii::::iiii:;:iii:
:.,:i::,:.ii::i::,:ri:i:::7::;5GB7:JXPX21u7i:,,,..0BOPr:7k1uFUUjY77rL7Y7vYJ
:.,:i:,:,,:i,::::::ri:ii,iri,LEBriJuj2jUU1UYi:,:.,,MBBYii;r7rqB5L1Y2S1UuL27
:.::i::,:,ii::i::::;i::i::r:u2X0 vuLY7rvUu1UY;:,,...MBGrii;i;jr:i:iiiiii;i:
:.,:i::::,:i:::::::rii:i::72j::;..r7rvrvUuJUuYri::...EBY;ri;iiiiirir;ri;iri
:.::i::,:,i:::i::::ii:i::ijr:,::i:::i;LY5FuYjJY7r::..,v:rrririririrrrir;rri
:.,:i:,:,,:i,::::::r:i:::Y:::::i:i::::i775FULJYJv7::.,.::i7r;rir;r;r;rrrrri
:.::i::,:,:::::::::ii:::Y;::::i::::::::iriY5FYYYY77i:,,,i,irrir;r;r;r;rrrr;
:,,:i::::,:i:::::::rii:ruri;:i:::::i:i:;iri7uX1uLL7rii:::i,irr;r;rrrrrrrrri
:.::::i:i,:i::i:::iiriirFL7rriiii:i::::i;r7rrL5SFYLrr;r:::::rrr;rrr;rrr;7r;
:.::,:,:,:::::::::::::::LSYvrr;ri;iii;irr777;rrL2NUJ7rr;:::i77rr;rrrrr;rrri
:.::::::::i:::i:i:i:i:i::Lk5uvL7v77r7r7;rr77YLY7;ZS21Jvri:::v;7rr;rrr;r;rr;
:,:::::::ir;:ii::::i:iii::iuFkLY777Yv7rr7uUF5UJJv7iir7rrii,:ir;r;r;rrr;rrri
i.i:::::::i:i:i:i:i:iiiii::,:FSFP5X: .Y7vLL777vr7rririiii:::ir7rr;rrr;r;r;r
:,::::::::,:::i::::::i:i:i:i,iNEU77qkFirrrrrr777r777r77L7v77rrrr;rrrrr;r;ri
i,::::::::::::;:::i:i:iii:i::,Xu777BOBviYLYYuJ2u2u51F1FUuYvrr;r;rir;rrrrr;i
:::iiiiLri;vi:77i;rYirrLi;;i:1q5j2UFiiLXkNPEN0NEk5uJ77iiirir;ririririr;r;ri
i,;i::ij1jrrr,152JYL::rY7;iiqOEF1YjJ,.irr:i:::,...ririrr7r7rrr7r7r7r777r77r
iir7rri2EX7LYv2O0FSUirrkjr:jMESkUvrri:....       iYL7vrL777777r7777v77r7r7r
Y7Y7LLYLuuUYYLYLUJULYYJJUUUjOP1FYrvii,,..........77rrrrirrr;7;r;77rr7r77777
Yr7777r7rrr7r7rrr7r7r7r7777iYEkFrri:.  .        :7rrir;rir;r;riririr;7rrr7i
7i7r7rr;rrr;7;r;7;r;r;r;r;r::FG2JUj7rii:::::::::jrririiiiii:i:i:iiiiiiii;i:
L77LvL7L7LLLvLvYvYLJYuj1U2U1YF0kFP21UuLYvLLYYuJjL7r7r7r7;r;rirrririiiiiiii:
0Uuj1U2U1UUj2u121U1UF5SkXFXFFuFFSYYLLr7rr;rir;77Lrrir;r;7777v7v7v7777777v77
1PPPXqkPSS1S1F1S5kFkFXSqkNqEPN5SUJLY7rir;riririr7uUF5S1SU52F1S5F255F5XFX5SU
5U2JUu2u1u2U5U2U1U52SFkkPSPXPS5FUYJYL77r7rririri777r7ir77r7rL77777L77777v7r
F1jUJUuUjUJUuUU121U1U12kSqkPPXXFjJLL7Lr7r7;r;ri;i77r;ri7r77777r7r7rrrv77r7r
F1225U1jUj2u2jF25U55PSkkPkXSS1PJYLY7777r7;7rr;r;iivvYvY7Lrv777L77rL7L7LLL77
UFu1UUJ2juJuY2255kP8uUUFFFF0P1jUYjJY7v77r7;rrriri;rLvL7v7L77rL777FNL7LvL7L7
U1Uu2U515U12k5PFXPEEZE8GOGOEqjYLLLYLLvYLL77rrir;r;77L77r7r7rLLjYYYFuUjUjj7L
jSUUuuu11S5XFPkkFXFkkXkqPENSLYYjLJL7r7rrrrr7;7r7;rrv7L7YYJJUjUJjLLLLvYvYLY7
25FU12S2F15FF1F1FFF5kSqkNFUvYYJYuJuYYLLr777r7rrirr77YLjYjJjLLvLvLLYLYvYYjYL
1F1221U52F2F1kSPXqq0P0PEF7vJYjYJLjLJLYLY7v77r777r7YUu2juYUj2uUuUu2U2jUuUuUJ
1U5JUuF1S5XFXSXFXSqSqP0S2YYYjYjYjYYLL7L777v7vr7r7YX152UU2uUj5U1U121UUuUjuYY
U0q52S25FPFXSXPqkqkNP0X5J2juYjYJYJYYLL7LvL7v77r7vYLL7LvL7L7v7v777v77rv7777;
UXP2PSXSkSkFkkqPqPNq0kFuUjUjuYjLYLJYJvY7L7v777LJUuY7L77r7r77LvLvL777L7Y7L7r
UPkF5F255F5XFkSPFPkNkFuUJ2jUuujjLJLYLYvL7LvYvLuZUuYYLYYYvY7L7777rLLYvYvL7Lr
1X02kUF5F5SSPSPkqX0kFUUjUjUJUJjJuLYLL7Y77vJ7jUSNUJJLYvLvLLYLY7L7JkY7v777YLv
uPPS551k5XSNPNPNXNPFuUjUjUuUjUJuYJLJYJYuUSUjU1uNYJLYYYLJLL7v7v7YYFU5U5227vr
UF02X5kSXPNPNPqPNSSUUJUjUuUJUjuJUJujU2kkFLJJUYUSuY77L7L7v7v7L7L7v7LLYvL7vv7
uXNFFkFk5XkXXNP0XXU1UUjUjUuUj2jUu2UF1qFYLYvJ2UuqUJr77LvY7LvLvL7L7YLYLYLYLY7
51X1kFkFkSXSPkNXP21UUjUjUuUUUuUU11k2PFYLjYJLYYjU1U521U1U5U2u2u1U2UFUFU1U122
11kXkNP0q0NENZqPS5U2UUuUjUu2u22F5F2XkUu125111YLk2k5kSS55U2uF5k5S5S1SF1UF5XF
1kG5PkXXqkNP00NkP21U2uUu2u2u51S55UXkLvJYYv7vujSX;.:i  i..vL.;;ri7r:iiLYrri:
1kXP5F2k2k5PX05FUUJujjYjjUu511UUJ5U7777v7LLYYU15i,:: :ri.77,,::, .:i.ri:,:.

---
, .,:.,.,.::,,i::::ii.,.,..iBBBBBBOBBBM08GMMBBX.i:ii;iiiii;iri;i;irrrir;r;i
.   .. .  ., ......:,,.,. .BBOF2v77GB8X8GO0OOBE..:,:,:,:,:::,:::,:::::::::,
. ..,.,,:.::,:i,::::::i:: qBEi:,,..iXO0MBOMOMBBi::iiiiiiiiiiii;i;iriri;irii
. .,.,.,.:,:,:::::::::::.:BB7i::..  .XNEMMMMOBBJ.i:i:iiiiii;iiiiiii;iri;i;:
. ......,.,.,,i,:::,:,:. YBG27ii7r7::v058MME8MBY,:i:i:i:i:i:i:iiiiiiii;irii
. .....,.,.,.:::,:::::,, MBGuMriN87ii7NNGON0E8BU.::i:iii:iiiiiiiiiii:ii;ii:
. ,,,,,.,,:.:,i,:::::::,,BB8ZG,.iNPji:MZG0N0G0BB7,::iii:i:i:iii:iii:ii;irii
. .,.,,:,:::,:::,::ii;i::BBYJ, ..::: iBOOBMGEZMBPr:::i:i:i:i:i:ii;:ii;iri;:
, ..:.,.,.::,,i,:,::::::.EBXUi::i,...jBBBBMNZEMMM7;:i:i:iii:i:i:i:iiii;i;ii
, .,:.....::.,:::::ri::,,MBBS2i,.:.,;BBBB0EZqGZB8Yii:i:iiiii:iiiiiiii;i;iri
, .,:.....::,,:,:,:;i::,SBMBP52Ur,,iBBBBBSGEGNNEMU;iiiiii:iiiiiiiiii;i;i;ii
,..::,.,..::.,:::::ri:,rMBMBBY;;:::OBBBBBOGBZGXZM8rr:iii:i:iiiiiiii;i;i;i;:
: .,i,,.,.::,,i::::ri:.jBBBOB0L:i;XBB8G8BBGGMEG0MMj;i:iiiiiii:iiii;iii;irii
,..::,.,..:i,:i::::r:::ZBBOMBBBBNqMOqM0MBBBM08ZMEM1;:ii;iiii:;i;i;i;iii;ii:
:..:i,,,,.i:,:i:i:iiiikEMBBGMBBBS0ZNBBBBBBBBBBOOMOOr:iiiii;iiiii;i;i;iri;ii
:..:i:,:,,:i,::i:::ri;UBBBMZMBBB7GBBBM5Lrii72BBMOBMJ:iiiiii;iii;iii;i;i;i;i
:.,:;,:,:,ii::i::::;::YUY28GBMBBMBBOY7:,,....:1EBBBkriii;iii;i;i;iii;i;;rii
:.,:i:,::,:;,::::::r:::, :LZBMMBBBU:X1;i::,,...:NBBOYiiriri;iiiii;iiiririri
:.::;::,:.ii::i:i:i;i:i:,:7k0vBBOYv281UYYri,,.,.,kBMuiii;iiiiiii;iii;irir;i
:,,ii:::,,i;,::::::7iiii,:iZiUBX,7SXP1Y2U27i:,,,..2B7iir;rii:::iiiiiiiiiii:
:.::;::::.ii::i::::ri:;i::YjrBS,JUuJjLYLYU2Lr:,,,..L1rri7P1UkU2uYv7rL7Y77YJ
:.,:i:,::,:i,:i::::riiii,:7j7M; YY77i;;LLYjUL7::,:..;Yrrirr77NBFYFJ1kSUUY1v
i.::r::,:,ii::i:::i;i:i::7Yi:::.,;ri7rvu5YLvYLv;i,:,,:7r7irirur:i:;iiiiirii
:,,:i::::::r:i:::::rii:iYL:::,,i:::::7LYFkYLrv7L7;::,,,irr;riii;irir;ririri
:.::i::,:,ii::i:i:iii:iv7::::::::::,::ir7uSUj77r77r::,,,:i7rr;r;7rrrr;rrrri
:.,:i:,:,,:i:::::::ri:rYii::::::::::::,iirrjFXULr7rrii::,:i7rr;rrri7rrrrrri
i.::i::::.::::i::::ii:Yvrii:i:::::::::::iir;vJ25j77rrii::,:irrrirrrrrr7rrrr
:,,:ii:i:,:i:::::::7iiYU77irii::::::::::irr7;iiUMk1ULv;i::,:;7r7rrrrrrrrr7i
:.::iii:i,:i::i:i:iirir5Uv7rr;rii:::::i:;i7r777UB8PS1Uj7r::,:r7rrrrr7r7r7rr
:.::,:,:,::::ii::i::::,r1SJY7777r7rrrri:irv2U5YuuYrriii;:i::,rr7r7r7rrr7r7;
:,::::::::;:::i:i:i:iii:i7SSUYY77irr7:iYYYUuJ77rririi:i:i::::i7rrr7r7r7;7rr
:,:i:::::irr:ii::i:i:iii:::YSuYuJjjX,:iirr;ri;;ririr;rr77YvY77r7r7r7r7rrrri
i,i:::::::iii:;:i:iiiiiiiii,JSkPqJ7LMBEJi77rv7LYJYujUu2uULLr7r7rrr7r7r7r7r;
:,::::::,:,:::i::::i:iii:ii:,k0FL77jij0vrJJUU11S5S2UYLrrir;r;rrrr7rrr7r7r7i
:.::::::::i:::i:::i:i:;iiii:,1N2uYYJki :PUFFSuUYur7irir;rrrrrr7;7;rrrr7r7rr
i::iii;LrirL;:77irrJi;rv:riijGPP51LYJLrLr;ii:,.. ,rrir;rr7rr;r;7;r;r;rrrrri
i,;ii:ij5j7rr:k55jLL::rY7riiBqX5SuYr::...        iLr7r7r777r7r7777v77777v7r
ii77rrr1Zk7vJv5ONSkU;77Xj7:YqMqFFL7;::...........jYYLv7v7v77777v777v77r777;
Y7YLYYYLJUUYYLYYUU1YjYuYU1Fjr5GFXYi:i:,........ :L7;777rrr7r7rrr7r7r7r7rv77
Jr777vr7rrr7r7rr;7r7r7r7r77r:LMN2ki::. .        vvrrrrrr;rr7rr;r;r;7r7r7r7;
7i7r7rrr7rrr7;7rr;rrririri;iirGFkXJ::,,......:i7Urririiiiii:iiiiiiiiiiii;ii
L7LLvL7L7LvY7YLYLYLLjuUUU1U1UuFF1kSX1FJL7LvLLjJu77r7r777r7r7rr;rrr;;iii;i;:
EUuu5251FU2u2U111151S5SkPFXSSUk151UjuUYLL77r7rrrLrrirrrr7777L7L7L77777v7L77
5qPqXNXPkk5X1FFX5FFPkqkNk0qEN0SF15ujLJ7rr7rr;rirrY1PSk5k5S2S1XFF2F5S5PSPSP5
S51UUU2U5U225U12F2F2SFXXPkPkXkX5SUYLJv7;rrr;r;rirrvr7ir7vrv7v7v7v7Y7L7L7L7r
S1jUj1uUj2U2U1U1152F2S5kSPkPkSkF5kuJuu7YrL77r7rr;i7r;ri7r77v7v7777777L77r7r
S111F1Fu1U1U2UF2F2FkqkkkPXPkk5kkFJuYY7777;7;rrrrr;rLuYYvL7L7LLL7L7YvL7YLY7v
1SU1UUU5U2uUj55SFqNO222F5FFEqX1k2UjUYY7L7vr7r7rr;rivLL7L7L7v7L7v7FEL7LLLvY7
U52U12F5FU51XSqkNqZEGEMOM8OEP25juYjYuJYvLvvr7r7rri;;L77r7777YYjYYJFUUUUujvL
Uk22UUU55PSqSqXXSPSPkqPNq0qSUYJuYUYYL7r7rrr7r7rrir;7vY7YYjjUjUuuYYLLLJLYYY7
5SS1F5S5kFSSk5S5SSSSXkqXNq1uUYYYjJ2uUYJLL7vr7r777r77JYuYuJuLYLL7LLYLYLYYuJY
1SF51S1S5k1XFqkqPENEqEqGEq7JJuJjYJLuYjYJYYLL777v7771UUuUuUu1U1U2U1U1U1U2U1J
52SU2UFFkSPkqkPkqXqk0NEPkUuvuYuYJYj7LLYvL7v7L7YvL7kSF11U1U2u1U5U551U2u1UUYJ
UE0F1k5kSPSqXNPNP0q0NGNSU1uUjUJYYJYJYY7YLL7vvY777YLY7YLL7L7L7L7v7v777L777Lr
1NN5NkqPPkXkPXNq0NEN0XSUUjUYUuuuuvYLuYYvLLYLL77LUUY7Lvvr7r77LvYLY7v7L7Y7L77
F0NkSSFFSkSqSXXPSPP0FSUUYUYjYjLJYULYLYvLvLvLYjjGU2YJLYYYLYvL7v77rLYJvJLY7Lr
5PE5PUkSkSPkNkqX0qqFFUUYujuYjYYvLvYvLvLvLvYL11SNUjJLYLYvYLJLYvLvjXY7v777JLv
UNqkSkSPSPPEq0N0X0SFUuJYYUjUYjYY7L7LvYYUUP1UU5U0jJLYYjYjYLvL7LvJJXU51S25LL7
2XZFNkPXPP0q0PNNqFSUuYjYjJuYjJjYJLJJuU1SSLYJUY2SUYv7L7Y7L7L7YLL7LvYLYLY7LLv
1qZkSXkPkPXPP0q0kkUUjuYjJuYjYjYUjUUF1XPXLYLJ1UUqUjrLvYLYLYLLvYLLvJLYLJLYLJ7
SFNSXSqkXkPkqq0kS2UJuJuYuYujuYju21qkFSqYjYjLJYj15U52FU52F25U2U5211S1FU51515
F5XqP0qZZGEGEEkk55jUjuJjJUJuJ12Xkq1UUk125kFSFJYX2XFkSS5FU1UkFPFkFkFkF12kFPF
Fq8S0PqPNP0NZNk5FUUuUjuJ2uUUFSNPkuUUNuYLJLvLUukq;.:i  i..7Y.r;ri7;:iiLYr;i:
5PqqFPFP5PS0PFUUYJYYYJYJu22SFX2JLYY1u77LvLLYYUSSi,:: :ri.77,,::, .:i 7i:,:.
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
