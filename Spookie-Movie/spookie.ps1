# Set the target time (11:59 PM)
$targetTime = Get-Date -Hour 23 -Minute 59 -Second 0

# Calculate the time to wait in seconds
$waitTime = ($targetTime - (Get-Date)).TotalSeconds

# Wait until the target time
Start-Sleep -Seconds $waitTime

# Set the volume to 50%
$k=[Math]::Ceiling(100/2);$o=New-Object -ComObject WScript.Shell;for($i = 0;$i -lt $k;$i++){$o.SendKeys([char] 175)}

# Start Chrome in fullscreen
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$chromeArgs = "--start-fullscreen https://pluto.tv/en/on-demand/movies/61e9f621afe81f001a25b4d2"
Start-Process -FilePath $chromePath -ArgumentList $chromeArgs
