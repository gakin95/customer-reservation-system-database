-- To view all triggers in the database
SELECT * FROM information_schema.triggers;

-- To view details of a specific trigger, e.g., 'AfterReservationInsert'
SELECT *
FROM information_schema.triggers
WHERE TRIGGER_NAME = 'AfterReservationInsert';

-- Show all triggers
SHOW TRIGGERS;

-- Show triggers related to a specific table, e.g., 'Reservations'
SHOW TRIGGERS WHERE `Table` = 'Reservations';

-- Show a specific trigger by name
SHOW TRIGGERS WHERE `Trigger` = 'AfterReservationInsert';