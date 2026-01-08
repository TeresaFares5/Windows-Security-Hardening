function Invoke-SMBHardening {
    param ($Mode)

    Write-Log "Checking SMBv1 status"

    $smb = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

    if ($Mode -eq "Audit") {
        Write-Log "SMBv1 State: $($smb.State)"
    }

    if ($Mode -eq "Enforce" -and $smb.State -ne "Disabled") {
        Write-Log "Disabling SMBv1"
        Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart
    }

    if ($Mode -eq "Rollback") {
        Write-Log "Re-enabling SMBv1"
        Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart
    }
}
