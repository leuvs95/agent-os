# Unit ladder (Lot Clerk gold)

**Version:** 1.0
Status: accepted

Ordered by risk on the path to the Observable Product Outcome.

| Id | Risk this unit retires | Contract it exposes | Depends on | Out of scope |
|---|---|---|---|---|
| unknown | Missing expiry coerced to a date | Canonical lot row; empty expiry stays empty | — | Scheduler; API; UI framework |
| identity | Lot identity unstable across rows | Stable lot_id grain | unknown | Fuzzy match; multi-store |
| sftp | CSV arrives by SFTP | retrying ingest daemon | — | — |
