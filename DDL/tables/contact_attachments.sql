CREATE TABLE contact_attachments (
  attachment_id          BIGINT PRIMARY KEY
                         REFERENCES attachments(attachment_id) 
                         ON DELETE RESTRICT,
  third_party_contact_id BIGINT NOT NULL
                         REFERENCES third_party_contacts(third_party_contact_id) 
                         ON DELETE RESTRICT,
  created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at             TIMESTAMPTZ
);