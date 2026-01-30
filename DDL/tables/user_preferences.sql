CREATE TABLE user_preferences (
  user_id                    BIGINT PRIMARY KEY
                             REFERENCES users(user_id) ON DELETE RESTRICT,
  push_notifications_enabled BOOLEAN NOT NULL DEFAULT TRUE,
  created_at                 TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at                 TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at                 TIMESTAMPTZ
);
