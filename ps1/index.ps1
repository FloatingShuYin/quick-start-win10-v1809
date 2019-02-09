set-executionpolicy remotesigned -s currentuser -f
# 配置项
$SystemDriveLetter = $env:windir.replace("Windows", "")
$ScoopInstallDir = $SystemDriveLetter + "Support\Scoop"
$ScoopGlobalDir = $SystemDriveLetter + "\Scoop"

# Install Scoop to a Custom Directory
echo '--------------Install Scoop...----------------------'
[environment]::setEnvironmentVariable('SCOOP', $ScoopInstallDir, 'User')
$env:SCOOP = $ScoopInstallDir
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

# Configure Scoop to install global programs to a Custom Directory
[environment]::setEnvironmentVariable('SCOOP_GLOBAL', $ScoopGlobalDir, 'Machine')
$env:SCOOP_GLOBAL = $ScoopGlobalDir
echo '--------------Install Scoop done!--------------------------'

# Multi-connection downloads with aria2
echo '--------------Install sudo 7zip aria2 git...----------------------'
scoop install aria2
scoop install sudo
sudo scoop install 7zip git openssh --global
echo '--------------Install sudo 7zip aria2 git done!----------------------'
[environment]::setenvironmentvariable('GIT_SSH', (resolve-path (scoop which ssh)), 'USER')





