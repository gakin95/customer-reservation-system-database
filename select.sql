 SELECT * FROM VenueAvailabilityView;
 SELECT *
    FROM VenueAvailabilityView va
    WHERE va.status = "booked"
    ORDER BY va.date, va.start_time;
 SELECT *
    FROM VenueAvailability
    WHERE venue_id = 5
      AND Date(date) = "2024-11-13"
      AND start_time = "06:34:00"
      AND end_time = "08:37:00"
      AND status = 'available';

SELECT * FROM Users WHERE UserType IN ("Customer","Admin");
SELECT * FROM VenueAvailability;

SELECT v.* 
FROM Venues v
JOIN VenueAvailability va ON v.VenueID = va.venue_id
WHERE v.Capacity >= 300 
AND va.date >= "2025-01-31" 
AND va.date <= "2025-02-28"  -- corrected date
AND va.status = 'available'
GROUP BY v.VenueID
HAVING COUNT(va.id) >= DATEDIFF("2025-02-28", "2025-01-31") + 1;

SELECT v.* 
FROM Venues v
JOIN VenueAvailability va ON v.VenueID = va.venue_id
WHERE v.Capacity >= 300 
AND va.date BETWEEN "2025-01-31" AND "2025-02-28"
AND va.status = 'available'
GROUP BY v.VenueID;


SELECT * FROM VenueAvailability
WHERE venue_id = 1 AND date = "2027-09-03" AND start_time = "11:00:00" AND end_time = "12:31:00" AND status = 'available'