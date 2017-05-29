@echo off
set file="AKB剧场公演文件夹\STAGES チームA" "AKB剧场公演文件夹\STAGES チームK" "AKB剧场公演文件夹\STAGES チームB" "AKB单曲文件夹" "渡り廊下走り隊单曲文件夹" "AKB AX"
for %%a in (%file%) do (
set pathly=%%i
call :setup
)
echo,&echo,完成
pause>nul
exit
:setup
call 变量处理\变量处理.bat 1 1
echo,%pathly:"=%
set "act="
rem ----------注释:set "act=" 删除了环境变量act
for /f "usebackq tokens=* eol=" %%a in ("%~nx0") do (
  if "%%a"=="::%* end" (goto :eof)
  if defined act (
  if not exist "%*\%%a" (
  md "%*\%%a"
  )
  )
  if "%%a"=="::%*" set act=act
)
pause>nul
exit
::AKB剧场公演文件夹\STAGES チームA
1st Stage 「PARTYが始まるよ」
2nd Stage 「会いたかった」
3rd Stage 「誰かのために」
4th Stage 「ただいま　恋愛中」
5th Stage 「恋愛禁止条例」
6th Stage 「目撃者」
::AKB剧场公演文件夹\STAGES チームA end
::AKB剧场公演文件夹\STAGES チームK
1st Stage 「PARTYが始まるよ」
2nd Stage 「青春ガールズ」
3rd Stage 「脳内パラダイス」
4th Stage 「最終ベルが鳴る」
5th Stage 「逆上がり」
6th Stage 「RESET」
::AKB剧场公演文件夹\STAGES チームK end
::AKB剧场公演文件夹\STAGES チームB
1st Stage 「青春ガールズ」
2nd Stage 「会いたかった」
3rd Stage 「パジャマドライブ」
4th Stage 「アイドルの夜明け」
5th Stage 「シアターの女神」
::AKB剧场公演文件夹\STAGES チームB end
::AKB单曲文件夹
独立制作01st 桜の花びらたち
独立制作02st スカート、ひらり
01st 会いたかった
02nd 制服が邪魔をする
03rd 軽蔑していた愛情
04th BINGO!
05th 僕の太陽
06th 夕陽を見ているか
07th ロマンス、イラネ
08th 桜の花びらたち2008
09th Baby! Baby! Baby!
10th 大声ダイヤモンド
11th 10年桜
12th 涙サプライズ!
13th 言い訳Maybe
14th RIVER
15th 桜の栞
16th ポニーテールとシュシュ
17th ヘビーローテーション
18th Beginner
19th チャンスの順番
20th 桜の木になろう
21st Everyday, カチューシャ
22nd フライングゲット
23rd 風は吹いている
24th 上からマリコ
25th GIVE ME FIVE!
26th 真夏のSounds good!
::AKB单曲文件夹 end
::渡り廊下走り隊单曲文件夹
01st 青い未来、初恋ダッシュ
02nd やる気花火
03rd 完璧ぐ～のね
04th アッカンベ橋
05th 青春のフラッグ
06th ギュッ
07th バレンタイン．キッス
08th へたっぴウィンク
::渡り廊下走り隊单曲文件夹 end
::AKB AX
AKB AX 2008
AKB AX 2009
AKB AX 2010
AKB AX 2011
AKB AX 2012
AKB AX 2013
::AKB AX end
