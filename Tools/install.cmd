@echo off

REM Notepad++/VSCODE needs current working directory to be where Caprica.exe is 
cd "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Tools"

copy /y "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Dist\Data\Scripts\VPI_LevelBasedScaling.pex" "D:\SteamLibrary\steamapps\common\Starfield\Data\Scripts"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Dist\Data\Batchfiles\LevelScalingConfig.txt" "D:\SteamLibrary\steamapps\common\Starfield\Data\Batchfiles"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Dist\Data\Batchfiles\vpi-lbs-reset-vanilla.txt" "D:\SteamLibrary\steamapps\common\Starfield\Data\Batchfiles"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Dist\Data\Batchfiles\vpi-lbs-reset-defaults.txt" "D:\SteamLibrary\steamapps\common\Starfield\Data\Batchfiles"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Dist\Optional\Balanced\Data\Batchfiles\vpi-lbs-config-balanced.txt" "D:\SteamLibrary\steamapps\common\Starfield\Data\Batchfiles"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Dist\Optional\Hard\Data\Batchfiles\vpi-lbs-config-hard.txt" "D:\SteamLibrary\steamapps\common\Starfield\Data\Batchfiles"
copy /y "C:\Repositories\Public\Starfield Mods\starfield-level-based-scaling\Dist\Data\SFSE\plugins\ConsoleCommandRunner\LevelScalingConfig.toml" "D:\SteamLibrary\steamapps\common\Starfield\Data\SFSE\plugins\ConsoleCommandRunner"
