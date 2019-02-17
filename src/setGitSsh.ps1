param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

git config --global user.email $json.GitEmail
git config --global user.name $json.GitUserName
if (-not (Test-Path $env:userprofile\.ssh)) {
 ssh-keygen -t rsa -C $json.GitEmail
}
cat $env:userprofile\.ssh\id_rsa.pub

Read-Host "Wait..."
