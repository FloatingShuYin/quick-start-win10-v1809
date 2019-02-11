Write-Host "install base env" -Foreground "Cyan"
# Multi-connection downloads with aria2
$job0 = Start-Job -ScriptBlock { scoop install aria2 }
scoop install sudo
Wait-Job $job0
$result0 = Receive-Job $job0
$result0
Remove-Job -Job $job0
$job1 = Start-Job -ScriptBlock { sudo scoop install 7zip --global }
Wait-Job $job1
$result1 = Receive-Job $job1
$result
Remove-Job -Job $job1
Get-Job
# install git
sudo scoop install git --global
Write-Host "install base env Done!" -Foreground "Cyan"
