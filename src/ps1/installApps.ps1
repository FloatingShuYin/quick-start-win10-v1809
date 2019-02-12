param($currentDir)

$json = (Get-Content -encoding UTF8 $currentDir\temp.json) | ConvertFrom-Json
Write-Host "Install app" -Foreground "Cyan"
foreach ($item in $json.GlobalApps)
{
    $item
    $cmd = [scriptblock]::Create("sudo scoop install $item --global")
    Start-Job -ScriptBlock $cmd
}
foreach ($item in $json.Apps)
{
    $item
    $cmd = [scriptblock]::Create("scoop install $item")
    Start-Job -ScriptBlock $cmd

}
Get-Job | Wait-Job | Receive-Job

