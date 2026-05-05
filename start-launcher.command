#!/bin/zsh
cd "/Users/samuel/Documents/stock_pattern_project"

if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
else
  osascript -e 'display dialog "Python is not installed. Please install Python 3 first." buttons {"OK"} default button "OK"'
  exit 1
fi

"$PYTHON_BIN" -m pip install -r launcher/requirements.txt
"$PYTHON_BIN" launcher/app.py
