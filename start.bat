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
rem ����powershell
powershell -noprofile -ex unrestricted -file "%cerrent%\ps1\index.ps1" %cerrent%
rem ע��ע���
start /b /wait "" "%cerrent%\reg\utf-8.reg"
start /b /wait "" "%cerrent%\reg\����ʱ����С����.reg"
start /b /wait "" "%cerrent%\reg\������Դ����������6���ļ���.reg"
start /b /wait "" "%cerrent%\reg\�Ҽ���ӹ���Աȡ������Ȩ.reg"
rem ������
start /wait "" "%cerrent%\bat\������ͷ.bat"
pause
exit
