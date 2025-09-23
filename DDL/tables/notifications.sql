CREATE TABLE notifications (
  notification_id       BIGSERIAL PRIMARY KEY,
  user_id               BIGINT NOT NULL
                        REFERENCES users(user_id) ON DELETE RESTRICT,
  is_read               BOOLEAN DEFAULT FALSE,
  notification_text     TEXT,
  notification_type     SMALLINT,
  referencing_object_id BIGINT,
  created_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at            TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at            TIMESTAMPTZ NULL
);