param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json

Copy-Item $currentDir\mod\aboutGitBash\gitbash\* $env:USERPROFILE
