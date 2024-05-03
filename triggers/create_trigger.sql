CREATE TRIGGER AfterReservationInsert
AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    -- Variable to store the fetched availability ID
    DECLARE v_availability_id INT;

    -- Fetch the availability ID using the exact date, time, and status
    SELECT id INTO v_availability_id
    FROM VenueAvailability
    WHERE venue_id = NEW.venueID
      AND DATE(date) = NEW.reservationDate
      AND TIME(start_time) = NEW.startTime
      AND TIME(end_time) = NEW.endTime
      AND status = 'available'
    LIMIT 1;

    -- If an availability is found, update its status to 'booked'
    IF v_availability_id IS NOT NULL THEN
        CALL UpdateAvailabilityStatus(v_availability_id, 'booked');
    END IF;
END;

CREATE TRIGGER AfterReservationCancel
AFTER UPDATE ON Reservations
FOR EACH ROW
BEGIN
    -- Declare variables at the start
    DECLARE v_availability_id INT DEFAULT NULL;

    -- Check if the reservation status is updated to 'Cancelled'
    IF OLD.Status <> 'Cancelled' AND NEW.Status = 'Cancelled' THEN
        -- Update payment status to 'Refunded' for the cancelled reservation
        UPDATE PaymentDetails
        SET PaymentStatus = 'Refunded'
        WHERE ReservationID = NEW.ReservationID;

        -- Fetch the availability ID that matches the reservation details
        SELECT id INTO v_availability_id
        FROM VenueAvailability
        WHERE venue_id = NEW.venueID
          AND DATE(date) = NEW.reservationDate
          AND TIME(start_time) = NEW.startTime
          AND TIME(end_time) = NEW.endTime
          AND status = 'booked'
        LIMIT 1;

        -- If an availability is found, update its status back to 'available'
        IF v_availability_id IS NOT NULL THEN
            UPDATE VenueAvailability
            SET status = 'available'
            WHERE id = v_availability_id;
        END IF;
    END IF;
END;

CREATE TRIGGER SetHighlyRated AFTER INSERT ON Reviews
FOR EACH ROW
BEGIN
  IF NEW.Rating = 5 THEN
    UPDATE Venues SET Status = 'Highly Rated' WHERE VenueID = NEW.VenueID;
  END IF;
END;

CREATE TRIGGER AfterPaymentSuccess
AFTER INSERT ON PaymentDetails
FOR EACH ROW
BEGIN
    -- Check if the payment status is 'Completed'
    IF NEW.PaymentStatus = 'Completed' THEN
        -- Update the reservation status to 'Confirmed'
        UPDATE Reservations
        SET Status = 'Confirmed'
        WHERE ReservationID = NEW.ReservationID;
    END IF;
END;
