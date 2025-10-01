CREATE TABLE users (
  user_id     BIGSERIAL PRIMARY KEY,
  uuid        UUID UNIQUE,
  email       CITEXT NOT NULL,
  first_name  TEXT,
  last_name   TEXT,
  phone       TEXT,
  profile_image_id    BIGINT
              REFERENCES files(file_id) ON DELETE SET NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at  TIMESTAMPTZ
);

-- Enforce case-insensitive uniqueness only for active (non-deleted) users
CREATE UNIQUE INDEX ux_users_email_active
  ON users (email)
  WHERE deleted_at IS NULL;