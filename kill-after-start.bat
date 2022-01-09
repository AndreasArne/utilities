@echo
cls
timeout 5 >nul
taskkill /IM hid.exe /T /F
taskkill /IM Gaming.exe /T /F
taskkill /IM CC_Engine_x64.exe /T /F
taskkill /IM LEDKeeper2.exe /T /F

wsl --shutdown