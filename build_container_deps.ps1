
# Install Choco
Invoke-expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$env:path += ";$env:ALLUSERSPROFILE\chocolatey\bin"

# Install dependencies using choco
choco install git vcredist2013 vcredist2012 vcredist2010 -y
