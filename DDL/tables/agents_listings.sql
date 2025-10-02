CREATE TABLE agents_listings (
  agent_listing_id BIGSERIAL PRIMARY KEY,
  agent_id    BIGINT NOT NULL
              REFERENCES agents(user_id) ON DELETE RESTRICT,
  listing_id  BIGINT NOT NULL
              REFERENCES listings(listing_id) ON DELETE RESTRICT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at  TIMESTAMPTZ
);