CREATE TABLE clients_properties (
  client_property_id BIGSERIAL PRIMARY KEY,
  property_id        BIGINT NOT NULL
                     REFERENCES properties(property_id) 
                     ON DELETE RESTRICT,
  client_id          BIGINT NOT NULL
                     REFERENCES clients(user_id)        
                     ON DELETE RESTRICT,
  agent_id           BIGINT NOT NULL
                     REFERENCES agents(user_id)         
                     ON DELETE RESTRICT,
  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at         TIMESTAMPTZ
);

CREATE UNIQUE INDEX ux_cp_active_property_client
  ON clients_properties(property_id, client_id)
  INCLUDE (agent_id)
  WHERE deleted_at IS NULL;

CREATE INDEX ix_cp_agent_active
  ON clients_properties(agent_id)
  INCLUDE (property_id, client_id)
  WHERE deleted_at IS NULL;

CREATE INDEX ix_cp_client_active
  ON clients_properties(client_id)
  INCLUDE (property_id, agent_id)
  WHERE deleted_at IS NULL;

CREATE INDEX ix_cp_property_active
  ON clients_properties(property_id)
  INCLUDE (client_id, agent_id)
  WHERE deleted_at IS NULL;