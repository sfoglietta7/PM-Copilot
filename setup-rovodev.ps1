<#
.SYNOPSIS
    PM Copilot - Multi-Platform Setup Script (Windows PowerShell)

.DESCRIPTION
    This script is designed to be run from the PM-Copilot repository.
    It installs PM Copilot (for Rovo Dev or Grok) into the project directory
    where you actually do your work.

.USAGE
    cd \path\to\PM-Copilot
    .\setup-rovodev.ps1
#>

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  PM Copilot - Multi-Platform Setup" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "This script will install PM Copilot into one of your project directories." -ForegroundColor White
Write-Host "Supports Rovo Dev (.rovodev) and Grok (.grok + plugin recommended)." -ForegroundColor White
Write-Host ""

# Get the directory where this script is located
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Ask which platform
Write-Host "Which platform are you installing PM Copilot for?" -ForegroundColor Yellow
Write-Host "  1) Rovo Dev (creates .rovodev/)"
Write-Host "  2) Grok (creates .grok/ - plugin in plugins/grok-pm-copilot/ is recommended)"
Write-Host ""
$PlatformChoice = Read-Host "Enter 1 or 2 [default: 2]"
if ([string]::IsNullOrWhiteSpace($PlatformChoice)) { $PlatformChoice = "2" }

if ($PlatformChoice -eq "1") {
    $Platform = "rovodev"
    $SourceDir = Join-Path $ScriptDir ".rovodev"
    $TargetSubdir = ".rovodev"
    Write-Host "Installing for Rovo Dev..." -ForegroundColor Green
} else {
    $Platform = "grok"
    $SourceDir = Join-Path $ScriptDir ".grok"
    $TargetSubdir = ".grok"
    Write-Host "Installing for Grok..." -ForegroundColor Green
}

if (-not (Test-Path $SourceDir)) {
    Write-Host "ERROR: Could not find $SourceDir folder next to this script." -ForegroundColor Red
    Write-Host "Please run this script from inside the PM-Copilot repository." -ForegroundColor Red
    exit 1
}

# Ask for target project directory
Write-Host "Please enter the full path to the project directory where you want to use PM Copilot." -ForegroundColor Yellow
Write-Host "Example: C:\code\my-product   or   D:\projects\acme-app" -ForegroundColor Gray
Write-Host ""
$TargetDir = Read-Host "Target project directory"

if (-not (Test-Path $TargetDir)) {
    Write-Host ""
    Write-Host "ERROR: Directory does not exist: $TargetDir" -ForegroundColor Red
    Write-Host "Please create it first or enter a valid path." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Target directory: $TargetDir" -ForegroundColor Green
Write-Host ""

$TargetFolder = Join-Path $TargetDir $TargetSubdir
if (Test-Path $TargetFolder) {
    Write-Host ""
    Write-Host "⚠️  WARNING: A $TargetSubdir folder already exists in the target directory." -ForegroundColor Red
    Write-Host "    Proceeding will PERMANENTLY DELETE the existing configuration" -ForegroundColor Red
    Write-Host "    (including any custom memory, context, or modifications you have made)." -ForegroundColor Red
    Write-Host ""
    $BackupName = "$TargetFolder.backup.$(Get-Date -Format 'yyyyMMdd-HHmmss')"
    Write-Host "    Recommended: Manually back up first:" -ForegroundColor Yellow
    Write-Host "    Copy-Item -Recurse -Force `"$TargetFolder`" `"$BackupName`"" -ForegroundColor Gray
    Write-Host ""
    Write-Host "    To proceed with deletion and overwrite, type the word OVERWRITE and press Enter." -ForegroundColor Yellow
    Write-Host ""
    $Confirm = Read-Host "Type OVERWRITE to continue, or anything else to abort"

    if ($Confirm -ne "OVERWRITE") {
        Write-Host "Aborted. Existing $TargetSubdir was left untouched." -ForegroundColor Gray
        exit 0
    }

    Write-Host "Removing existing $TargetSubdir..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $TargetFolder
}

# Copy configuration
Write-Host "Copying $TargetSubdir configuration into your project..." -ForegroundColor Yellow
Copy-Item -Path $SourceDir -Destination $TargetFolder -Recurse -Force

Write-Host "Done copying $TargetSubdir." -ForegroundColor Green
Write-Host ""

# Change to the target directory
Write-Host "Changing to your project directory..." -ForegroundColor Yellow
Set-Location $TargetDir

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  Running initial memory setup for this project" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Rovo Dev will now analyze this project to build context." -ForegroundColor White
Write-Host "You can also run this manually later with: /memory init" -ForegroundColor Gray
Write-Host ""

# Try to run memory init
try {
    acli rovodev run "/memory init"
} catch {
    Write-Host "Note: 'acli' not found or command failed." -ForegroundColor Gray
    Write-Host "You can run '/memory init' manually after starting Rovo Dev." -ForegroundColor Gray
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  Optional: Install skills globally (user level)" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "You can also make some PM Copilot skills available in ALL your projects" -ForegroundColor White
Write-Host "by copying them to your personal Rovo Dev folder (~/.rovodev)." -ForegroundColor White
Write-Host ""
$CopyUser = Read-Host "Copy skills + subagents to ~/.rovodev for use across all projects? (Y/N)"

if ($CopyUser -match '^[Yy]') {
    $UserSkills = "$HOME\.rovodev\skills"
    $UserSubagents = "$HOME\.rovodev\subagents"

    New-Item -ItemType Directory -Force -Path $UserSkills | Out-Null
    New-Item -ItemType Directory -Force -Path $UserSubagents | Out-Null

    Write-Host "Copying skills to user level..." -ForegroundColor Yellow
    Copy-Item -Path ".rovodev\skills\*" -Destination $UserSkills -Recurse -Force -ErrorAction SilentlyContinue

    Write-Host "Copying subagents to user level..." -ForegroundColor Yellow
    Copy-Item -Path ".rovodev\subagents\*" -Destination $UserSubagents -Recurse -Force -ErrorAction SilentlyContinue

    Write-Host "User-level installation complete." -ForegroundColor Green
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "  Setup Complete!" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host ""
Write-Host "  1. Make sure you are in your project directory:" -ForegroundColor White
Write-Host "     cd $TargetDir" -ForegroundColor Gray
Write-Host ""
if ($Platform -eq "grok") {
    Write-Host "  2. Recommended: Install the Grok plugin from plugins/grok-pm-copilot/" -ForegroundColor White
    Write-Host "     (The .grok folder has already been copied to your project.)" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  3. Start Grok and type:" -ForegroundColor White
    Write-Host "     Run PM Copilot onboarding" -ForegroundColor Gray
} else {
    Write-Host "  2. Start Rovo Dev:" -ForegroundColor White
    Write-Host "     acli rovodev run" -ForegroundColor Gray
    Write-Host ""
    Write-Host "  3. Inside Rovo Dev, type:" -ForegroundColor White
    Write-Host "     Run PM Copilot onboarding" -ForegroundColor Gray
}
Write-Host ""
Write-Host "     Or try: Brief me" -ForegroundColor White
Write-Host ""
Write-Host "You can re-run this setup script anytime from the PM-Copilot repo" -ForegroundColor White
Write-Host "to update another project." -ForegroundColor White
Write-Host ""
Write-Host "================================================================" -ForegroundColor Green