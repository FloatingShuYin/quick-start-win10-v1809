param($Directory)

$json = (Get-Content -encoding UTF8 $currentDir\config.json) | ConvertFrom-Json

Write-Host "clean" -Foreground "Cyan"
if (Test-Path $json.ScoopInstallDir) {
 del $json.ScoopInstallDir -force
}
if (Test-Path $env:USERPROFILE\.ssh) {
 del $env:USERPROFILE\.ssh -force
}
Write-Host "clean Done..." -Foreground "Cyan"
