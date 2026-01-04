CREATE TABLE users (
  user_id     BIGSERIAL PRIMARY KEY,
  uuid        TEXT UNIQUE NOT NULL,
  email       CITEXT NOT NULL,
  first_name  TEXT NOT NULL,
  last_name   TEXT NOT NULL,
  phone       TEXT,
  profile_image_id    BIGINT
              REFERENCES files(file_id) ON DELETE SET NULL,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at  TIMESTAMPTZ
);

CREATE UNIQUE INDEX ux_users_email_active
  ON users (email)
  WHERE deleted_at IS NULL;