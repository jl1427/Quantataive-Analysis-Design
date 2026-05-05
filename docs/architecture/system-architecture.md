# System Architecture

```mermaid
flowchart LR
  browser["Vue 3 Frontend"] --> api["Flask Backend"]
  api --> auth["Auth + Admin Services"]
  api --> market["Market Data Service"]
  api --> tx["Transaction Service"]
  api --> persistence["Persistence Service"]
  persistence --> db["PostgreSQL"]
  market --> duke["Duke Market Data API"]
```

## Notes

- The frontend handles presentation and user interaction.
- The backend owns authentication, admin control, transaction logging, analytics, and quant processing.
- PostgreSQL is the formal classroom persistence layer.
- SQLite remains a fallback only for emergency local testing.
