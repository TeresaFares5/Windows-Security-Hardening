function Invoke-AuditPolicy {
    param ($Mode)

    if ($Mode -eq "Audit") {
        auditpol /get /category:* | Out-String | Write-Log
    }

    if ($Mode -eq "Enforce") {
        Write-Log "Enabling logon auditing"
        auditpol /set /subcategory:"Logon" /success:enable /failure:enable
    }
}
