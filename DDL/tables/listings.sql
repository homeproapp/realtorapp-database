CREATE TABLE listings (
  listing_id BIGSERIAL PRIMARY KEY,
  property_id        BIGINT NOT NULL
                     REFERENCES properties(property_id) 
                     ON DELETE RESTRICT,
  external_id        TEXT,                         -- e.g., MLS number
  external_source    TEXT,
  title              TEXT,
  property_type      SMALLINT,                     -- e.g., 0=detached,1=semi,2=condo...

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
  closed_at      TIMESTAMPTZ,

  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at         TIMESTAMPTZ
);