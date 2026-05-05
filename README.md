# Noob Trade Classroom Submission

## Project Overview

Noob Trade is a classroom financial web application for stock pattern analysis, simulated trading decisions, portfolio bookkeeping, transaction review, reporting, and admin control.

This repository is the classroom version designed to align clearly with the course rubric.

## Tech Stack

- Frontend: Vue 3 + Vite
- Backend: Flask
- Database: PostgreSQL (formal classroom database)
- Fallback database: SQLite (fallback only, not the primary classroom path)
- Container runtime: Docker Compose
- CI/CD: GitHub Actions
- Security scanning: Semgrep workflow

## Features Mapped to Rubric

| Rubric Item | Implemented? | Evidence |
| --- | --- | --- |
| Home page for unauthenticated users | Yes | `frontend/src/App.vue` Home page |
| New user registration | Yes | `frontend/src/App.vue`, `/api/auth/register` |
| User authentication | Yes | `frontend/src/App.vue`, `/api/auth/login`, `/api/auth/logout`, `/api/auth/me` |
| Authenticated dashboard | Yes | `Dashboard` page in `frontend/src/App.vue` |
| Analysis page | Yes | `Trade` page with stock analysis, charts, indicators |
| Analysis page - current data | Yes | `Trade` page + `/api/stock/<symbol>` |
| Buy/sell support (simulated) | Partial | Portfolio bookkeeping + persisted simulated transaction events via `/api/transactions` |
| Transaction history | Yes | `Transaction History` page + `/api/transactions/history` |
| Reporting functionality | Yes | `Reports` page + `/api/reports/summary` |
| Data integration | Yes | Duke market API + persisted database records |
| Charting | Yes | Dashboard, portfolio, trade charts, analytics charts |
| Admin view all users | Yes | `Admin Users` page + `/api/auth/users` |
| Admin disable user | Yes | `Admin Users` page + `/api/auth/users/<id>/status` |
| Admin reset password | Yes | `Admin Users` page + `/api/auth/users/<id>/password` |
| Admin view system transactions | Yes | `System Transactions` page + `/api/admin/system-transactions` |
| Admin cross-account analysis | Yes | `Platform Analytics` page + `/api/admin/platform-analytics` |
| Docker Compose | Yes | `docker-compose.yml` |
| PostgreSQL persistence | Yes | `docker-compose.yml`, `backend/db/init.sql`, `backend/db/MIGRATIONS.md` |
| Logging and monitoring evidence | Yes | `docs/logging-monitoring.md`, `/api/admin/recent-logs` |
| CI/CD build | Yes | `.github/workflows/build.yml` |
| CI/CD tests | Yes | `.github/workflows/tests.yml` |
| SAST / semgrep | Yes | `.github/workflows/semgrep.yml`, `.semgrep.yml`, `docs/security/semgrep-report.md` |
| Automatic deploy to VCM | Yes | `.github/workflows/deploy-vcm.yml`, `scripts/deploy_vcm.sh`, `docs/architecture/deployment-architecture.md` |
| Security analysis docs | Yes | `docs/security/dfd-threat-model.md`, `docs/security/zap-report.md` |
| System architecture docs | Yes | `docs/architecture/system-architecture.md`, `docs/architecture/erd.md`, `docs/architecture/deployment-architecture.md` |

## Running Locally

### Recommended classroom path

```bash
docker compose up --build
```

After startup:

