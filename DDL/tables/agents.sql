CREATE TABLE agents (
  user_id           BIGINT PRIMARY KEY
                    REFERENCES users(user_id) ON DELETE RESTRICT,
  brokerage         TEXT,
  brokerage_team    TEXT,
  team_website      TEXT,
  team_lead         TEXT,
  email_validated   BOOLEAN DEFAULT FALSE,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at        TIMESTAMPTZ
);