@echo off
cd /d "%~dp0"

if not exist fonts (
    if exist font.zip (
        echo Extracting font.zip...
        tar -xf font.zip
    ) else if exist fonts.zip (
        echo Extracting fonts.zip...
        tar -xf fonts.zip
    )
)

if exist install_fonts.exe (
    install_fonts.exe %*
) else if exist fonts\install_fonts.exe (
    fonts\install_fonts.exe %*
) else (
    echo Installing fonts via PowerShell fallback...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$fonts = Get-ChildItem -Path .\fonts -Include *.ttf,*.otf -Recurse; $dest = (New-Object -ComObject Shell.Application).Namespace(0x14); foreach ($f in $fonts) { $dest.CopyHere($f.FullName, 16) }; Write-Host 'All fonts installed successfully!'"
)
pause
