## 安装
直接Download Zip到本地并解压

## 个性化
请先阅读[Scoop](https://github.com/lukesampson/scoop)文档

必须要修改的四个变量在ps1目录下的index.ps1中:
```powershell
# 配置变量
$GitUserName = "FloatingShuYin"
$GitEmail = "floatshuyin@gmail.com"
$SystemDriveLetter = $env:windir.replace("Windows", "")
$ScoopInstallDir = $SystemDriveLetter + "Support\Scoop"
$ScoopGlobalDir = $SystemDriveLetter + "Support"
```
其他则可按需增删

## 运行
- Win + X + A -> `set-executionpolicy remotesigned -s currentuser -f`
- 项目目录新建 start.bat 粘贴以下内容, 保存后执行

```bat
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
rem 运行index.ps1
powershell -file "%cerrent%\ps1\index.ps1"
powershell -file "%cerrent%\ps1\git.ps1"
powershell -file "%cerrent%\ps1\app.ps1"
powershell -file "%cerrent%\ps1\nvm.ps1"
rem 注入注册表
start "" "%cerrent%\reg\utf-8.reg"
start "" "%cerrent%\reg\开机时开启小键盘.reg"
start "" "%cerrent%\reg\隐藏资源管理器左侧的6个文件夹"
start "" "%cerrent%\reg\右键添加管理员取得所有权.reg"
rem 批处理
start "" "%cerrent%\bat\消除箭头.bat"
rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,0
pause
exit

```
## 错误处理

### 环境变量错误
如果出现
```powershell
'PowerShell' is not recognized as an internal or external command,
operable program or batch file.
```
以管理员权限启动powershell,执行以下命令.(注意系统盘盘符是否一致)
```powershell
[environment]::setEnvironmentVariable('PATH',
"$env:path;C:\Windows\System32\WindowsPowerShell\v1.0", 'm')
```

### 网络导致的错误
可选择单个修复,如下:
假如拉取失败的包名为xxx
1. 终端执行
```powershell
scoop uninstall xxx
scoop install xxx
```

**(建议)**也可以选择清空,重新跑一次,重跑如下:
1. 终端执行
```powershell
scoop uninstall scoop
```
2. 项目目录执行
重新执行`start.bat`


