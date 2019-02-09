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
- 执行utf-8.reg
- Win + R -> `rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,0` -> 管理 -> 更改系统区域设置 -> 勾选 Beta版:使用UTF-8
- 重启
- Win + X + A -> cd 至项目目录 -> start.bat

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


