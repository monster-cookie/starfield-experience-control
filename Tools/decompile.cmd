@echo off

REM Get Champollion from https://github.com/Orvid/Champollion

set SOURCE=D:\SteamLibrary\steamapps\common\Starfield\Data\Scripts\Source\Base
set DESTINATION=D:\SteamLibrary\steamapps\common\Starfield\Data\Scripts\Source\Base
set TOOLSPATH=C:\Repositories\Public\Starfield Mods\starfield-experience-control\Tools

REM Notepad++ needs current working directory to be where Champollion.exe is 
cd "%TOOLSPATH%"

cls
echo *****************************************************
echo Champollion decompile Starfield base game scripts
echo.
echo SOURCE: "%SOURCE%"
echo DESTINATION: "%DESTINATION%"
echo.
Champollion.exe --version
echo.

Champollion.exe -r -d -p "%DESTINATION%"                      "%SOURCE%\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fx"                   "%SOURCE%\fx\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fxscripts"            "%SOURCE%\fxscripts\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\nativeterminal"       "%SOURCE%\nativeterminal\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fragments"            "%SOURCE%\fragments\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fragments\packages"   "%SOURCE%\fragments\packages\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fragments\perks"      "%SOURCE%\fragments\perks\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fragments\quests"     "%SOURCE%\fragments\quests\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fragments\scenes"     "%SOURCE%\fragments\scenes\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fragments\terminals"  "%SOURCE%\fragments\terminals\*.pex"
Champollion.exe -r -d -p "%DESTINATION%\fragments\topicinfos" "%SOURCE%\fragments\topicinfos\*.pex"

