# Logging and Monitoring

## What is logged

- login success / failure
- admin disable / enable actions
- admin password resets
- simulated transaction creation

## Where logs are written

- Config keys:
  - `LOG_DIR`
  - `LOG_FILE`
- Default file:
  - `backend/logs/noobtrade.log`

## Monitoring evidence

- Recent log lines are exposed to admins through the `Platform Analytics` page
- Backend route:
  - `/api/admin/recent-logs`

## Classroom limitation

- This project does not use a hosted monitoring stack
- Instead, it shows a minimal classroom-ready logging pipeline and recent log inspection flow
