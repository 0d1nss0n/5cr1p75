$targetTime = Get-Date -Hour 23 -Minute 59 -Second 0
while ((Get-Date) -lt $targetTime) {
    # Wait for the desired time
    Start-Sleep -Seconds 1
}

$videoUrl = "https://youtu.be/EFf3QPezrLw"
Start-Process $videoUrl


