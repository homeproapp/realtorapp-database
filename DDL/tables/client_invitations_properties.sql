CREATE TABLE client_invitations_properties (
  client_invitation_property_id BIGSERIAL PRIMARY KEY,
  client_invitation_id          BIGINT      NOT NULL
                                REFERENCES client_invitations(client_invitation_id) ON DELETE RESTRICT,
  property_invitation_id        BIGINT      NOT NULL
                                REFERENCES property_invitations(property_invitation_id) ON DELETE RESTRICT,
  created_at                    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at                    TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at                    TIMESTAMPTZ
);

-- Ensure unique client invitation-property combinations
CREATE UNIQUE INDEX ux_client_invitations_properties_active
  ON client_invitations_properties (client_invitation_id, property_invitation_id)
  WHERE deleted_at IS NULL;