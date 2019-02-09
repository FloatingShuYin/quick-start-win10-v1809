# 配置项
$GitUserName = "FloatingShuYin"
$GitEmail = "floatshuyin@gmail.com"
$SystemDriveLetter = $env:windir.replace("Windows", "")
$ScoopInstallDir = $SystemDriveLetter + "Support\Scoop"
$ScoopGlobalDir = $SystemDriveLetter + "Support"

# Install Scoop to a Custom Directory
echo '--------------Install Scoop...----------------------'
[environment]::setEnvironmentVariable('SCOOP', $ScoopInstallDir, 'User')
$env:SCOOP = $ScoopInstallDir
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# Configure Scoop to install global programs to a Custom Directory
[environment]::setEnvironmentVariable('SCOOP_GLOBAL', $ScoopGlobalDir, 'Machine')
$env:SCOOP_GLOBAL = $ScoopGlobalDir
echo '--------------Install Scoop done!--------------------------'

# Multi-connection downloads with aria2
echo '--------------Install sudo 7zip aria2 git...----------------------'
scoop install aria2
scoop install git
echo '--------------Install sudo 7zip aria2 git done!----------------------'

# add git ssh
echo '--------------setting git ssh...----------------------'
echo '步骤:'
echo '1.确认秘钥的保存路径(如果不需要改路径则直接回车)'
echo '2.如果上一步置顶的保存路径下已经有秘钥文件，则需要确认是否覆盖(如果之前的秘钥不再需要则直接回车覆盖，如需要则手动拷贝到其他目录后再覆盖)'
echo '3.创建密码(如果不需要密码则直接回车)'
echo '4.确认密码'
git config --global  user.name $GitUserName
git config --global user.email $GitEmail
ssh-keygen -t rsa -C $GitEmail

echo '登录 github 将以下内容↓ copy 到 github SSH keys 的 key 文本框中­'
cat $env:userprofile\.ssh\id_rsa.pub

echo '--------------open webpage...----------------------'
# 打开 web page
start "https://github.com/"
start "https://app.keeweb.info/"
start "https://www.google.cn/chrome/"
echo '--------------open webpage done!----------------------'

Read-Host '操作完成后按任意键继续­'
echo '--------------setting git ssh done!----------------------'

# add buckets
echo '--------------add buckets...!----------------------'
scoop bucket add extras
scoop bucket add versions
echo '--------------add buckets done!----------------------'

echo '--------------Install app...----------------------'


# nodejs varsion management
scoop install sudo
sudo scoop install python35 --global
sudo scoop install ruby --global
sudo scoop install autohotkey-installer --global
sudo scoop install nvm --global
# makedown编辑器
scoop install typora
# 截图工具
scoop install snipaste
# 解压缩工具
scoop install bandizip
# 看图工具
scoop install honeyview
scoop install wox
scoop install steam
scoop install rainmeter
scoop install vscode-portable
echo '--------------Install app done!----------------------'
echo '--------------open webpage...----------------------'
# 打开 web page
start "http://pandownload.com/"
start "https://www.freedownloadmanager.org/"
start "https://pan.baidu.com/"
start "https://www.listary.com/"
start "https://potplayer.en.softonic.com/"
echo '--------------open webpage done!----------------------'



