CREATE TABLE tasks (
  task_id        BIGSERIAL PRIMARY KEY,
  listing_id    BIGINT NOT NULL
                 REFERENCES listings(listing_id) ON DELETE RESTRICT,
  title          TEXT,
  room           TEXT,
  priority       SMALLINT,
  status         SMALLINT,
  follow_up_date TIMESTAMPTZ,
  estimated_cost INT,
  created_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at     TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at     TIMESTAMPTZ
);

CREATE INDEX ix_tasks_listing_id ON tasks(listing_id);
CREATE INDEX ix_tasks_follow_up_date ON tasks(follow_up_date);