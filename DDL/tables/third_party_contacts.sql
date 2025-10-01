CREATE TABLE third_party_contacts (
  third_party_contact_id BIGSERIAL PRIMARY KEY,
  agent_id   BIGINT NOT NULL
             REFERENCES agents(agent_id) ON DELETE RESTRICT,
  name       TEXT,
  email      TEXT,
  phone      TEXT,
  trade      TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at TIMESTAMPTZ
);

CREATE INDEX ix_third_party_contacts_agent_id
  ON third_party_contacts(agent_id);