CREATE TABLE ai_task_create_tasks (
  ai_task_create_task_id  BIGSERIAL PRIMARY KEY,
  ai_task_create_job_id   BIGINT NOT NULL
                          REFERENCES ai_task_create_jobs(ai_task_create_job_id) ON DELETE RESTRICT,
  task_id                 BIGINT NOT NULL
                          REFERENCES tasks(task_id) ON DELETE RESTRICT,
  is_edited               BOOLEAN NOT NULL DEFAULT FALSE,
  created_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at              TIMESTAMPTZ
);

CREATE INDEX ix_ai_task_create_tasks_job_id ON ai_task_create_tasks(ai_task_create_job_id);
CREATE UNIQUE INDEX ux_ai_task_create_tasks_task_id ON ai_task_create_tasks(task_id);
