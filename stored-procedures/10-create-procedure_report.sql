-- Creating a stored procedure to fetch summary statistics from the database
CREATE PROCEDURE GetDatabaseSummary()
BEGIN
    -- Select statement to calculate totals from different tables
    SELECT
      -- Total number of users in the Users table
      (SELECT COUNT(*) FROM Users) AS TotalUsers,
      
      -- Total number of reservations in the Reservations table
      (SELECT COUNT(*) FROM Reservations) AS TotalReservations,
      
      -- Total number of payments recorded in the PaymentDetails table
      (SELECT COUNT(*) FROM PaymentDetails) AS TotalPayments,
      
      -- Total number of venues listed in the Venues table
      (SELECT COUNT(*) FROM Venues) AS TotalVenues,
      
      -- Total number of available slots in the VenueAvailability table
      (SELECT COUNT(*) FROM VenueAvailability WHERE status = 'available') AS TotalAvailableSlots;
END;
