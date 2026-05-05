# Semgrep Report

## How it was run

- GitHub Actions workflow:
  - `.github/workflows/semgrep.yml`
- Config:
  - `.semgrep.yml`

## Scope

- Backend Python files
- Frontend JavaScript/Vue request patterns

## Summary

- This repository uses a lightweight classroom SAST setup rather than a full enterprise policy pack.
- The main goals are:
  - catch unsafe debug defaults
  - flag weak shared-secret fallbacks
  - highlight frontend requests that may need credential review

## Findings posture

- High severity findings: none intentionally accepted at this stage
- Warning/info findings: reviewed manually as part of classroom hardening

## Fixed / mitigated

- JWT auth uses HttpOnly cookies
- Passwords are hashed with bcrypt
- Sensitive admin operations are server-side permission checked
- Login failures and admin actions are logged
