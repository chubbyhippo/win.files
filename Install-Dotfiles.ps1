# powershell profile
if (-not (Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}
Get-Content -Path .\powershell-profile\Profile.ps1 | Set-Content -Path $PROFILE

# path settings
Set-Location -Path .\path-settings
.\Install-Path.ps1
Set-Location -Path ..

# windows terminal settings
Copy-Item -Path .\windows-terminal-settings\settings.json -Destination "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Recurse -Force

# refresh
$Env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")

# ahk
Copy-Item -Path .\ahk\CapsToChangeInputLanguage.ahk -Destination "$Home\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\CapsToChangeInputLanguage.ahk" -Recurse -Force

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

# .vimrc
Copy-Item -Path .\.vimrc\.vimrc -Destination $HOME -Recurse -Force

# .bashrc
Copy-Item -Path .\.bashrc\.bashrc-for-win -Destination "$HOME\.bashrc" -Recurse -Force

# init.lua
if (-not (Test-Path -Path "$HOME\AppData\Local\nvim\")) {
    New-Item -ItemType Directory -Path "$HOME\AppData\Local\nvim\" -Force
}
Get-Content -Path .\init.lua\init.lua | Set-Content -Path "$HOME\AppData\Local\nvim\init.lua"
