set-executionpolicy remotesigned -s currentuser -f
# add buckets
echo '--------------add buckets...!----------------------'
scoop bucket add extras
scoop bucket add versions
echo '--------------add buckets done!----------------------'

echo '--------------Install app...----------------------'


# nodejs varsion management
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
