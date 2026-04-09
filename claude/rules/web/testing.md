Extends [common/testing.md](../common/testing.md).

# Web Testing

## Priority Order

### 1. Visual Regression
- Screenshot breakpoints: 320, 768, 1024, 1440
- Cover hero, scrollytelling, meaningful states
- Playwright screenshots for visual-heavy work
- Test both themes if applicable

### 2. Accessibility
- Automated a11y checks
- Keyboard navigation
- Reduced-motion behavior
- Color contrast

### 3. Performance
- Lighthouse on meaningful pages
- Meet CWV targets from [performance.md](performance.md)

### 4. Cross-Browser
- Minimum: Chrome, Firefox, Safari
- Test scroll, motion, fallbacks

### 5. Responsive
- Breakpoints: 320, 375, 768, 1024, 1440, 1920
- No overflow
- Touch interactions work

## E2E Shape

```ts
import { test, expect } from '@playwright/test';

test('landing hero loads', async ({ page }) => {
  await page.goto('/');
  await expect(page.locator('h1')).toBeVisible();
});
```

- Deterministic waits, no flaky timeouts

## Unit Tests

- Test utilities, data transforms, custom hooks
- Visual regression > brittle markup assertions for visual components
- Visual regression supplements coverage targets, does not replace them
