param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

foreach ($item in $json.Buckets)
{
    scoop bucket add $item
    Write-Host "add $item bucket Done!" -Foreground "Cyan"
}
