param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json
set-executionpolicy remotesigned -s currentuser -Force
# Install Scoop to a Custom Directory
$ScoopInstallDir = $json.ScoopInstallDir
Write-Host "Install Scoop to $ScoopInstallDir" -Foreground "Cyan"
[environment]::setEnvironmentVariable('SCOOP', $json.ScoopInstallDir, 'User')
$env:SCOOP = $json.ScoopInstallDir
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

[environment]::setEnvironmentVariable('SCOOP_GLOBAL', $json.ScoopGlobalDir, 'Machine')
$env:SCOOP_GLOBAL = $json.ScoopGlobalDir

Write-Host "install base env" -Foreground "Cyan"
# Multi-connection downloads with aria2
scoop install sudo 


# install git
sudo scoop install aria2
sudo scoop install 7zip --global
sudo scoop install git --global

Write-Host "install base env Done!" -Foreground "Cyan"


