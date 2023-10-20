@echo off

REM Get Caprica from https://github.com/Orvid/Caprica

REM Notepad++/VSCODE needs current working directory to be where Caprica.exe is 
cd "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Tools"

cls
echo ****************************************************************
echo Caprica Starfield Compile
echo.

REM Clear Dist DIR
del /s /q "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\*.*"
rmdir /s /q "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist"
mkdir "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist"
mkdir "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts"
mkdir "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts\Source"
mkdir "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Batchfiles"

REM Deploy to Dist DIR
Caprica.exe --game starfield --flags "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Tools\Starfield_Papyrus_Flags.flg" --import "D:\SteamLibrary\steamapps\common\Starfield\Data\Scripts\Source\Base;C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Papyrus" --output "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts" "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Papyrus\VPI_Helper.psc"
Caprica.exe --game starfield --flags "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Tools\Starfield_Papyrus_Flags.flg" --import "D:\SteamLibrary\steamapps\common\Starfield\Data\Scripts\Source\Base;C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Papyrus" --output "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts" "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Papyrus\VPI_ExperienceControl.psc"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Papyrus\VPI_Helper.psc" "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts\Source"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Papyrus\VPI_ExperienceControl.psc" "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts\Source"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Batchfiles\vpi-xpctrl-reset-vanilla.txt" "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Batchfiles"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Source\Batchfiles\vpi-xpctrl-defaults.txt" "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Batchfiles"
