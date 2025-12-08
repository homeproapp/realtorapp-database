BEGIN;

DELETE FROM message_reads
WHERE reader_id IN (SELECT user_id FROM clients);

DELETE FROM attachments
WHERE message_id IN (
  SELECT m.message_id
  FROM messages m
  WHERE m.sender_id IN (SELECT user_id FROM clients)
);

DELETE FROM messages
WHERE sender_id IN (SELECT user_id FROM clients);

DELETE FROM notifications
WHERE user_id IN (SELECT user_id FROM clients);

DELETE FROM reminders
WHERE user_id IN (SELECT user_id FROM clients);

DELETE FROM refresh_tokens
WHERE user_id IN (SELECT user_id FROM clients);

DELETE FROM client_invitations_properties
WHERE client_invitation_id IN (
  SELECT client_invitation_id
  FROM client_invitations
);

delete from property_invitations;

DELETE FROM client_invitations;

delete from agents_listings;

DELETE FROM clients_listings;

delete from conversations;

delete from links;

delete from files_tasks;

delete from tasks;

delete from listings;

DELETE FROM clients;

DELETE FROM users
WHERE user_id NOT IN (SELECT user_id FROM agents)
  AND user_id NOT IN (SELECT user_id FROM clients);

COMMIT;

SELECT 'Clients remaining:' as status, COUNT(*) as count FROM clients;
SELECT 'Client invitations remaining:' as status, COUNT(*) as count FROM client_invitations;
SELECT 'Clients_listings remaining:' as status, COUNT(*) as count FROM clients_listings;
