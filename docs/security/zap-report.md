# OWASP ZAP Report

## How it was run

This classroom version documents a baseline ZAP approach:

1. Start the app locally
2. Browse authenticated and unauthenticated routes
3. Use ZAP baseline or passive scan against the local app URL

## Scan focus

- Auth routes
- Admin pages
- Trade / transaction routes
- Reporting and analytics routes

## Severity summary

- High: none documented
- Medium: review headers, cookies, and deployment hardening in production
- Low/Informational:
  - local demo HTTP mode
  - classroom placeholder secrets must be replaced in shared deployments

## Accepted classroom limitations

- Local development often runs without HTTPS
- Some classroom defaults prioritize easy startup over production secrecy

## Fixed / reviewed

- JWT stored in HttpOnly cookie
- Authenticated routes return 401/403 appropriately
- Admin-only routes are permission protected
- Password reset and disable/enable flows are server-side enforced
