# OmpathStudy Cloudflare migration (staging)

This directory contains the isolated Cloudflare D1/Workers migration scaffold.

## Safety rules
- This is a staging backend. The live React application must continue using its existing backend until migration validation is complete.
- Never copy production secrets into this repository.
- Do not migrate student credentials until the authentication design and source project identity are confirmed.
- Preserve original UUIDs and foreign-key relationships for all user-linked records.
- Do not cache authenticated or user-specific responses.
- Payment unlocks must be driven by verified provider callbacks, not client-submitted success states.

## Current staging resources
- D1 database: `ompathstudy-core-staging`
- D1 database ID: `9f94b967-ea52-450b-bc17-8b45bbc4182b`
- Region hint: Western Europe
- Worker: not deployed
- Production traffic: unchanged

## Migration blocker
The repository's committed `supabase/config.toml` references project `lkgfzjwhmfjvntzphbsh`, while the connected Supabase project inspected during this migration is `strfwaqvxvkhjbqrwmla`. The former project was not accessible through the current connection. Confirm the actual production project and obtain a complete, current export before loading application data.

## Planned phases
1. Confirm production Supabase project and take a verified backup/export.
2. Inventory SQL schema, functions, triggers, RLS policies, Auth, Storage and Edge Functions.
3. Convert the schema and access rules to SQLite/D1 plus Worker-enforced authorization.
4. Implement and test authentication independently.
5. Import data in dependency order and reconcile row counts.
6. Test student, editor, admin, payment and notification flows.
7. Cut over only after acceptance tests pass; retain rollback capability.

## Local development
Use the Wrangler CLI with this directory's `wrangler.toml`. The health endpoint is a staging-only smoke test; it does not expose application data.
