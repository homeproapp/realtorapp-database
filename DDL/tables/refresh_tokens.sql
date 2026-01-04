CREATE TABLE refresh_tokens (
  refresh_token_id  BIGSERIAL PRIMARY KEY,
  user_id           BIGINT NOT NULL
                    REFERENCES users(user_id) ON DELETE CASCADE,
  token_hash        TEXT NOT NULL,
  expires_at        TIMESTAMPTZ NOT NULL,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  revoked_at        TIMESTAMPTZ
);

CREATE INDEX ix_refresh_tokens_user_id
  ON refresh_tokens (user_id);

CREATE INDEX ix_refresh_tokens_token_hash
  ON refresh_tokens (token_hash)
  WHERE revoked_at IS NULL;

CREATE INDEX ix_refresh_tokens_expires_at
  ON refresh_tokens (expires_at);