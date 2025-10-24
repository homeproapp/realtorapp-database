\set ON_ERROR_STOP 1

SELECT format('CREATE ROLE %I LOGIN PASSWORD %L', :'appuser', :'apppass')
WHERE NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = :'appuser')
\gexec

SELECT format('CREATE DATABASE %I OWNER %I', :'dbname', :'appuser')
WHERE NOT EXISTS (SELECT 1 FROM pg_database WHERE datname = :'dbname')
\gexec

\connect :dbname

ALTER SCHEMA public OWNER TO :appuser;

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS citext;

SET ROLE :appuser;
\ir ../tables/file_types.sql
\ir ../tables/files.sql

\ir ../tables/users.sql
\ir ../tables/teams.sql
\ir ../tables/agents.sql
\ir ../tables/clients.sql
\ir ../tables/refresh_tokens.sql
\ir ../tables/client_invitations.sql
\ir ../tables/reminders.sql

\ir ../tables/properties.sql
\ir ../tables/listings.sql
\ir ../tables/property_invitations.sql
\ir ../tables/client_invitations_properties.sql
\ir ../tables/third_party_contacts.sql
\ir ../tables/clients_listings.sql
\ir ../tables/agents_listings.sql
\ir ../tables/conversations.sql

\ir ../tables/tasks.sql
\ir ../tables/links.sql

\ir ../tables/messages.sql
\ir ../tables/message_reads.sql
\ir ../tables/attachments.sql
\ir ../tables/task_attachments.sql
\ir ../tables/contact_attachments.sql

\ir ../tables/files_tasks.sql
\ir ../tables/task_titles.sql
\ir ../tables/notifications.sql

ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO :appuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT USAGE, SELECT, UPDATE ON SEQUENCES TO :appuser;

INSERT INTO file_types (name) VALUES
  ('Avatar'),
  ('Image'),
  ('Document');