param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json
$woxThemePath = $json.ScoopInstallDir + "\apps\wox\current\Themes"
$WoxAlfredThemePath = $json.tempDir + "\WoxAlfredTheme"

if (-not (Test-Path $WoxAlfredThemePath) ) {
 mkdir -p $WoxAlfredThemePath
}
echo $WoxAlfredThemePath
git clone https://github.com/waterzhang0423/WoxAlfredTheme.git $WoxAlfredThemePath

Copy-Item $WoxAlfredThemePath\*.xaml $woxThemePath
