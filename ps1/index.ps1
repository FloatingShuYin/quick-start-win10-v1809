param($currentDir)
$json = (Get-Content $currentDir\config.json) | ConvertFrom-Json
Add-Member -InputObject $json -Name currentDir -Value $currentDir -MemberType NoteProperty
$json | ConvertTo-Json | Set-Clipboard

# powershell -noprofile -ex unrestricted -file "$Directory\ps1\installScoop.ps1"
powershell -noprofile -ex unrestricted -file "$currentDir\ps1\installBaseEnv.ps1"
powershell -noprofile -ex unrestricted -file "$currentDir\ps1\setGitSsh.ps1"
powershell -noprofile -ex unrestricted -file "$currentDir\ps1\addBuckets.ps1"
powershell -noprofile -ex unrestricted -file "$currentDir\ps1\installApps.ps1"
powershell -noprofile -ex unrestricted -file "$currentDir\ps1\installNode.ps1"

Write-Host "open webpage" -Foreground "Cyan"
start "http://pandownload.com/"
start "https://www.freedownloadmanager.org/"
start "https://pan.baidu.com/"
start "https://www.listary.com/"
start "https://potplayer.en.softonic.com/"
Write-Host "open webpage Done!" -Foreground "Cyan"
Read-Host "Wait..."
