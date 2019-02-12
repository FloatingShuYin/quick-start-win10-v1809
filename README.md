## 安装
下载 releases 中的 Zip 文件到本地并解压

## 个性化
请先阅读[Scoop](https://github.com/lukesampson/scoop)文档

配置文件在根目录下的config.json中:
```json
{
	// 你的github用户名
	"GitUserName": "FloatingShuYin",
	// 你的github邮箱
	"GitEmail": "floatshuyin@gmail.com",
	// Scoop安装目录
	"ScoopInstallDir": "S:\\Support\\Scoop",
	// Scoop全局安装目录
	"ScoopGlobalDir": "S:\\Scoop",
	// 要打开的网页
	"OpenWebPages": [
		"https://www.google.cn/chrome/",
		"https://www.freedownloadmanager.org/zh/download.htm",
		"https://github.com/",
		"https://app.keeweb.info/",
		"https://codecpack.co/download/PotPlayer.html",
		"http://pandownload.com/"
	],
	// 要添加的 scoop bucket
	"Buckets": ["extras", "versions", "nerd-fonts"],
	// 要安装的全局 app
	"GlobalApps": [
		"nuget",
		"nvm",
		"python35",
		"ruby",
		"FiraCode-NF"
	],
	// 要安装的 app
	"Apps": [
		"autohotkey-installer",
		"concfg",
		"rainmeter",
		"shadowsocks",
		"snipaste",
		"steam",
		"vscode-portable",
		"wox",
		"bandizip"
	],
	// 要执行的 .reg 和 .bat 文件
	"RegistryAndBat": [
		"utf-8.reg",
		"开机时开启小键盘.reg",
		"隐藏资源管理器左侧的6个文件夹.reg",
		"右键添加管理员取得所有权.reg",
		"消除箭头.bat"
	],
	// 可扩展的后续操作: 在所有 app 安装完成后执行的脚本
	"Mods": {
		"powershell": ["aboutNode.ps1", "aboutWox.ps1"]
	}
}
```
## 运行
1. Win + X + A -> `set-executionpolicy remotesigned -s currentuser -f`
2. 双击 `start.bat`
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

1. 双击 `clear.bat`
2. 双击 `start.bat`



