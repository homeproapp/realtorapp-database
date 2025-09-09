CREATE TABLE attachments (
  attachment_id  BIGSERIAL PRIMARY KEY,
  message_id     BIGINT NOT NULL
                 REFERENCES messages(message_id) ON DELETE RESTRICT,
  file_id        BIGINT NOT NULL
                 REFERENCES files(file_id) ON DELETE RESTRICT,
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at     TIMESTAMPTZ
);

CREATE INDEX ix_attachments_message_id ON attachments(message_id);