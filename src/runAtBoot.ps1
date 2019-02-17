param($currentDir)
$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

foreach ($item in $json.RunAtBoot)
{
    $lnk = $env:APPDATA + "\Microsoft\Windows\Start Menu\Programs\Scoop Apps" + "\$item.lnk"
    $Startup = $env:APPDATA + "\Microsoft\Windows\Start Menu\Programs\Startup"
    Copy-Item $lnk $Startup
}

