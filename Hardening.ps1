param (
    [ValidateSet("Audit","Enforce","Rollback")]
    [string]$Mode = "Audit"
)

$LogFile = "logs\hardening_$(Get-Date -Format 'yyyyMMdd_HHmm').log"

function Write-Log {
    param ($Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - $Message" | Tee-Object -FilePath $LogFile -Append
}

Write-Log "Starting Windows Security Hardening"
Write-Log "Mode: $Mode"

. "$PSScriptRoot\modules\SMB.ps1"
. "$PSScriptRoot\modules\PasswordPolicy.ps1"
. "$PSScriptRoot\modules\Defender.ps1"
. "$PSScriptRoot\modules\AuditPolicy.ps1"

Invoke-SMBHardening -Mode $Mode
Invoke-PasswordPolicy -Mode $Mode
Invoke-DefenderHardening -Mode $Mode
Invoke-AuditPolicy -Mode $Mode

Write-Log "Hardening completed"
