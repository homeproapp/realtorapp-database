CREATE TABLE clients (
  client_id        BIGINT PRIMARY KEY
                 REFERENCES users(user_id) ON DELETE RESTRICT,
  date_of_birth  TIMESTAMPTZ,
  marital_status TEXT,
  yearly_income  INT,
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at     TIMESTAMPTZ
);