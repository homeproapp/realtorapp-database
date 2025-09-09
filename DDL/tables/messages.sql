CREATE TABLE messages (
  message_id       BIGSERIAL PRIMARY KEY,
  conversation_id  BIGINT NOT NULL
                   REFERENCES conversations(conversation_id) ON DELETE RESTRICT,
  sender_id        BIGINT NOT NULL
                   REFERENCES users(user_id) ON DELETE RESTRICT,
  message_text     TEXT NOT NULL,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at       TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at       TIMESTAMPTZ NULL
);

CREATE INDEX ix_messages_conversation_created
  ON messages (conversation_id, created_at);