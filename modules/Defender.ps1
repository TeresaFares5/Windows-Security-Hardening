function Invoke-DefenderHardening {
    param ($Mode)

    if ($Mode -eq "Audit") {
        Get-MpPreference | Select-Object DisableRealtimeMonitoring | Write-Log
    }

    if ($Mode -eq "Enforce") {
        Write-Log "Enabling Defender protections"
        Set-MpPreference `
            -DisableRealtimeMonitoring $false `
            -EnableControlledFolderAccess Enabled `
            -PUAProtection Enabled
    }
}
