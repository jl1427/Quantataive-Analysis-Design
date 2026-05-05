# VCM GitHub Secrets Template

Use these repository secrets in GitHub Actions for `.github/workflows/deploy-vcm.yml`.

## Required

- `VCM_HOST`
  - Example: `vcm-53245.vm.duke.edu`
- `VCM_USER`
  - Example: `vcm`
- `VCM_SSH_PRIVATE_KEY`
  - Paste the full private key generated for GitHub Actions deploy
- `VCM_APP_DIR`
  - Example: `/home/vcm/stock_pattern_project`
- `VCM_POSTGRES_DB`
  - Example: `stock_pattern_project`
- `VCM_POSTGRES_USER`
  - Example: `noobtrade`
- `VCM_POSTGRES_PASSWORD`
  - Example: a strong classroom-only password
- `VCM_DATABASE_URL`
  - Example: `postgresql+psycopg://noobtrade:YOUR_PASSWORD@db:5432/stock_pattern_project`
- `JWT_SECRET_KEY`
  - Example: a long random secret string

## Recommended

- `VCM_APP_ENV`
  - Example: `development`
- `VCM_CORS_ORIGINS`
  - Example: `http://localhost:5000,http://127.0.0.1:5000`
- `VCM_USE_MOCK_FALLBACK`
  - Example: `false`
- `VCM_ALLOW_LOCAL_EMAIL_BYPASS`
  - Example: `true`
- `VCM_REQUIRE_EMAIL_VERIFICATION`
  - Example: `false`
- `VCM_AUTH_COOKIE_SECURE`
  - Example: `false`
- `MARKET_DATA_BASE_URL`
  - Example: `https://marketdata.colab.duke.edu/api/v1`
- `MARKET_DATA_TOKEN`
  - Example: your Duke market data token
- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`
- `SMTP_USE_TLS`
- `SMTP_USE_SSL`
- `EMAIL_FROM`

## VCM authorized_keys

Add this public key to `/home/vcm/.ssh/authorized_keys` on the VCM:

```text
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMeWNs/E5iRyElztMfJ5YBMB34Jq57OlYI9RPxr4UUMy github-actions-vcm
```
