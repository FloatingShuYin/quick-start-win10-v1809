param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json
$RealsWavePath = "$currentDir\mod\aboutRainmeter\Real'sWave"
$rianmeterSkinPath = "$env:USERPROFILE\Documents\Rainmeter\Skins"
$font = "$rianmeterSkinPath\Real'sWave\honey-and-death_lightning-volt\LIGHRG__.TTF"

Copy-Item $RealsWavePath $rianmeterSkinPath -recurse
start $font

