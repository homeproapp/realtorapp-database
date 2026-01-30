CREATE TABLE ai_task_create_jobs (
  ai_task_create_job_id  BIGSERIAL PRIMARY KEY,
  listing_id             BIGINT NOT NULL
                         REFERENCES listings(listing_id) ON DELETE RESTRICT,
  status                 SMALLINT NOT NULL,
  created_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at             TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at             TIMESTAMPTZ
);

CREATE INDEX ix_ai_task_create_jobs_listing_id ON ai_task_create_jobs(listing_id);
