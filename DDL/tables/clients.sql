CREATE TABLE clients (
  user_id        BIGINT PRIMARY KEY
                 REFERENCES users(user_id) ON DELETE RESTRICT,
  -- add domain specific data we want to track
  age            TINYINT,
  marital_status TEXT,
  yearly_income  INT,
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at     TIMESTAMPTZ
);