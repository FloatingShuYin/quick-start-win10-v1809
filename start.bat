@echo off
set "currentDir=%~dp0%"
cacls.exe "%SystemDrive%\System Volume Information" >nul 2>nul
if %errorlevel%==0 goto Admin
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
echo Set RequestUAC = CreateObject^("Shell.Application"^)>"%temp%\getadmin.vbs"
echo RequestUAC.ShellExecute "%~s0","","","runas",1 >>"%temp%\getadmin.vbs"
echo WScript.Quit >>"%temp%\getadmin.vbs"
"%temp%\getadmin.vbs" /f
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"
exit

:Admin
chcp 936
rem ‘À––powershell
start /b /wait powershell set-executionpolicy remotesigned -s currentuser
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\index.ps1" %currentDir%
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\openWebPage.ps1" %currentDir%
start /b /wait powershell -noprofile -ex remotesigned -file "%currentDir%\src\installScoop.ps1" %currentDir%
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\setGitSsh.ps1" %currentDir%
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\addBuckets.ps1" %currentDir%
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\installApps.ps1" %currentDir%
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\injectRegistry.ps1" %currentDir%
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\runAtBoot.ps1" %currentDir%
start /b /wait powershell -noprofile -ex bypass -file "%currentDir%\src\runMod.ps1" %currentDir%
pause
exit
