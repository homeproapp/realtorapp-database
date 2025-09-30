CREATE TABLE properties (
  property_id     BIGSERIAL PRIMARY KEY,
  address_line1   TEXT        NOT NULL,
  address_line2   TEXT,
  city            TEXT        NOT NULL,
  region          TEXT        NOT NULL,         -- province/state
  postal_code     TEXT        NOT NULL,
  country_code    CHAR(2)     NOT NULL,         -- ISO-3166-1 alpha-2 (e.g., 'CA','US')
  latitude        NUMERIC(9,6),
  longitude       NUMERIC(9,6),

  -- Audit
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at      TIMESTAMPTZ
);