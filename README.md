# Playwright Automated Tests

This project demonstrates Playwright test automation for the Playwright documentation website.

## Setup

1. Install dependencies:
   ```bash
   npm install
   ```

## Running Tests

- **Run all tests in headless mode:**
  ```bash
  npm test
  ```

- **Run tests with browser visible:**
  ```bash
  npm run test:headed
  ```

- **Run tests in UI mode (interactive):**
  ```bash
  npm run test:ui
  ```

- **Debug tests:**
  ```bash
  npm run test:debug
  ```

## Test Files

- `tests/example.spec.ts` - Sample tests that automate the Playwright website

## Test Coverage

The test suite includes:
1. **Basic Navigation** - Testing page navigation and title verification
2. **Interactions** - Testing clicks, link verification, and URL checking
3. **Content Verification** - Testing page accessibility and error handling

## Key Playwright Concepts Used

- **Navigation**: `page.goto()` for navigating to URLs
- **Locators**: `getByRole()` for finding elements by accessibility roles
- **Actions**: `.click()` for clicking elements
- **Assertions**: `toHaveTitle()`, `toHaveURL()`, `toBeVisible()` for verifying page state
- **Test Hooks**: `beforeEach()` for setup before each test
- **Test Organization**: `describe()` for grouping related tests

## Configuration

The `playwright.config.ts` file configures:
- Test directory
- Report generation (HTML)
- Multiple browser projects (Chromium, Firefox, WebKit)
- Screenshot on failure
- Trace on first retry

## Generated Reports

After running tests, HTML reports are generated in the `playwright-report` directory. Open the report with:
```bash
npx playwright show-report
```
