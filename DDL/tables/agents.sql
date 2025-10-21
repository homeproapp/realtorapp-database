CREATE TABLE agents (
  user_id           BIGINT PRIMARY KEY
                    REFERENCES users(user_id) ON DELETE RESTRICT,
  team_id           REFERENCES teams(team_id) ON DELETE RESTRICT,
  email_validated   BOOLEAN DEFAULT FALSE,
  is_team_lead      BOOLEAN DEFAULT FALSE,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at        TIMESTAMPTZ
);