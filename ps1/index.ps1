param($Directory)

$CONF = (Get-Content $Directory\config.json) | ConvertFrom-Json
$ScoopInstallDir = $CONF.ScoopInstallDir
$ScoopGlobalDir = $CONF.ScoopGlobalDir

# Install Scoop to a Custom Directory
Write-Host "Install Scoop to $ScoopInstallDir" -Foreground "Cyan"
[environment]::setEnvironmentVariable('SCOOP', $ScoopInstallDir, 'User')
$env:SCOOP = $ScoopInstallDir
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# Configure Scoop to install global programs to a Custom Directory
Write-Host "Configure Scoop to install global programs to $ScoopGlobalDir" -Foreground "Cyan"
[environment]::setEnvironmentVariable('SCOOP_GLOBAL', $ScoopGlobalDir, 'Machine')
$env:SCOOP_GLOBAL = $ScoopGlobalDir

Write-Host "Scoop install Done!" -Foreground "Cyan"
Write-Host "install base env" -Foreground "Cyan"

# Multi-connection downloads with aria2
scoop install aria2
# install base env
scoop install sudo
sudo scoop install 7zip git --global
Write-Host "install base env Done!" -Foreground "Cyan"
Read-Host "Wait..."



