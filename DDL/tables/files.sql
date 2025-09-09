CREATE TABLE files (
  file_id        BIGSERIAL PRIMARY KEY,
  uuid           UUID NOT NULL,
  file_extension TEXT,
  file_type_id   BIGINT NOT NULL
                 REFERENCES file_types(id) ON DELETE RESTRICT,
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at     TIMESTAMPTZ
);