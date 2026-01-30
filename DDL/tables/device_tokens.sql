CREATE TABLE device_tokens (
  device_token_id  BIGSERIAL PRIMARY KEY,
  user_id          BIGINT NOT NULL
                   REFERENCES users(user_id) ON DELETE RESTRICT,
  token            TEXT NOT NULL,
  device_type      SMALLINT NOT NULL,
  is_enabled       BOOLEAN NOT NULL DEFAULT TRUE,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at       TIMESTAMPTZ
);

CREATE INDEX ix_device_tokens_user_id ON device_tokens(user_id);
