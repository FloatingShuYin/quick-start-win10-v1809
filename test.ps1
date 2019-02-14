param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\config.json) | ConvertFrom-Json
$tempDir = $currentDir + "assert\temp"
Add-Member -InputObject $json -Name currentDir -Value $currentDir -MemberType NoteProperty
Add-Member -InputObject $json -Name tempDir -Value $tempDir -MemberType NoteProperty
$json | ConvertTo-Json | Out-File "$currentDir\temp.json"

powershell -noprofile -ex unrestricted -file "$currentDir\mod\aboutRainmeter.ps1" $currentDir
