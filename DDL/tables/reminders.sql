CREATE TABLE reminders (
  reminder_id   BIGSERIAL PRIMARY KEY,
  user_id       BIGINT NOT NULL
                REFERENCES users(user_id) ON DELETE RESTRICT,
  listing_id    BIGINT NOT NULL
                REFERENCES listings(listing_id) ON DELETE RESTRICT,
  reminder_text TEXT NOT NULL,
  reminder_type SMALLINT,
  referencing_object_id BIGINT NOT NULL,
  remind_at     TIMESTAMPTZ NOT NULL,
  is_completed  BOOLEAN DEFAULT FALSE,

  created_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at    TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at    TIMESTAMPTZ
);

CREATE INDEX ix_reminders_remind_at ON reminders(remind_at);