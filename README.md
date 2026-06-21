# Microsoft Word Document Corruption Troubleshooter

Created by **Dewald Pretorius**.

The repository includes the original document and recovery diagnostics plus a guarded `Repair.ps1` helper with `Diagnose`, `ResetOfficeCache`, and `RepairOffice` actions.

```powershell
.\Repair.ps1 -Action Diagnose
.\Repair.ps1 -Action ResetOfficeCache -WhatIf
.\Repair.ps1 -Action RepairOffice -Confirm
```

Close Word before cache repair. Existing Office cache data is preserved as a timestamped backup, and unsaved-file recovery evidence is captured before changes. Microsoft 365 Apps Quick Repair may require elevation. Source-reviewed for Windows PowerShell 5.1; not runtime-tested against every document or Office build.
