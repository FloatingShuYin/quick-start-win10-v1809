Write-Host "install base env" -Foreground "Cyan"
# Multi-connection downloads with aria2
Start-Job -ScriptBlock { scoop install aria2 }
Start-Job -ScriptBlock { scoop install sudo }
Get-Job | Wait-Job | Receive-Job

sudo scoop install 7zip --global
# install git
sudo scoop install git --global
Write-Host "install base env Done!" -Foreground "Cyan"
