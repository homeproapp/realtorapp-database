CREATE TABLE teams (
    team_id BIGSERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    team_site TEXT NOT NULL,
    realty TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    deleted_at    TIMESTAMPTZ
)