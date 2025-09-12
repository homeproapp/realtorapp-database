CREATE TABLE clients_conversations (
  client_conversation_id BIGSERIAL PRIMARY KEY,
  conversation_id        BIGINT NOT NULL
                         REFERENCES conversations(conversation_id) 
                         ON DELETE RESTRICT,
  client_id              BIGINT NOT NULL
                         REFERENCES clients(user_id)               
                         ON DELETE RESTRICT,
  created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at             TIMESTAMPTZ
);

CREATE INDEX ix_clients_conversations_client_id 
ON clients_conversations(client_id);