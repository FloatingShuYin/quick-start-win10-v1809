param($Directory)

$json = (Get-Content -encoding UTF8 $currentDir\config.json) | ConvertFrom-Json
scoop uninstall scoop
Write-Host "clean" -Foreground "Cyan"
if (Test-Path $json.ScoopInstallDir) {
 del $json.ScoopInstallDir -force
}
Write-Host "clean Done..." -Foreground "Cyan"
