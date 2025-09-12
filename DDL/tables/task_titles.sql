CREATE TABLE task_titles (
    task_title_id BIGSERIAL PRIMARY KEY,
    task_title CITEXT UNIQUE NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);