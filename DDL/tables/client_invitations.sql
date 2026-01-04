CREATE TABLE client_invitations (
  client_invitation_id BIGSERIAL PRIMARY KEY,
  client_email         CITEXT NOT NULL,
  client_first_name    TEXT NOT NULL,
  client_last_name     TEXT NOT NULL,
  client_phone         TEXT,
  invitation_token     UUID        NOT NULL UNIQUE DEFAULT gen_random_uuid(),
  invited_by           BIGINT      NOT NULL
                       REFERENCES agents(user_id) ON DELETE RESTRICT,
  expires_at           TIMESTAMPTZ NOT NULL,
  accepted_at          TIMESTAMPTZ,
  created_user_id      BIGINT
                       REFERENCES clients(user_id) ON DELETE RESTRICT,
  created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at           TIMESTAMPTZ
);

CREATE UNIQUE INDEX ux_client_invitations_email_active
  ON client_invitations (client_email, invited_by)
  WHERE deleted_at IS NULL AND accepted_at IS NULL;

CREATE INDEX ix_client_invitations_token_active
  ON client_invitations (invitation_token)
  WHERE deleted_at IS NULL AND accepted_at IS NULL;

CREATE INDEX ix_client_invitations_expires_at
  ON client_invitations (expires_at)
  WHERE deleted_at IS NULL AND accepted_at IS NULL;