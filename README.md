# Telfair Booking

This repository contains a Playwright automation that signs in, navigates to the reservation calendar, and attempts to book an available court slot.

## What It Does

- Runs daily via GitHub Actions.
- Uses `America/Chicago` 7:00 AM scheduling (CST/CDT-safe).
- Attempts booking within the configured day window (default day `+7`).
- Tries preferred times from `6:00 PM` onward.
- Confirms a booking only if the slot is no longer empty after reserve action.

## Recipient Setup (Share This)

1. Fork or copy this repository.
2. In repo `Settings` -> `Secrets and variables` -> `Actions`, add:
   - `BOOKING_USER_ID`
   - `BOOKING_PASSWORD`
3. Optional repo variables (same page, `Variables` tab):
   - `BOOKING_DAY_OFFSET_START` (default `7`)
   - `BOOKING_DAY_OFFSET_END` (default `7`)
4. Open `Actions` -> `Daily Booking` -> `Run workflow` once to verify.

## Change User ID or Password Anytime

Do not edit code. Update GitHub repository secrets:

1. Go to `Settings` -> `Secrets and variables` -> `Actions`.
2. Edit `BOOKING_USER_ID` and/or `BOOKING_PASSWORD`.
3. Next scheduled run uses the new values automatically.

## Scheduling

Workflow file: `.github/workflows/booking.yml`

- Runs in a narrow 6:55-7:05 AM Chicago window on weekdays (GitHub's 5-minute schedule granularity).
- Pre-warms before 7:00 and waits until exactly 7:00:00 local time before booking attempt.
- Uses UTC cron entries plus a Chicago-time gate to handle CST/CDT changes.

## Run Locally (Optional)

```bash
npm ci
npx playwright install chromium
BOOKING_USER_ID="your_id" BOOKING_PASSWORD="your_password" npx playwright test tests/example.spec.ts --project=chromium --grep "@booking"
```

## Artifacts and Logs

Each GitHub run uploads:

- `playwright-report/`
- `test-results/`
- screenshots (`*.png`)

Use these artifacts to inspect why a reservation did or did not complete.
