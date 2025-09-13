CREATE TABLE conversations_properties (
  client_conversation_id BIGSERIAL PRIMARY KEY,
  conversation_id        BIGINT NOT NULL
                         REFERENCES conversations(conversation_id) 
                         ON DELETE RESTRICT,
  property_id            BIGINT NOT NULL
                         REFERENCES properties(property_id)               
                         ON DELETE RESTRICT,
  created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at             TIMESTAMPTZ
);

CREATE INDEX ix_conversations_properties_property_id 
ON conversations_properties(property_id);

CREATE UNIQUE INDEX ux_conversations_properties_conversation_property_active
  ON conversations_properties(conversation_id, property_id)
  WHERE deleted_at IS NULL;

-- (optional) if you also query by conversation alone
CREATE INDEX ix_conversations_properties_conversation_id
  ON conversations_properties(conversation_id);