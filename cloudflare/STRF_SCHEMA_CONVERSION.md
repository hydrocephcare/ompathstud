# STRF Supabase → Cloudflare D1 schema conversion

- Source project: `strfwaqvxvkhjbqrwmla`
- Source tables inspected: 113
- Public-to-public foreign key constraints retained: 72
- Generated PostgreSQL columns omitted for SQLite regeneration: 1
- PostgreSQL arrays and JSONB are represented as JSON text; timestamps/UUIDs/enums as TEXT; booleans as INTEGER.
- PostgreSQL-specific defaults (including `auth.uid()` and `gen_random_uuid()`) are deliberately omitted for application-layer handling.
- Auth-owned foreign keys are not declared as SQLite FKs because Supabase Auth is being replaced separately; IDs remain TEXT and must be preserved.
- RLS is not portable to D1. Equivalent authorization must be implemented and tested in Worker routes before any production traffic moves.
- PostgreSQL functions, triggers, policies, generated search vectors, and storage policies require explicit conversion; this schema file is only the relational-table baseline.

**Safety:** staging only. No production writes, imports, DNS changes, or Worker deployment.
