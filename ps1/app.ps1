# add buckets
scoop bucket add extras
scoop bucket add versions
Write-Host "add buckets Done!" -Foreground "Cyan"

Write-Host "Install app" -Foreground "Cyan"
sudo scoop install python35 --global
sudo scoop install ruby --global
sudo scoop install autohotkey-installer --global
sudo scoop install nvm --global

scoop install snipaste
scoop install honeyview
scoop install wox
scoop install steam
scoop install rainmeter
scoop install vscode-portable
Write-Host "Install app Done!" -Foreground "Cyan"

Write-Host "open webpage" -Foreground "Cyan"
start "http://pandownload.com/"
start "https://www.freedownloadmanager.org/"
start "https://pan.baidu.com/"
start "https://www.listary.com/"
start "https://potplayer.en.softonic.com/"
Write-Host "open webpage Done!" -Foreground "Cyan"
Read-Host "Wait..."