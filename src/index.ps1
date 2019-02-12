param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\config.json) | ConvertFrom-Json
$tempDir = $currentDir + "assert\temp"
Add-Member -InputObject $json -Name currentDir -Value $currentDir -MemberType NoteProperty
Add-Member -InputObject $json -Name tempDir -Value $tempDir -MemberType NoteProperty
$json | ConvertTo-Json | Out-File "$currentDir\temp.json"

powershell -noprofile -ex unrestricted -file "$currentDir\src\ps1\openWebPage.ps1" $currentDir
# powershell -noprofile -ex unrestricted -file "$currentDir\src\ps1\installScoop.ps1" $currentDir
powershell -noprofile -ex unrestricted -file "$currentDir\src\ps1\installBaseEnv.ps1" $currentDir
powershell -noprofile -ex unrestricted -file "$currentDir\src\ps1\setGitSsh.ps1" $currentDir
powershell -noprofile -ex unrestricted -file "$currentDir\src\ps1\addBuckets.ps1" $currentDir
powershell -noprofile -ex unrestricted -file "$currentDir\src\ps1\installApps.ps1" $currentDir
powershell -noprofile -ex unrestricted -file "$currentDir\src\ps1\injectRegistry.ps1" $currentDir

foreach ($item in $json.Mods)
{
    foreach ($ps1 in $item.powershell){
      $ps1
      powershell -noprofile -ex unrestricted -file "$currentDir\mod\$ps1" $currentDir
    }
}
