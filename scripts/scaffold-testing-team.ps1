# SyntranAI Testing Team Pack - optional scaffold helper
# Run this from the extracted pack root.
# It copies testing team files into a target SYNTRAN AIEOS folder.

param(
    [Parameter(Mandatory=$true)]
    [string]$TargetRoot
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $TargetRoot)) {
    throw "TargetRoot does not exist: $TargetRoot"
}

$folders = @("agents", "skills", "domains", "governance", "templates", "commands")

foreach ($folder in $folders) {
    if (Test-Path ".\$folder") {
        Copy-Item -Path ".\$folder" -Destination $TargetRoot -Recurse -Force
        Write-Host "Copied $folder to $TargetRoot"
    }
}

Write-Host "Testing team pack copied. Review changed files before committing."
