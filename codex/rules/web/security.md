Extends [common/security.md](../common/security.md).

# Web Security

## CSP (Nonce-Based)

Always configure production CSP. Use per-request nonce, not `'unsafe-inline'`:

```text
Content-Security-Policy:
  default-src 'self';
  script-src 'self' 'nonce-{RANDOM}' https://cdn.jsdelivr.net;
  style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;
  img-src 'self' data: https:;
  font-src 'self' https://fonts.gstatic.com;
  connect-src 'self' https://*.example.com;
  frame-src 'none';
  object-src 'none';
  base-uri 'self';
```

Adapt origins per project. Do not copy unchanged.

## XSS Prevention

- Never inject unsanitized HTML
- Avoid `innerHTML`/`dangerouslySetInnerHTML` unless sanitized
- Escape dynamic template values
- Use vetted sanitizer only when necessary

## Third-Party Scripts

- Load async
- SRI for CDN-served scripts
- Audit quarterly
- Self-host critical deps when practical

## HTTPS Headers

```text
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
Referrer-Policy: strict-origin-when-cross-origin
Permissions-Policy: camera=(), microphone=(), geolocation=()
```

## Forms

- CSRF on state-changing forms
- Rate limit submissions
- Validate client + server
- Prefer honeypots over heavy CAPTCHA
