CREATE TABLE listings (
  listing_id BIGSERIAL PRIMARY KEY,
  property_id        BIGINT NOT NULL
                     REFERENCES properties(property_id) 
                     ON DELETE RESTRICT,
  external_id        TEXT, -- MLS or similar
  external_source    TEXT,
  title              TEXT,
  property_type      SMALLINT, 

  bedrooms        SMALLINT,
  bathrooms       SMALLINT,
  square_feet     INTEGER,
  year_built      SMALLINT,

  list_price      NUMERIC(12,2),
  sale_price      NUMERIC(12,2),
  currency_code   CHAR(3),

  listed_at       TIMESTAMPTZ,
  closed_at      TIMESTAMPTZ,

  created_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at         TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at         TIMESTAMPTZ
);