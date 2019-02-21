param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

sudo Copy-Item $currentDir\mod\aboutAHK\ahk\*.ahk $env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup
