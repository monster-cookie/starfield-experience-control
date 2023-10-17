@echo off

REM Notepad++/VSCODE needs current working directory to be where Caprica.exe is 
cd "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Tools"

copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts\VPI_ExperienceControl.pex" "D:\SteamLibrary\steamapps\common\Starfield\Data\Scripts"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Scripts\Source\VPI_ExperienceControl.psc" "D:\SteamLibrary\steamapps\common\Starfield\Data\Scripts\Source"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Batchfiles\vpi-xpctrl-reset-vanilla.txt" "D:\SteamLibrary\steamapps\common\Starfield\Data\Batchfiles"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-experience-control\Dist\Data\Batchfiles\vpi-xpctrl-defaults.txt" "D:\SteamLibrary\steamapps\common\Starfield\Data\Batchfiles"
