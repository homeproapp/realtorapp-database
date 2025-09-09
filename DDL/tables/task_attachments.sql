CREATE TABLE task_attachments (
  attachment_id BIGINT PRIMARY KEY
                REFERENCES attachments(attachment_id) ON DELETE RESTRICT,
  task_id       BIGINT NOT NULL
                REFERENCES tasks(task_id) ON DELETE RESTRICT,

  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at    TIMESTAMPTZ
);