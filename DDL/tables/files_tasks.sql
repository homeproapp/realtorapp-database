CREATE TABLE files_tasks (
  file_task_id BIGSERIAL PRIMARY KEY,
  file_id      BIGINT NOT NULL REFERENCES files(file_id) ON DELETE RESTRICT,
  task_id      BIGINT NOT NULL REFERENCES tasks(task_id) ON DELETE RESTRICT,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at   TIMESTAMPTZ
);

CREATE UNIQUE INDEX ux_files_tasks_pair ON files_tasks (file_id, task_id);