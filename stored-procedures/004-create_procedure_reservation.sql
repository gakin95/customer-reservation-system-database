CREATE PROCEDURE CreateReservation(
    IN p_userID INT, 
    IN p_venueID INT, 
    IN p_reservationDate DATE, 
    IN p_startTime TIME, 
    IN p_endTime TIME, 
    IN p_numberOfGuests INT, 
    IN p_status ENUM('Pending', 'Confirmed', 'Cancelled', 'Completed'), 
    IN p_amount DECIMAL(10,2)
)
BEGIN
    INSERT INTO Reservations (UserID, VenueID, ReservationDate, StartTime, EndTime, NumberOfGuests, Status, Amount) 
    VALUES (p_userID, p_venueID, p_reservationDate, p_startTime, p_endTime, p_numberOfGuests, p_status, p_amount);

    -- Return the ID of the newly created reservation
    SELECT LAST_INSERT_ID() AS ReservationID;
END; 


CREATE PROCEDURE GetAllReservations()
BEGIN
    SELECT R.*, U.Username AS userUsername, V.VenueName AS venueName
    FROM Reservations R
    JOIN Users U ON R.UserID = U.UserID
    JOIN Venues V ON R.VenueID = V.VenueID;
END;

CREATE PROCEDURE GetReservationByID(IN p_reservationID INT)
BEGIN
    SELECT R.*, U.Username AS userUsername, V.VenueName AS venueName
    FROM Reservations R
    JOIN Users U ON R.UserID = U.UserID
    JOIN Venues V ON R.VenueID = V.VenueID
    WHERE R.ReservationID = p_reservationID;
END;


CREATE PROCEDURE UpdateReservation(IN p_reservationID INT, IN p_reservationDate DATE, IN p_startTime TIME, IN p_endTime TIME, IN p_numberOfGuests INT, IN p_status ENUM('Pending', 'Confirmed', 'Cancelled', 'Completed'), IN p_amount DECIMAL(10,2))
BEGIN
    UPDATE Reservations 
    SET ReservationDate = p_reservationDate, StartTime = p_startTime, EndTime = p_endTime, NumberOfGuests = p_numberOfGuests, Status = p_status, Amount = p_amount
    WHERE ReservationID = p_reservationID;
END;

CREATE PROCEDURE DeleteReservation(IN p_reservationID INT)
BEGIN
    DELETE FROM Reservations WHERE ReservationID = p_reservationID;
END;

CREATE PROCEDURE FindReservationsByUserID(IN p_userID INT)
BEGIN
    SELECT R.*, V.VenueName AS venueName, V.Location AS venueLocation, U.Username AS username
    FROM Reservations R
    JOIN Venues V ON R.VenueID = V.VenueID
    JOIN Users U ON R.UserID = U.UserID
    WHERE R.UserID = p_userID;
END;

CREATE PROCEDURE FindReservationsByVenueID(IN p_venueID INT)
BEGIN
    SELECT R.*, U.Username AS userUsername, V.VenueName AS venueName
    FROM Reservations R
    JOIN Users U ON R.UserID = U.UserID
    JOIN Venues V ON R.VenueID = V.VenueID
    WHERE R.VenueID = p_venueID;
END;

CREATE PROCEDURE CancelReservation(IN p_reservationID INT)
BEGIN
    UPDATE Reservations 
    SET Status = 'Cancelled'
    WHERE ReservationID = p_reservationID;
END;

CREATE PROCEDURE GetReservationID(
    IN p_VenueID INT,
    IN p_UserID INT,
    IN p_ReservationDate DATE,
    IN p_StartTime TIME,
    IN p_EndTime TIME,
    IN p_NumberOfGuests INT,
    IN p_Amount DECIMAL(10, 2)
)
BEGIN
    SELECT ReservationID
    FROM Reservations
    WHERE VenueID = p_VenueID
        AND UserID = p_UserID
        AND ReservationDate = p_ReservationDate
        AND StartTime = p_StartTime
        AND EndTime = p_EndTime
        AND NumberOfGuests = p_NumberOfGuests
        AND Amount = p_Amount;
END;

