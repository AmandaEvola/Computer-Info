$systemInfo = Get-WmiObject -Class Win32_ComputerSystem
$osInfo = Get-WmiObject -Class Win32_OperatingSystem

$output = @"
System Information:
------------------
Manufacturer: $($systemInfo.Manufacturer)
Model: $($systemInfo.Model)
Operating System: $($osInfo.Caption) $($osInfo.Version)
Total Memory: $([math]::Round($systemInfo.TotalPhysicalMemory / 1MB, 2)) MB
"@

$output | Out-File -FilePath "SystemInfo.txt"
