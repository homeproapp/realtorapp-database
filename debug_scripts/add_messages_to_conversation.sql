BEGIN;

\set conversation_id 1
\set sender_id 1
\set num_messages 10

INSERT INTO messages (conversation_id, sender_id, message_text, created_at, updated_at)
SELECT
  :conversation_id,
  :sender_id,
  CASE (n % 10)
    WHEN 0 THEN 'Hey, just wanted to follow up on this property.'
    WHEN 1 THEN 'What time works best for a showing?'
    WHEN 2 THEN 'I love the kitchen in this one!'
    WHEN 3 THEN 'Can we schedule a viewing for next week?'
    WHEN 4 THEN 'The location is perfect for what we need.'
    WHEN 5 THEN 'Do you have any more photos of the backyard?'
    WHEN 6 THEN 'Thanks for sending over those details.'
    WHEN 7 THEN 'How soon could we move in if we make an offer?'
    WHEN 8 THEN 'I have a few questions about the neighborhood.'
    ELSE 'Let me know what you think about this one.'
  END,
  TIMESTAMP '2024-06-15 14:30:00' + (n || ' minutes')::INTERVAL,
  TIMESTAMP '2024-06-15 14:30:00' + (n || ' minutes')::INTERVAL
FROM generate_series(0, :num_messages - 1) AS n;

COMMIT;

SELECT
  'Messages added:' as status,
  COUNT(*) as count
FROM messages
WHERE conversation_id = :conversation_id
  AND created_at >= TIMESTAMP '2024-06-15 14:30:00';
