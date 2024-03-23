# powershell profile
if (-not (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}
Get-Content -Path .\powershell-profile\Profile.ps1 | Set-Content -Path $PROFILE
# refresh
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# glazeWM
Copy-Item -Path .\.glaze-wm -Destination $HOME -Recurse -Force

# .ideavimrc
Copy-Item -Path .\.ideavimrc\.ideavimrc -Destination $HOME -Recurse -Force

# intellij settings
Set-Location -Path .\Intellij-settings
& 'C:\Program Files\Git\bin\bash.exe' -c "./install.sh"
Set-Location -Path ..

# code settings
Set-Location -Path .\code-settings
.\Copy-Settings-To-Destination.ps1
& 'C:\Program Files\Git\bin\bash.exe' -c "./install.sh"
Set-Location -Path ..
