# sync-global-commands.ps1
# Syncs synw-* slash commands from syntran-aieos to the global ~/.claude/commands/
# Run this after adding or updating any command in .claude/commands/

$src = Join-Path $PSScriptRoot "..\.claude\commands"
$dst = Join-Path $env:USERPROFILE ".claude\commands"

# Resolve absolute source path
$src = (Resolve-Path $src).Path

# Ensure destination exists
if (-not (Test-Path $dst)) {
    New-Item -ItemType Directory -Force $dst | Out-Null
    Write-Host "[+] Created: $dst" -ForegroundColor Green
}

$copied  = 0
$skipped = 0
$updated = 0

$files = Get-ChildItem (Join-Path $src "synw-*.md") -ErrorAction Stop

foreach ($f in $files) {
    $target = Join-Path $dst $f.Name

    if (-not (Test-Path $target)) {
        Copy-Item $f.FullName -Destination $target -Force
        Write-Host "[+] Added:   $($f.Name)" -ForegroundColor Green
        $copied++
    } else {
        $srcHash = (Get-FileHash $f.FullName -Algorithm MD5).Hash
        $dstHash = (Get-FileHash $target -Algorithm MD5).Hash

        if ($srcHash -ne $dstHash) {
            Copy-Item $f.FullName -Destination $target -Force
            Write-Host "[~] Updated: $($f.Name)" -ForegroundColor Yellow
            $updated++
        } else {
            Write-Host "[ ] Same:    $($f.Name)" -ForegroundColor DarkGray
            $skipped++
        }
    }
}

Write-Host ""
Write-Host "Sync complete - Added: $copied  Updated: $updated  Unchanged: $skipped" -ForegroundColor Cyan
Write-Host "Global commands dir: $dst"
