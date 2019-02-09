param($Directory)

$CONF = (Get-Content $Directory\config.json) | ConvertFrom-Json
$GitUserName = $CONF.GitUserName
$GitEmail = $CONF.GitEmail
echo $GitEmail
# add git ssh
git config --global  user.name $GitUserName
git config --global user.email $GitEmail

ssh-keygen -t rsa -C $GitEmail

cat $env:userprofile\.ssh\id_rsa.pub

Read-Host "Wait..."

Write-Host "open webpage" -Foreground "Cyan"
start "https://github.com/"
start "https://app.keeweb.info/"
start "https://www.google.cn/chrome/"
Write-Host "open webpage Done!" -Foreground "Cyan"
Read-Host "Wait..."