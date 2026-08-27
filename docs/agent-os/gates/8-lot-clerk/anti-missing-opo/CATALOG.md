# Risk log (Lot Clerk gold)

Learned-only. Disposition assigned after the Observable Product Outcome exists.

## Risks

### unknown
Risk: Missing expiry coerced to a date
Threatens-OPO: yes
Disposition: builder-retired
Why-this-treatment: Only canonical lot rows can preserve empty expiry as unknown.
Product-delta: Observed expiry may be empty; unknown is preserved as a required product truth.

### identity
Risk: Lot identity unstable across rows
Threatens-OPO: yes
Disposition: builder-retired
Why-this-treatment: The expiry list is false if two rows collapse or split illegally.
Product-delta: Stable lot_id grain so the clerk names the same lot as the same lot.

### layout
Risk: CSV layout drift / missing columns
Threatens-OPO: yes
Disposition: gate-retired
Why-this-treatment: A fixture probe on sample files falsifies the lie; no ingest platform.

### week
Risk: Week-boundary / timezone of "this week"
Threatens-OPO: yes
Disposition: gate-retired
Why-this-treatment: Frozen week definition plus a probe; not a calendar platform.

### use
Risk: Clerk may not drop the file weekly
Threatens-OPO: yes
Disposition: use-retired
Why-this-treatment: Only owner/clerk use can resolve it.

### warehouse
Risk: File is not a warehouse
Threatens-OPO: no
Disposition: research-retired
Why-this-treatment: Evidence: one CSV drop is enough for the accepted MVP.

### sftp
Risk: CSV arrives by SFTP; without a retrying daemon we drop files
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: Accepted input is a manual file drop. Technically real; not on the path.

### scheduler
Risk: Stale file if nobody watches
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: MVP does not exercise unattended pull.

### cache
Risk: Repeat reads are slow
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: One clerk, one file.

### ui
Risk: No React UI
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: Result may be a dated table on stdout; GUI is not required.

### api
Risk: No HTTP transport
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: Accepted input is a local CSV.

### obs
Risk: No observability pipeline
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: MVP does not exercise it.

### sso
Risk: No SSO
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: One local clerk.

### recs
Risk: No reorder recommendations
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: Not the accepted product.

### llm
Risk: No LLM chat
Threatens-OPO: no
Disposition: deferred
Why-this-treatment: Not the accepted product.
