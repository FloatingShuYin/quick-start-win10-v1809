## 安装
直接Download Zip到本地并解压

## 个性化
请先阅读[Scoop](https://github.com/lukesampson/scoop)文档

必要的四个变量在根目录下的config.json中:
```json
{
  "GitUserName": "FloatingShuYin",
  "GitEmail ": "floatshuyin@gmail.com",
  "ScoopInstallDir": "S:\Support\Scoop",
  "ScoopGlobalDir": "S:\Scoop"
}
```
## 运行
- Win + X + A -> `set-executionpolicy remotesigned -s currentuser -f`
-  双击start.bat
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

也可以选择清空,重新跑一次,重跑如下:

1.双击 `clear.bat`
2. 双击 `start.bat`



