CREATE TABLE links (
  link_id     BIGSERIAL PRIMARY KEY,
  task_id     BIGINT NOT NULL
              REFERENCES tasks(task_id) ON DELETE RESTRICT,
  name        TEXT NOT NULL,
  url         TEXT NOT NULL,
  is_referral BOOLEAN DEFAULT FALSE,
  times_used  INT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at  TIMESTAMPTZ
);

CREATE INDEX ix_links_task_id ON links(task_id);