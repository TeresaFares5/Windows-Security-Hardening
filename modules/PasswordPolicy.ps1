function Invoke-PasswordPolicy {
    param ($Mode)

    Write-Log "Checking password policies"

    if ($Mode -eq "Audit") {
        net accounts | Out-String | Write-Log
    }

    if ($Mode -eq "Enforce") {
        Write-Log "Applying password policy"
        net accounts `
            /minpwlen:14 `
            /maxpwage:90 `
            /lockoutthreshold:5 `
            /lockoutduration:30 `
            /lockoutwindow:30
    }
}
