<#
.SYNOPSIS
    PM Copilot - Multi-Platform Setup Script (Windows PowerShell)

.DESCRIPTION
    This script installs PM Copilot into your actual product project.
    Supports Rovo Dev and Grok (with optional plugin installation).

.USAGE
    cd \path\to\PM-Copilot
    .\pm-copilot-setup.ps1
#>

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  PM Copilot - Multi-Platform Setup" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# === Platform Selection ===
Write-Host "Which platform are you installing PM Copilot for?" -ForegroundColor Yellow
Write-Host "  1) Rovo Dev"
Write-Host "  2) Grok"
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
    Write-Host "Grok selected." -ForegroundColor Green

    # Always prepare to copy the .grok folder (for AGENTS.md + context)
    $SourceDir = Join-Path $ScriptDir ".grok"
    $TargetSubdir = ".grok"

    Write-Host ""
    Write-Host "Grok Plugin Installation" -ForegroundColor Cyan
    Write-Host "Would you like to also install the official PM Copilot Grok plugin?" -ForegroundColor Yellow
    Write-Host "  1) Yes - User level (recommended: ~/.grok/plugins/pm-copilot)"
    Write-Host "  2) Yes - Project level"
    Write-Host "  3) No - Only copy the .grok/ folder"
    Write-Host ""
    $GrokPluginChoice = Read-Host "Enter 1, 2 or 3 [default: 1]"
    if ([string]::IsNullOrWhiteSpace($GrokPluginChoice)) { $GrokPluginChoice = "1" }

    if ($GrokPluginChoice -eq "1") {
        $PluginTarget = Join-Path $HOME ".grok\plugins\pm-copilot"
        $InstallGrokPlugin = $true
        Write-Host "Will install Grok plugin to user level." -ForegroundColor Green
    } elseif ($GrokPluginChoice -eq "2") {
        $InstallGrokPlugin = $true
        $InstallGrokPluginProject = $true
        Write-Host "Will install Grok plugin at project level (after choosing target directory)." -ForegroundColor Green
    } else {
        Write-Host "Will only copy the .grok/ folder (no plugin)." -ForegroundColor Yellow
    }
}

if (-not (Test-Path $SourceDir)) {
    Write-Host "ERROR: Could not find required source directory next to this script." -ForegroundColor Red
    exit 1
}

# === Target Project Directory ===
Write-Host ""
Write-Host "Enter the full path to your project directory:" -ForegroundColor Yellow
$TargetDir = Read-Host "Project path"

if (-not (Test-Path $TargetDir)) {
    Write-Host "ERROR: Directory does not exist: $TargetDir" -ForegroundColor Red
    exit 1
}

# Set plugin target for project-level if chosen
if ($InstallGrokPluginProject) {
    $PluginTarget = Join-Path $TargetDir ".grok\plugins\pm-copilot"
}

# === Copy main configuration ===
$TargetFolder = Join-Path $TargetDir $TargetSubdir

# Critical safety guard: Never allow deletion of the project root itself
if ($TargetFolder -eq $TargetDir -or [string]::IsNullOrWhiteSpace($TargetSubdir)) {
    Write-Host ""
    Write-Host "CRITICAL SAFETY ABORT:" -ForegroundColor Red
    Write-Host "The script detected an attempt to target the project root directory itself for deletion." -ForegroundColor Red
    Write-Host "This is not allowed and has been blocked to protect your files." -ForegroundColor Red
    Write-Host ""
    Write-Host "TargetDir: $TargetDir" -ForegroundColor Yellow
    Write-Host "TargetSubdir: '$TargetSubdir'" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Please report this as a bug. No files were deleted." -ForegroundColor Green
    exit 1
}

if (Test-Path $TargetFolder) {
    Write-Host ""
    Write-Host "WARNING: $TargetSubdir already exists in the target directory." -ForegroundColor Red
    $Confirm = Read-Host "Type OVERWRITE to replace it"
    if ($Confirm -ne "OVERWRITE") {
        Write-Host "Aborted."
        exit 0
    }
    Remove-Item -Recurse -Force $TargetFolder
}

Write-Host "Copying configuration to $TargetFolder..." -ForegroundColor Yellow
Copy-Item -Path $SourceDir -Destination $TargetFolder -Recurse -Force
Write-Host "Done copying $TargetSubdir." -ForegroundColor Green

# === Install Grok Plugin (if requested) ===
if ($InstallGrokPlugin) {
    $PluginSource = Join-Path $ScriptDir "plugins\grok-pm-copilot"
    if (Test-Path $PluginSource) {
        if (-not (Test-Path $PluginTarget)) {
            New-Item -ItemType Directory -Force -Path $PluginTarget | Out-Null
        }
        Write-Host "Installing Grok plugin to $PluginTarget..." -ForegroundColor Yellow
        Copy-Item -Path "$PluginSource\*" -Destination $PluginTarget -Recurse -Force
        Write-Host "Grok plugin installed successfully!" -ForegroundColor Green
    } else {
        Write-Host "Warning: Could not find Grok plugin source at $PluginSource" -ForegroundColor Yellow
    }
}

# === Final instructions ===
Set-Location $TargetDir

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:"
Write-Host "  cd $TargetDir"
Write-Host ""

if ($Platform -eq "grok") {
    if ($InstallGrokPlugin) {
        Write-Host "  The Grok plugin has been installed."
    }
    Write-Host "  Start Grok in your project directory and type:"
    Write-Host "     Run PM Copilot onboarding"
} else {
    Write-Host "  Start Rovo Dev:"
    Write-Host "     acli rovodev run"
    Write-Host ""
    Write-Host "  Then type:"
    Write-Host "     Run PM Copilot onboarding"
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green
Write-Host ""