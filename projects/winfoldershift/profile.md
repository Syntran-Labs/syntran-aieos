# Project: WinFolderShift

## Purpose

Securely relocate Windows user shell folders (Downloads, Documents) from the C drive to a secondary drive, using Windows Shell Folder Redirection via registry keys.

---

## Status

Active — Implementation phase

---

## Stack

- Language: PowerShell 5.1
- Target OS: Windows 10/11 Home
- Elevation: Required (registry write + file move)
- Dependencies: Robocopy (built-in), Windows Shell COM APIs

---

## Architecture

**Approach:** Windows Shell Folder Redirection via registry keys under `HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders`

**Folders targeted:**

| Shell Folder | GUID | Source | Target |
|---|---|---|---|
| Downloads | `{374DE290-123F-4565-9164-39C4925E467B}` | `C:\Users\<username>\Downloads` | `<target_drive>:\Users\<username>\Downloads` |
| Documents | `{FDD39AD0-238F-46AF-ADB4-6C85480369C7}` | `C:\Users\<username>\Documents` | `<target_drive>:\Users\<username>\Documents` |

---

## Script Architecture

| Script | Purpose |
|---|---|
| `Move-UserFolders.ps1` | Main script — pre-flight, backup, move, redirect, validate |
| `Restore-UserFolders.ps1` | Rollback script — restores registry and optionally moves files back |
| `Test-FolderRedirect.ps1` | Validation-only — confirms Windows resolves folders correctly |

---

## Execution Phases

1. **Pre-flight** — Verify target drive exists, check free space, detect locked files, check OneDrive sync state
2. **Backup** — Export current registry keys to `<target_drive>:\WinFolderShift\backup\`
3. **Create targets** — Create target directories with correct ACLs
4. **Move files** — Robocopy `/MOVE /E /COPYALL /R:3 /W:5 /LOG`
5. **Redirect** — Write new paths to User Shell Folders registry keys
6. **Validate** — Resolve shell folder paths and confirm they point to target drive
7. **Report** — Write `move_report.txt` with summary, errors, and rollback instructions

---

## Safety Rules

- Script MUST be run as Administrator
- Script MUST abort if target drive is not detected
- Script MUST abort if free space on target < size of folders being moved
- Script MUST back up registry before any write
- Script MUST NOT delete source files until Robocopy reports 0 errors
- Rollback script MUST work independently (no dependency on main script state)
- Script is idempotent — safe to run multiple times

---

## Agents / Skills

| Phase | Agent | Skill |
|---|---|---|
| Design | Architect | — |
| Implementation | Python Engineer (PowerShell) | Develop |
| Review | Security Reviewer | Review |

---

## Constraints

- Windows 10/11 only (no cross-platform)
- Single user scope (`$env:USERNAME`)
- Must not touch OneDrive cloud-only files
- Must warn (not abort) if non-critical files are locked
- Must produce a human-readable report on completion

---

## Next Steps

- [ ] Implement `Move-UserFolders.ps1`
- [ ] Implement `Restore-UserFolders.ps1`
- [ ] Implement `Test-FolderRedirect.ps1`
- [ ] Security review before first run
- [ ] Test on a non-critical folder first (e.g. a test subfolder)
