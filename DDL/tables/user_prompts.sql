CREATE TABLE user_prompts (
  user_prompt_id  BIGSERIAL PRIMARY KEY,
  user_id         BIGINT NOT NULL
                  REFERENCES users(user_id) ON DELETE RESTRICT,
  prompt_key      TEXT NOT NULL,
  is_acknowledged BOOLEAN NOT NULL DEFAULT FALSE,
  created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
  deleted_at      TIMESTAMPTZ
);

CREATE UNIQUE INDEX ux_user_prompts_user_prompt
  ON user_prompts (user_id, prompt_key)
  WHERE deleted_at IS NULL;
