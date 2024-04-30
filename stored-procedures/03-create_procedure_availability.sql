CREATE PROCEDURE CreateAvailability(
    IN p_venue_id INT,
    IN p_date DATE,
    IN p_start_time TIME,
    IN p_end_time TIME,
    IN p_status ENUM('available', 'booked')
)
BEGIN
    INSERT INTO VenueAvailability (venue_id, date, start_time, end_time, status)
    VALUES (p_venue_id, p_date, p_start_time, p_end_time, p_status);
END;

CREATE PROCEDURE GetAvailabilityByID(IN p_id INT)
BEGIN
    SELECT va.*, v.VenueName, v.VenueType, v.Capacity
    FROM VenueAvailability va
    JOIN Venues v ON va.venue_id = v.VenueID
    WHERE va.id = p_id;
END;

CREATE PROCEDURE GetAvailabilityByVenueID(IN p_venue_id INT)
BEGIN
    SELECT *
    FROM VenueAvailabilityView 
    WHERE venue_id = p_venue_id
    ORDER BY date, start_time;
END;

CREATE PROCEDURE GetAvailabilityByStatus(IN p_status ENUM('available', 'booked'))
BEGIN
    SELECT *
    FROM VenueAvailabilityView
    WHERE status = p_status
    ORDER BY date, start_time;
END;

CREATE PROCEDURE GetAllAvailabilities()
BEGIN
    SELECT *
    FROM VenueAvailabilityView
    ORDER BY date, start_time;
END;

CREATE PROCEDURE CheckAvailabilityOverlap(
    IN p_venue_id INT,
    IN p_date DATE,
    IN p_start_time TIME,
    IN p_end_time TIME
)
BEGIN
    SELECT *
    FROM VenueAvailability
    WHERE venue_id = p_venue_id
      AND DATE(date) = p_date
      AND TIME(start_time) < p_end_time
      AND TIME(end_time) > p_start_time;
END;

CREATE PROCEDURE GetAvailabilityByDateTime(
    IN p_date DATE,
    IN p_start_time TIME,
    IN p_end_time TIME
)
BEGIN
    SELECT va.*, v.VenueName
    FROM VenueAvailability va
    JOIN Venues v ON va.venue_id = v.VenueID
    WHERE DATE(va.date) = p_date
      AND TIME(va.start_time) >= p_start_time
      AND TIME(va.end_time) <= p_end_time
    ORDER BY va.start_time;
END;

CREATE PROCEDURE GetAvailabilityByExactDateTime(
    IN p_date DATE,
    IN p_start_time TIME,
    IN p_end_time TIME,
    IN p_status ENUM('available', 'booked')
)
BEGIN
    SELECT va.*, v.VenueName
    FROM VenueAvailability va
    JOIN Venues v ON va.venue_id = v.VenueID
    WHERE DATE(va.date) = p_date
      AND TIME(va.start_time) = p_start_time
      AND TIME(va.end_time) = p_end_time
      AND va.status = p_status;
END;

CREATE PROCEDURE FindAvailableSlot(
    IN p_venue_id INT,
    IN p_date DATE,
    IN p_start_time TIME,
    IN p_end_time TIME
)
BEGIN
    SELECT *
    FROM VenueAvailability
    WHERE venue_id = p_venue_id
      AND DATE(date) = p_date
      AND start_time <= p_start_time
      AND end_time >= p_end_time
      AND status = 'available';
END;

CREATE PROCEDURE UpdateAvailabilityStatus(
    IN p_id INT,
    IN p_status ENUM('available', 'booked')
)
BEGIN
    UPDATE VenueAvailability
    SET status = p_status
    WHERE id = p_id;
END;


