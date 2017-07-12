# Determines if Backups are preset, if TRUE delete and rename the current DLLs to .bak and then download the new DLL

# Must set path to where your bin64 folder is located
$ArcDPS = "\Guild Wars 2\bin64\d3d9.dll"
$ArcDPS_Backup = "\Guild Wars 2\bin64\d3d9.dll.bak"

$Success = "ArcDPS has successfully updated"
$Failure = "ArcDPS has failed to update"

# Test-Path and Remove-Item Variables
$TestPath_ArcDPS_Backup = Test-Path $ArcDPS

# Test if D3D9.DLL backup exists. If TRUE, remove backup, create new backup, download new DLL.
If ($TestPath_ArcDPS_Backup -eq $True) {
    Remove-Item -Path $ArcDPS_backup 
    Rename-Item $ArcDPS $ArcDPS_Backup 
    Invoke-WebRequest "http://www.deltaconnected.com/arcdps/x64/d3d9.dll" -OutFile $ArcDPS
    Write-Host $Success
}
# Assums this is a first time installation of ArcDPS with no backup present.
Else { 
        If ($TestPath_ArcDPS_Backup -eq $False) { 
            Invoke-WebRequest "http://www.deltaconnected.com/arcdps/x64/d3d9.dll" -OutFile $ArcDPS
            Write-Host "Successfully installed ArcDPS"
        }
}
