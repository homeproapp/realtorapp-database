CREATE TABLE property_invitations (
  property_invitation_id BIGSERIAL PRIMARY KEY,
  address_line1          TEXT        NOT NULL,
  address_line2          TEXT,
  city                   TEXT        NOT NULL,
  region                 TEXT        NOT NULL,
  postal_code            TEXT        NOT NULL,
  country_code           CHAR(2)     NOT NULL,
  invited_by             BIGINT      NOT NULL
                         REFERENCES agents(agent_id) ON DELETE RESTRICT,
  created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at             TIMESTAMPTZ
);