$json = Get-Clipboard | ConvertFrom-Json

git config --global  user.name $json.GitUserName
git config --global user.email $json.GitEmail

if (-not (Test-Path $env:userprofile\.ssh)) {
 ssh-keygen -t rsa -C $json.GitEmail
}
cat $env:userprofile\.ssh\id_rsa.pub

Write-Host "open webpage" -Foreground "Cyan"
start "https://www.google.cn/chrome/"
start "https://github.com/"
start "https://app.keeweb.info/"
Write-Host "open webpage Done!" -Foreground "Cyan"

Read-Host "Wait..."
