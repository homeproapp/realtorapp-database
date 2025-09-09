CREATE TABLE properties (
  property_id     BIGSERIAL PRIMARY KEY,
  external_id     TEXT,                         -- e.g., MLS number
  external_source TEXT,                         -- e.g., 'TREB', 'REBGV'
  title           TEXT,
  property_type   SMALLINT,                     -- e.g., 0=detached,1=semi,2=condo...
  status          SMALLINT,                     -- e.g., 0=draft,1=active,2=closed
  address_line1   TEXT        NOT NULL,
  address_line2   TEXT,
  city            TEXT        NOT NULL,
  region          TEXT        NOT NULL,         -- province/state
  postal_code     TEXT        NOT NULL,
  country_code    CHAR(2)     NOT NULL,         -- ISO-3166-1 alpha-2 (e.g., 'CA','US')
  latitude        NUMERIC(9,6),
  longitude       NUMERIC(9,6),

  -- Property facts (optional)
  bedrooms        SMALLINT,
  bathrooms       SMALLINT,
  square_feet     INTEGER,
  year_built      SMALLINT,

  -- Pricing (optional)
  list_price      NUMERIC(12,2),
  sale_price      NUMERIC(12,2),
  currency_code   CHAR(3),                      -- ISO-4217, e.g., 'CAD','USD'

  -- Timeline (optional)
  listed_at       TIMESTAMPTZ,
  closing_at      TIMESTAMPTZ,

  -- Audit
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at      TIMESTAMPTZ
);