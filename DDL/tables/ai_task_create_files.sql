CREATE TABLE ai_task_create_files (
  ai_task_create_file_id  BIGSERIAL PRIMARY KEY,
  ai_task_create_job_id   BIGINT NOT NULL
                          REFERENCES ai_task_create_jobs(ai_task_create_job_id) ON DELETE RESTRICT,
  file_id                 BIGINT NOT NULL
                          REFERENCES files(file_id) ON DELETE RESTRICT,
  media_type              SMALLINT NOT NULL,
  created_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at              TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at              TIMESTAMPTZ
);

CREATE INDEX ix_ai_task_create_files_job_id ON ai_task_create_files(ai_task_create_job_id);
