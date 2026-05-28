# PM-Copilot Grok Plugin Structure Verification

Write-Host "=== PM-Copilot Grok Plugin Verification ===" -ForegroundColor Cyan

$PluginRoot = "plugins\grok-pm-copilot"

$Required = @(
    "$PluginRoot\plugin.json",
    "$PluginRoot\README.md",
    "$PluginRoot\AGENTS.md",
    "$PluginRoot\hooks\hooks.json"
)

$Dirs = @(
    "$PluginRoot\skills",
    "$PluginRoot\personas"
)

$Errors = 0

foreach ($item in $Required) {
    if (Test-Path $item) {
        Write-Host "[OK] $item" -ForegroundColor Green
    } else {
        Write-Host "[MISSING] $item" -ForegroundColor Red
        $Errors++
    }
}

foreach ($dir in $Dirs) {
    if (Test-Path $dir) {
        $count = (Get-ChildItem $dir -Directory -ErrorAction SilentlyContinue).Count
        Write-Host "[OK] Directory $dir ($count items)" -ForegroundColor Green
    } else {
        Write-Host "[MISSING] Directory $dir" -ForegroundColor Red
        $Errors++
    }
}

$SkillCount = (Get-ChildItem "$PluginRoot\skills" -Directory -ErrorAction SilentlyContinue).Count
Write-Host ""
Write-Host "Total skills packaged: $SkillCount" -ForegroundColor Yellow

if ($SkillCount -ge 60) {
    Write-Host "[OK] Strong skill coverage" -ForegroundColor Green
} else {
    Write-Host "[WARN] Skill count lower than expected" -ForegroundColor Yellow
}

$PersonaCount = (Get-ChildItem "$PluginRoot\personas" -File -ErrorAction SilentlyContinue).Count
Write-Host "Personas defined: $PersonaCount" -ForegroundColor Yellow

if ($Errors -eq 0) {
    Write-Host ""
    Write-Host "=== VERIFICATION PASSED ===" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "=== VERIFICATION FAILED ($Errors issues) ===" -ForegroundColor Red
}

Write-Host ""
Write-Host "Note: This is a static structure check. Full behavior must be tested in a live Grok session." -ForegroundColor Gray