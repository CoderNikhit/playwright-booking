#!/bin/zsh
set -euo pipefail

PROJECT_DIR="/Users/nikhitsmacbookairm4/Projects/playwright-project"
LOG_DIR="$PROJECT_DIR/logs"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

mkdir -p "$LOG_DIR"

{
  echo "[$TIMESTAMP] Starting booking automation"
  cd "$PROJECT_DIR"
  PLAYWRIGHT_HTML_OPEN=never npx playwright test tests/example.spec.ts --project=chromium --grep "@booking" --reporter=list --workers=1
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] Booking automation finished"
} >> "$LOG_DIR/booking.log" 2>&1
