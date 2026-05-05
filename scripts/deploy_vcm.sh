#!/usr/bin/env bash

set -euo pipefail

PROJECT_DIR="${1:-$HOME/stock_pattern_project}"
ENV_FILE="${2:-$PROJECT_DIR/.env.vcm}"

echo "[deploy] project dir: $PROJECT_DIR"
echo "[deploy] env file: $ENV_FILE"

cd "$PROJECT_DIR"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "[deploy] missing env file: $ENV_FILE" >&2
  exit 1
fi

if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  echo "[deploy] docker compose detected; building classroom stack"
  docker compose --env-file "$ENV_FILE" up --build -d
  docker compose --env-file "$ENV_FILE" ps
  exit 0
fi

echo "[deploy] docker compose unavailable; falling back to direct runtime"

cd "$PROJECT_DIR/backend"
mkdir -p logs

if [[ ! -d venv ]]; then
  python3 -m venv venv
fi

source venv/bin/activate
pip install -r requirements.txt

cd "$PROJECT_DIR/frontend"
npm ci
npm run build

cd "$PROJECT_DIR/backend"
pkill -f "gunicorn --bind 0.0.0.0:5000 app:app" || true
nohup env $(grep -v '^#' "$ENV_FILE" | xargs) gunicorn --bind 0.0.0.0:5000 app:app \
  > "$PROJECT_DIR/backend/logs/gunicorn.out" 2>&1 &

for attempt in {1..15}; do
  if curl --silent --fail http://127.0.0.1:5000/api/health >/dev/null; then
    echo "[deploy] fallback deployment started with gunicorn"
    exit 0
  fi

  sleep 2
done

echo "[deploy] fallback deployment failed health check" >&2
tail -n 50 "$PROJECT_DIR/backend/logs/gunicorn.out" || true
exit 1