- App: [http://localhost:5000](http://localhost:5000)
- PostgreSQL: `localhost:5432`

### Manual local path

Frontend:

```bash
cd frontend
npm install
npm run dev
```

Backend:

```bash
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
```

## Docker / Docker Compose

Compose file:

- [docker-compose.yml](/Users/samuel/Documents/stock_pattern_project/docker-compose.yml)

Services:

- `app`
- `db`

The PostgreSQL container initializes from:

- [backend/db/init.sql](/Users/samuel/Documents/stock_pattern_project/backend/db/init.sql)

## Database Setup

Formal classroom database:

- PostgreSQL

Schema and migration evidence:

- [backend/db/init.sql](/Users/samuel/Documents/stock_pattern_project/backend/db/init.sql)
- [backend/db/MIGRATIONS.md](/Users/samuel/Documents/stock_pattern_project/backend/db/MIGRATIONS.md)

The application stores:

- users
- auth state
- analysis runs
- pattern matches
- historical market data
- simulated transaction events

SQLite is kept only as a fallback and should not be presented as the primary classroom deployment path.

## Admin Credentials

Classroom demo admin accounts are configured in backend config defaults:

- `zzzzhly@126.com`
- `690991780@qq.com`

These can be overridden by environment variables for other environments.

## CI/CD

GitHub Actions workflows:

- [build.yml](/Users/samuel/Documents/stock_pattern_project/.github/workflows/build.yml)
- [tests.yml](/Users/samuel/Documents/stock_pattern_project/.github/workflows/tests.yml)
- [semgrep.yml](/Users/samuel/Documents/stock_pattern_project/.github/workflows/semgrep.yml)
- [deploy-vcm.yml](/Users/samuel/Documents/stock_pattern_project/.github/workflows/deploy-vcm.yml)

Current CI evidence covers:

- frontend build
- backend syntax checks
- backend unit tests
- semgrep scan
- automatic deploy to VCM on push to `main`

## VCM Automatic Deployment

The classroom deployment workflow is:

- push to `main`
- GitHub Actions runs:
  - build
  - tests
  - semgrep
  - deploy to VCM

Deployment files:

- [deploy-vcm.yml](/Users/samuel/Documents/stock_pattern_project/.github/workflows/deploy-vcm.yml)
- [deploy_vcm.sh](/Users/samuel/Documents/stock_pattern_project/scripts/deploy_vcm.sh)

Required GitHub secrets:

- `VCM_HOST`
- `VCM_USER`
- `VCM_SSH_PRIVATE_KEY`
- `VCM_APP_DIR`
- `VCM_DATABASE_URL`
- `VCM_POSTGRES_DB`
- `VCM_POSTGRES_USER`
- `VCM_POSTGRES_PASSWORD`
- `JWT_SECRET_KEY`

Optional but recommended secrets:

- `MARKET_DATA_TOKEN`
- `MARKET_DATA_BASE_URL`
- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_USERNAME`
- `SMTP_PASSWORD`
- `SMTP_USE_TLS`
- `SMTP_USE_SSL`
- `EMAIL_FROM`
- `VCM_CORS_ORIGINS`
- `VCM_USE_MOCK_FALLBACK`
- `VCM_ALLOW_LOCAL_EMAIL_BYPASS`
- `VCM_REQUIRE_EMAIL_VERIFICATION`
- `VCM_AUTH_COOKIE_SECURE`

## Security Analysis Artifacts

- [docs/security/dfd-threat-model.md](/Users/samuel/Documents/stock_pattern_project/docs/security/dfd-threat-model.md)
- [docs/security/semgrep-report.md](/Users/samuel/Documents/stock_pattern_project/docs/security/semgrep-report.md)
- [docs/security/zap-report.md](/Users/samuel/Documents/stock_pattern_project/docs/security/zap-report.md)

## Architecture Documents

- [docs/architecture/system-architecture.md](/Users/samuel/Documents/stock_pattern_project/docs/architecture/system-architecture.md)
- [docs/architecture/erd.md](/Users/samuel/Documents/stock_pattern_project/docs/architecture/erd.md)
- [docs/architecture/deployment-architecture.md](/Users/samuel/Documents/stock_pattern_project/docs/architecture/deployment-architecture.md)

## Logging / Monitoring Evidence

- [docs/logging-monitoring.md](/Users/samuel/Documents/stock_pattern_project/docs/logging-monitoring.md)
- backend log file path configured through `LOG_FILE`
- admin recent log viewer on `Platform Analytics`

## Known Limitations

- Portfolio holdings are still primarily maintained in the frontend state; the classroom transaction ledger is persisted and admin-visible
- Docker validation could not be executed on this machine if Docker CLI is unavailable
- ZAP documentation is included, but a full automated ZAP pipeline is not yet wired
- OAuth2 is not implemented
