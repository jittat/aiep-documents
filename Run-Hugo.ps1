# --------------------------
# Run Hugo server with LAN access
# --------------------------

# ตั้งค่าพอร์ตและชื่อ rule
$Port = 1313
$RuleName = "Allow Hugo $Port"

# ตรวจว่ามี Firewall rule นี้อยู่แล้วหรือไม่
$ruleExists = Get-NetFirewallRule -DisplayName $RuleName -ErrorAction SilentlyContinue

if (-not $ruleExists) {
    Write-Host "Adding new firewall rule for port $Port..." -ForegroundColor Yellow
    New-NetFirewallRule -DisplayName $RuleName -Direction Inbound -Protocol TCP -LocalPort $Port -Action Allow
} else {
    Write-Host "Firewall rule '$RuleName' already exists." -ForegroundColor Green
}

# รัน Hugo server
Write-Host "Starting Hugo server on port $Port..." -ForegroundColor Cyan

# บรรทัดถัดไปไปรันใน WSL2

# hugo server --bind 0.0.0.0 --baseURL http://think:$Port/ --disableFastRender

