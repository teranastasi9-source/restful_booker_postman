
Write-Host "Starting Restful Booker API Tests for '07_Integration workflows'" -ForegroundColor Cyan

# Configuration
$COLLECTION = "RESTful_Booker.IntegrationWorkflows_07.json"
$REPORT_FILE = "test_reports/report_IntegrationWorkflows_07.html"

# Run with htmlextra
newman run $COLLECTION `
  -r htmlextra `
  --reporter-htmlextra-export $REPORT_FILE `
  --timeout 15000 `
  --delay-request 200

# Open report if it exists
if (Test-Path $REPORT_FILE) {
    Write-Host "Report saved to: $REPORT_FILE" -ForegroundColor Green
    Start-Process $REPORT_FILE
} else {
    Write-Host "Warning: Report file was not created" -ForegroundColor Yellow
}