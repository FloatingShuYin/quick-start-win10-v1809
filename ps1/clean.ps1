param($Directory)

$CONF = (Get-Content $Directory\config.json) | ConvertFrom-Json
$ScoopInstallDir = $CONF.ScoopInstallDir
$ScoopGlobalDir = $CONF.ScoopGlobalDir

Write-Host "clean" -Foreground "Cyan"
if (Test-Path $ScoopInstallDir) {
 del $ScoopInstallDir -force
}
if (Test-Path $env:USERPROFILE\.ssh) {
 del $env:USERPROFILE\.ssh -force
}
Write-Host "clean Done..." -Foreground "Cyan"
