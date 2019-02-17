Write-Host "install node" -Foreground "Cyan"
nvm install 8.11.4 | Out-String -Stream
nvm use 8.11.4 | Out-String -Stream
sleep -mill 1000
node -v | Out-String -Stream
npm -v | Out-String -Stream
npm i yarn -g | Out-String -Stream
sudo Start-Process -FilePath "cmd.exe" -ArgumentList "/k","yarn global add windows-build-tools"
Write-Host "install node Done!" -Foreground "Cyan"
