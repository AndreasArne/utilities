@echo
cls
timeout 10 >nul
taskkill /IM hid.exe /T /F
taskkill /IM Gaming.exe /T /F
@REM taskkill /IM CC_Engine_x64.exe /T /F
taskkill /IM LEDKeeper2.exe /T /F
taskkill /IM MSIAfterburner.exe /T /F

wsl --shutdown