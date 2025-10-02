CREATE TABLE clients_listings (
  client_listing_id BIGSERIAL PRIMARY KEY,
  client_id   BIGINT NOT NULL
              REFERENCES clients(user_id) ON DELETE RESTRICT,
  listing_id  BIGINT NOT NULL
              REFERENCES listings(listing_id) ON DELETE RESTRICT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at  TIMESTAMPTZ
);