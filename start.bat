chcp 65001
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
rem 运行index.ps1
powershell -file "%cerrent%\ps1\index.ps1"
powershell -file "%cerrent%\ps1\nvm.ps1"
rem 注入注册表
start "" "%cerrent%\reg\utf-8.reg"
start "" "%cerrent%\reg\开机时开启小键盘.reg"
start "" "%cerrent%\reg\隐藏资源管理器左侧的6个文件夹"
start "" "%cerrent%\reg\右键添加管理员取得所有权.reg"
rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,0
rem 批处理
start "" "%cerrent%\bat\消除箭头.bat"
pause
exit
