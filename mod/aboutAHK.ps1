param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

Copy-Item $currentDir\assert\ahk\*.ahk $env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup
