CREATE TABLE links (
  link_id     BIGSERIAL PRIMARY KEY,
  task_id     BIGINT NOT NULL
              REFERENCES tasks(task_id) ON DELETE RESTRICT,
  name        TEXT,
  url         TEXT,
  is_referral BOOLEAN,
  times_used  INT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at  TIMESTAMPTZ
);

CREATE INDEX ix_links_task_id ON links(task_id);