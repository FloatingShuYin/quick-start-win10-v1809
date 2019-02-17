param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

Write-Host "inject into the registry" -Foreground "Cyan"
foreach ($item in $json.RegistryAndBat)
{
  $path = $currentDir + "assert\reg\" + $item
  start $path
}


