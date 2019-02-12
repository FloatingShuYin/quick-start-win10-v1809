param($currentDir)
$json = (Get-Content $currentDir\config.json) | ConvertFrom-Json
$tempDir = $currentDir + "assert\temp"
Add-Member -InputObject $json -Name currentDir -Value $currentDir -MemberType NoteProperty
Add-Member -InputObject $json -Name tempDir -Value $tempDir -MemberType NoteProperty
$json | ConvertTo-Json | Set-Clipboard

powershell -noprofile -ex unrestricted -file "$currentDir\mod\wox.ps1"
