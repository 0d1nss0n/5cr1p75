$targetTime = Get-Date -Hour 15 -Minute 57 -Second 0
while ((Get-Date) -lt $targetTime) {
    # Wait for the desired time
    Start-Sleep -Seconds 1
}

$videoUrl = "https://youtu.be/EFf3QPezrLw"
Start-Process $videoUrl


