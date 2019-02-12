param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

# Install Scoop to a Custom Directory
Write-Host "Install Scoop to $json.ScoopInstallDir" -Foreground "Cyan"
[environment]::setEnvironmentVariable('SCOOP', $json.ScoopInstallDir, 'User')
$env:SCOOP = $json.ScoopInstallDir
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

[environment]::setEnvironmentVariable('SCOOP_GLOBAL', $json.ScoopGlobalDir, 'Machine')
$env:SCOOP_GLOBAL = $json.ScoopGlobalDir


