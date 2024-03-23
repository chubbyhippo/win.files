# glazeWM
Copy-Item -Path .\.glaze-wm -Destination $HOME -Recurse -Force

# .ideavimrc
Copy-Item -Path .\.ideavimrc\.ideavimrc -Destination $HOME -Recurse -Force

# intellij settings
Set-Location -Path .\Intellij-settings
& 'C:\Program Files\Git\bin\bash.exe' -c "./install.sh"
Set-Location -Path ..
