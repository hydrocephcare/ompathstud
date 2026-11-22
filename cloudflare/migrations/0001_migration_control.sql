-- Staging-only migration ledger. Contains no student or production data.
CREATE TABLE IF NOT EXISTS migration_runs (
  id TEXT PRIMARY KEY,
  source_project_ref TEXT NOT NULL,
  source_repo_ref TEXT NOT NULL,
  started_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  completed_at TEXT,
  status TEXT NOT NULL CHECK (
    status IN ('planning', 'extracting', 'loading', 'validating', 'complete', 'failed', 'paused')
  ),
  notes TEXT
);

CREATE INDEX IF NOT EXISTS idx_migration_runs_status
  ON migration_runs(status);
