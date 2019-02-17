param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

Write-Host "open web page" -Foreground "Cyan"
foreach ($item in $json.OpenWebPages)
{
  start $item
}


