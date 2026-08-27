# Constitution (Lot Clerk gold)

**Version:** 1.0
Status: accepted

## Purpose

A store clerk can trust this week's expiry list.

## Observable Product Outcome

Given a local CSV of inventory lots (`sku`, `lot_id`, expiry date or empty), the store clerk can produce this week's expiry list and receive a dated table in which missing expiry stays missing, under: one clerk, one store, one manual file drop, no inferred dates, no network service.

## Non-goals

- Reorder recommendations
- Multi-store identity
- A network ingest service
