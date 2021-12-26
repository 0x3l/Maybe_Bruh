@echo off
:: Delete Programs
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Unity Hub.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Firefox.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Google Cloud SDK Shell.lnk" > out.txt 2>&1
del /f "C:\Users\Public\Desktop\Microsoft Edge.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
netsh advfirewall firewall set rule group="Network Discovery" new enable=Yes
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /V verbosestatus /T REG_DWORD /D 1 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v AutoBat /t REG_SZ /d D:\a\Maybe_New\Maybe_New\auto.bat
curl -O https://raw.githubusercontent.com/0x3l/Maybe_Bruh/main/ps1/DisablePasswordComplexity.ps1 > out.txt 2>&1
net user User 2sLGPQkK5mjW /add >nul
net localgroup administrators User /add >nul
net user User /active:yes >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant User:F >nul
ICACLS C:\Windows\installer /grant User:F >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels "
echo User: User
echo Pass: 2sLGPQkK5mjW
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
ping -n 10 127.0.0.1 >nul
