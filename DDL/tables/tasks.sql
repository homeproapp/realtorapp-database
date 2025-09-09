CREATE TABLE tasks (
  task_id     BIGSERIAL PRIMARY KEY,
  property_id BIGINT NOT NULL
              REFERENCES properties(property_id) ON DELETE RESTRICT,
  title       TEXT,
  room        TEXT,
  priority    SMALLINT,
  status      SMALLINT,
  created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at  TIMESTAMPTZ
);

CREATE INDEX ix_tasks_property_id ON tasks(property_id);