<#
.SYNOPSIS
    PM Copilot - Multi-Platform Setup Script (Windows PowerShell)

.DESCRIPTION
    This script installs PM Copilot configuration into your actual product project.
    It supports both Rovo Dev and Grok (with plugin installation).

.USAGE
    cd \path\to\PM-Copilot
    .\pm-copilot-setup.ps1
#>

Write-Host "================================================================" -ForegroundColor Cyan
Write-Host "  PM Copilot - Multi-Platform Setup" -ForegroundColor Cyan
Write-Host "================================================================" -ForegroundColor Cyan
Write-Host ""

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Platform Selection
Write-Host "Which platform are you installing PM Copilot for?" -ForegroundColor Yellow
Write-Host "  1) Rovo Dev"
Write-Host "  2) Grok (recommended: install the Grok plugin)"
Write-Host ""
$PlatformChoice = Read-Host "Enter 1 or 2 [default: 2]"
if ([string]::IsNullOrWhiteSpace($PlatformChoice)) { $PlatformChoice = "2" }

if ($PlatformChoice -eq "1") {
    $Platform = "rovodev"
    $SourceDir = Join-Path $ScriptDir ".rovodev"
    $TargetSubdir = ".rovodev"
    Write-Host "Installing Rovo Dev configuration..." -ForegroundColor Green
} else {
    $Platform = "grok"
    Write-Host "Grok selected." -ForegroundColor Green

    Write-Host ""
    Write-Host "How would you like to install PM Copilot for Grok?" -ForegroundColor Yellow
    Write-Host "  1) Install as Grok Plugin (Recommended - User level: ~/.grok/plugins/pm-copilot)" 
    Write-Host "  2) Install as Grok Plugin (Project level)"
    Write-Host "  3) Just copy .grok/ folder to project (no plugin)"
    Write-Host ""
    $GrokMethod = Read-Host "Enter 1, 2 or 3 [default: 1]"
    if ([string]::IsNullOrWhiteSpace($GrokMethod)) { $GrokMethod = "1" }

    if ($GrokMethod -eq "1") {
        $InstallGrokPlugin = $true
        $PluginTargetBase = Join-Path $HOME ".grok\plugins"
        $PluginTarget = Join-Path $PluginTargetBase "pm-copilot"
        Write-Host "Will install Grok plugin to: $PluginTarget" -ForegroundColor Green
    } elseif ($GrokMethod -eq "2") {
        $InstallGrokPlugin = $true
        $InstallGrokPluginProject = $true
        Write-Host "Will install Grok plugin inside the target project." -ForegroundColor Green
    } else {
        $SourceDir = Join-Path $ScriptDir ".grok"
        $TargetSubdir = ".grok"
        Write-Host "Installing .grok/ folder only." -ForegroundColor Yellow
    }
}

if (-not (Test-Path $SourceDir)) {
    Write-Host "ERROR: Could not find required source directory next to this script." -ForegroundColor Red
    exit 1
}

# Target Project Directory
Write-Host ""
Write-Host "Enter the full path to your project directory:" -ForegroundColor Yellow
$TargetDir = Read-Host "Project path"

if (-not (Test-Path $TargetDir)) {
    Write-Host "ERROR: Directory does not exist." -ForegroundColor Red
    exit 1
}

# Handle Grok project-level plugin path now that we have $TargetDir
if ($InstallGrokPluginProject) {
    $PluginTarget = Join-Path $TargetDir ".grok\plugins\pm-copilot"
}

# Copy main configuration (.rovodev or .grok)
$TargetFolder = Join-Path $TargetDir $TargetSubdir
if (Test-Path $TargetFolder) {
    Write-Host ""
    Write-Host "WARNING: $TargetSubdir already exists in target." -ForegroundColor Red
    $Confirm = Read-Host "Type OVERWRITE to replace it"
    if ($Confirm -ne "OVERWRITE") {
        Write-Host "Aborted."
        exit 0
    }
    Remove-Item -Recurse -Force $TargetFolder
}

Write-Host "Copying configuration to $TargetFolder..." -ForegroundColor Yellow
Copy-Item -Path $SourceDir -Destination $TargetFolder -Recurse -Force
Write-Host "Done." -ForegroundColor Green

# Install Grok Plugin if requested
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
        Write-Host "Warning: Grok plugin source not found at $PluginSource" -ForegroundColor Yellow
    }
}

# Change directory and final instructions
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
    Write-Host "  Start Grok in your project and run:"
    Write-Host "    Run PM Copilot onboarding"
} else {
    Write-Host "  Start Rovo Dev:"
    Write-Host "    acli rovodev run"
    Write-Host ""
    Write-Host "  Then run:"
    Write-Host "    Run PM Copilot onboarding"
}

Write-Host ""
Write-Host "================================================================" -ForegroundColor Green