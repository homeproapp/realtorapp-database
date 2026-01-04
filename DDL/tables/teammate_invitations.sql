CREATE TABLE teammate_invitations (
  teammate_invitation_id BIGSERIAL PRIMARY KEY,
  teammate_email         CITEXT NOT NULL,
  teammate_first_name    TEXT NOT NULL,
  teammate_last_name     TEXT NOT NULL,
  teammate_phone         TEXT,
  teammate_role_type     SMALLINT NOT NULL,     
  invitation_token     UUID        NOT NULL UNIQUE DEFAULT gen_random_uuid(),
  invited_by           BIGINT      NOT NULL
                       REFERENCES agents(user_id) ON DELETE RESTRICT,
  invited_listing_id   BIGINT      NOT NULL
                       REFERENCES listings(listing_id) ON DELETE RESTRICT,
  expires_at           TIMESTAMPTZ NOT NULL,
  accepted_at          TIMESTAMPTZ,
  created_user_id      BIGINT
                       -- FK on user since teammate can be agent or some other role (stager, photographer, etc)
                       REFERENCES users(user_id) ON DELETE RESTRICT, 
  created_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at           TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at           TIMESTAMPTZ
);

CREATE UNIQUE INDEX ux_teammate_invitations_email_active
  ON teammate_invitations (teammate_email, invited_by)
  WHERE deleted_at IS NULL AND accepted_at IS NULL;

CREATE INDEX ix_teammate_invitations_token_active
  ON teammate_invitations (invitation_token)
  WHERE deleted_at IS NULL AND accepted_at IS NULL;

CREATE INDEX ix_teammate_invitations_expires_at
  ON teammate_invitations (expires_at)
  WHERE deleted_at IS NULL AND accepted_at IS NULL;