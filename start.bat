@echo off
set "cerrent=%~dp0%"
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
rem ??index.ps1
powershell -file "%cerrent%\ps1\index.ps1"
powershell -file "%cerrent%\ps1\git.ps1"
powershell -file "%cerrent%\ps1\app.ps1"
powershell -file "%cerrent%\ps1\nvm.ps1"
rem ?????
start "" "%cerrent%\reg\utf-8.reg"
start "" "%cerrent%\reg\????????.reg"
start "" "%cerrent%\reg\??????????6????"
start "" "%cerrent%\reg\????????????.reg"
rem ???
start "" "%cerrent%\bat\????.bat"
rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,0
pause
exit
