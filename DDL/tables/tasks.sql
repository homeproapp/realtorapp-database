CREATE TABLE tasks (
  task_id        BIGSERIAL PRIMARY KEY,
  property_id    BIGINT NOT NULL
                 REFERENCES properties(property_id) ON DELETE RESTRICT,
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

CREATE INDEX ix_tasks_property_id ON tasks(property_id);
CREATE INDEX ix_tasks_follow_up_date ON tasks(follow_up_date);