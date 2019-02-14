param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

foreach ($item in $json.RunAtBoot)
{
    $item = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Scoop Apps\$item.lnk"
    Copy-Item $item $env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup
}

