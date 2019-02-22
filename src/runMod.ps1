param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

foreach ($item in $json.Mods)
{
    foreach ($ps1 in $item.powershell){
      $ps1
      Start-Process -FilePath "cmd.exe" -ArgumentList "/k","powershell -noprofile -ex bypass -file "$currentDir\mod\$ps1\index.ps1" $currentDir" 
    }
}
