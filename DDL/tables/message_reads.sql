CREATE TABLE message_reads (
  message_read_id BIGSERIAL PRIMARY KEY,
  message_id      BIGINT NOT NULL
                  REFERENCES messages(message_id) ON DELETE CASCADE,
  reader_id       BIGINT NOT NULL
                  REFERENCES users(user_id) ON DELETE RESTRICT,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);