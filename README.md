## 安装
直接Download Zip到本地并解压

## 目录结构
```tree
│   REDEME.md
│   start.bat
│
├───bat
│       关闭驱动签名认证.bat
│       刷新dns缓存.bat
│       开启驱动签名认证.bat
│       恢复箭头.bat
│       消除箭头.bat
│       网络重置.bat
│       重启桌面.bat
│
├───ps1
│       index.ps1
│
└───reg
        utf-8.reg
        关闭蓝牙套件的大小写切换提示.reg
        右键添加管理员取得所有权.reg
        开机时开启小键盘.reg
        显示资源管理器左侧的6个文件夹.reg
        隐藏资源管理器左侧的6个文件夹.reg
```

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
- 双击`start.bat`

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


