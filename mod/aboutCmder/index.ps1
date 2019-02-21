param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json
$cmderDir = $json.ScoopInstallDir + "\apps\cmder\current\vendor\conemu-maximus5"
sudo Copy-Item $currentDir\mod\aboutCmder\xml\*.xml $cmderDir
