Extends [common/performance.md](../common/performance.md).

# Web Performance

## Core Web Vitals

| Metric | Target |
|--------|--------|
| LCP | < 2.5s |
| INP | < 200ms |
| CLS | < 0.1 |
| FCP | < 1.5s |
| TBT | < 200ms |

## Bundle Budget

| Page | JS (gzip) | CSS |
|------|-----------|-----|
| Landing | < 150kb | < 30kb |
| App | < 300kb | < 50kb |
| Microsite | < 80kb | < 15kb |

## Loading

1. Inline critical above-fold CSS
2. Preload hero image + primary font only
3. Defer non-critical CSS/JS
4. Dynamic import heavy libs:

```js
const gsapModule = await import('gsap');
const { ScrollTrigger } = await import('gsap/ScrollTrigger');
```

## Images

- Explicit `width`/`height` always
- Hero only: `loading="eager"` + `fetchpriority="high"`
- Below fold: `loading="lazy"`
- AVIF/WebP with fallbacks
- Never ship images far beyond rendered size

## Fonts

- Max 2 families
- `font-display: swap`
- Subset where possible
- Preload only critical weight/style

## Animation

- Compositor-friendly properties only
- `will-change` narrowly, remove when done
- CSS for simple transitions
- `requestAnimationFrame` or animation libs for JS motion
- IntersectionObserver over scroll handlers

## Checklist

- [ ] All images have explicit dimensions
- [ ] No render-blocking resources
- [ ] No layout shifts from dynamic content
- [ ] Motion on compositor-friendly properties only
- [ ] Third-party scripts async/defer, loaded only when needed
