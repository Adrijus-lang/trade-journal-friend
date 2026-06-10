-- =================================================================
-- Trade Journal — full database schema (no photo feature).
-- Paste this whole file into D1 → trade-journal → Console → Execute.
-- Safe to re-run: CREATE TABLE IF NOT EXISTS and INSERT OR IGNORE
-- mean nothing gets overwritten.
-- =================================================================

-- Daily trades: one row per calendar day
CREATE TABLE IF NOT EXISTS trades (
  date      TEXT PRIMARY KEY,
  profit    TEXT,
  percent   TEXT,
  capital   TEXT,
  rr        TEXT,
  trades    TEXT,
  market    TEXT,
  nBefore   TEXT,
  nEntry    TEXT,
  nClose    TEXT,
  nAfter    TEXT,
  nSummary  TEXT
);

-- Trade-entry rules: 10 fixed slots, admin-editable
CREATE TABLE IF NOT EXISTS rules (
  id          INTEGER PRIMARY KEY,
  text        TEXT DEFAULT '',
  updated_at  INTEGER DEFAULT 0
);

INSERT OR IGNORE INTO rules (id, text, updated_at) VALUES
  (1,'',0),(2,'',0),(3,'',0),(4,'',0),(5,'',0),
  (6,'',0),(7,'',0),(8,'',0),(9,'',0),(10,'',0);

-- Manual "Capital Risked" overrides (created automatically on first use too)
CREATE TABLE IF NOT EXISTS capital_overrides (
  date  TEXT PRIMARY KEY,
  value TEXT NOT NULL
);
