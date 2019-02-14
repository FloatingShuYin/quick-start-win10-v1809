param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

Copy-Item $currentDir\assert\other\gitbash\* $env:USERPROFILE
