CREATE TABLE conversations (
  listing_id BIGINT PRIMARY KEY
                  REFERENCES listings(listing_id) ON DELETE RESTRICT,
  nickname        TEXT,
  image_id        BIGINT
                  REFERENCES files(file_id) ON DELETE SET NULL,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at      TIMESTAMPTZ
);