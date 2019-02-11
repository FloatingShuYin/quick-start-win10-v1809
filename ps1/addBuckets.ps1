$json = Get-Clipboard | ConvertFrom-Json

foreach ($item in $json.Buckets)
{
    scoop bucket add $item
    Write-Host "add $item bucket Done!" -Foreground "Cyan"
}
