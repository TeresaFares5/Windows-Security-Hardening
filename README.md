# Windows Security Hardening Toolkit (PowerShell)

## Overview

The Windows Security Hardening Toolkit is a modular PowerShell-based solution designed to **audit, enforce, and partially roll back common Windows security configurations**. It focuses on defensive, enterprise-aligned controls commonly found in corporate environments and security baselines such as CIS and Microsoft security recommendations.

This project is intended for **learning, demonstration, and controlled testing purposes** and is not designed to replace centralized policy management solutions such as Group Policy or MDM.

---

## Key Objectives

- Demonstrate practical Windows security hardening techniques
- Apply security controls in a **safe, auditable, and reversible** manner
- Follow enterprise change-management principles
- Showcase professional PowerShell scripting practices

---

## Features

- Audit-only mode for zero-impact assessment
- Enforcement mode to apply security hardening
- Rollback support for selected controls
- Modular architecture for extensibility
- Detailed timestamped logging
- Clear separation between assessment and enforcement logic

---

## Hardening Controls Implemented

### SMB Protocol Hardening
- Audits SMBv1 status
- Disables SMBv1 to reduce exposure to legacy protocol attacks
- Optional rollback support

### Local Password and Account Lockout Policy
- Enforces minimum password length
- Configures password expiration
- Applies account lockout thresholds
- Applies only to local accounts (domain policies take precedence)

### Windows Defender Configuration
- Ensures real-time protection is enabled
- Enables protection against potentially unwanted applications (PUA)
- Activates controlled folder access where supported

### Audit Policy Configuration
- Enables auditing for successful and failed logon events
- Improves visibility for security monitoring and incident response

---

## Project Structure

```
Windows-Security-Hardening/
│
├── Hardening.ps1
├── README.md
├── logs/
├── backup/
└── modules/
    ├── SMB.ps1
    ├── PasswordPolicy.ps1
    ├── Defender.ps1
    └── AuditPolicy.ps1
```

---

## Execution Modes

The toolkit supports three execution modes:

### Audit Mode
- Reads and reports current security configuration
- Makes **no changes** to the system
- Safe to run on production systems for assessment purposes

```powershell
.\Hardening.ps1 -Mode Audit
```

### Enforce Mode
- Applies defined security hardening settings
- Requires administrative privileges
- Should only be executed on test systems or approved environments

```powershell
.\Hardening.ps1 -Mode Enforce
```

### Rollback Mode
- Attempts to revert selected changes
- Intended for testing and recovery scenarios
- Not all settings are fully reversible

```powershell
.\Hardening.ps1 -Mode Rollback
```

---

## How to Use the Full Script

1. **Open Windows PowerShell as Administrator**
   - Press **Win + S**, type `PowerShell`.
   - Right-click **Windows PowerShell** → **Run as Administrator**.

2. **Navigate to the Script Directory**

```powershell
cd C:\Path\To\Windows-Security-Hardening
```

3. **Allow Script Execution Temporarily**

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

4. **Run the Script in the Desired Mode**

- **Audit mode (safe, no changes)**
```powershell
.\Hardening.ps1 -Mode Audit
```
- **Enforce mode (applies hardening)**
```powershell
.\Hardening.ps1 -Mode Enforce
```
- **Rollback mode (undo changes where possible)**
```powershell
.\Hardening.ps1 -Mode Rollback
```

5. **Check Logs**
   - Logs are generated in the `logs` folder.
   - Review the latest log file to confirm system settings and actions taken.

> Note: Audit Mode is recommended before using Enforce Mode to ensure your environment is compatible.

---

## Logging

- All actions are logged with timestamps
- Logs are stored in the `logs` directory
- Audit output, enforcement actions, and errors are recorded
- Logging supports troubleshooting, auditing, and documentation requirements

---

## Execution Requirements

- Windows 10 or Windows 11
- Administrative privileges
- Windows PowerShell
- Windows Defender available (for Defender-related modules)

---

## Execution Environment Notes

This toolkit **must be executed from Windows PowerShell on a Windows system**.

While development and version control can be performed using:
- VS Code
- WSL
- Remote development environments

Execution from WSL or Linux-based PowerShell is not supported due to Windows security boundaries.

---

## Disclaimer

This project is intended for educational purposes and controlled testing only. The author is not responsible for any damage caused by misuse or execution in unauthorized environments. Always test in isolated environments such as virtual machines or Windows Sandbox.

