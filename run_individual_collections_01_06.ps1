
Write-Host "Starting Restful Booker API Tests for '01-06 Individual collections'" -ForegroundColor Cyan

# Configuration
$COLLECTION = "RESTful_Booker.Individual_collections_01_06.json"
$REPORT_FILE = "test_reports/report_Individual_collections_01_06.html"

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
