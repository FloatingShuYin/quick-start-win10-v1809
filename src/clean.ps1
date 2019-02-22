param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\config.json) | ConvertFrom-Json
Write-Host "clean" -Foreground "Cyan"
if (Test-Path $json.ScoopInstallDir) {
del $json.ScoopInstallDir -force -recurse
 del $json.ScoopGlobalDir -force -recurse
}
Write-Host "clean Done..." -Foreground "Cyan"
