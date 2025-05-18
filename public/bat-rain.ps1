Write-Host "Running Terminal rain"
Invoke-WebRequest "https://terminal-rain.vercel.app/rain.bat" -OutFile "$env:TEMP\rain.bat"
Start-Process "$env:TEMP\rain.bat"
