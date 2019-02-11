$json = Get-Clipboard | ConvertFrom-Json

# Install Scoop to a Custom Directory
Write-Host "Install Scoop to $json.ScoopInstallDir" -Foreground "Cyan"
[environment]::setEnvironmentVariable('SCOOP', $json.ScoopInstallDir, 'User')
$env:SCOOP = $json.ScoopInstallDir
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

[environment]::setEnvironmentVariable('SCOOP_GLOBAL', $json.ScoopGlobalDir, 'Machine')
$env:SCOOP_GLOBAL = $json.ScoopGlobalDir
$json = Get-Clipboard | ConvertFrom-Json


