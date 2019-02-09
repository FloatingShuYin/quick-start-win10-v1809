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
rem 运行powershell
powershell -noprofile -ex unrestricted -file "%cerrent%\ps1\index.ps1" %cerrent%
powershell -noprofile -ex unrestricted -file "%cerrent%\ps1\git.ps1" %cerrent%
powershell -noprofile -ex unrestricted -file "%cerrent%\ps1\app.ps1"
powershell -noprofile -ex unrestricted -file "%cerrent%\ps1\nvm.ps1"
rem 注入注册表
start /b /wait "" "%cerrent%\reg\utf-8.reg"
start /b /wait "" "%cerrent%\reg\开机时开启小键盘.reg"
start /b /wait "" "%cerrent%\reg\隐藏资源管理器左侧的6个文件夹.reg"
start /b /wait "" "%cerrent%\reg\右键添加管理员取得所有权.reg"
rem 批处理
start /wait "" "%cerrent%\bat\消除箭头.bat"
rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,0
pause
exit