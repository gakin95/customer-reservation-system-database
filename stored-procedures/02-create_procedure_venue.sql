-- Creates a new venue in the database with provided details
CREATE PROCEDURE `CreateVenue`(
    IN p_VenueName VARCHAR(255),
    IN p_VenueType ENUM('Hotel', 'Restaurant', 'EventSpace'),
    IN p_Location VARCHAR(255),
    IN p_Description TEXT,
    IN p_Capacity INT
)
BEGIN
    INSERT INTO Venues (VenueName, VenueType, Location, Description, Capacity)
    VALUES (p_VenueName, p_VenueType, p_Location, p_Description, p_Capacity);
END;

-- Updates the details of an existing venue identified by VenueID
CREATE PROCEDURE `UpdateVenue`(
    IN p_VenueID INT,
    IN p_VenueName VARCHAR(255),
    IN p_VenueType ENUM('Hotel', 'Restaurant', 'EventSpace'),
    IN p_Location VARCHAR(255),
    IN p_Description TEXT,
    IN p_Capacity INT
)
BEGIN
    UPDATE Venues
    SET VenueName = p_VenueName, 
        VenueType = p_VenueType,
        Location = p_Location,
        Description = p_Description,
        Capacity = p_Capacity
    WHERE VenueID = p_VenueID;
END;

-- Deletes a venue from the database using the specified VenueID
CREATE PROCEDURE `DeleteVenue`(
    IN p_VenueID INT
)
BEGIN
    DELETE FROM Venues WHERE VenueID = p_VenueID;
END;

CREATE PROCEDURE `GetAllVenues`()
BEGIN
    SELECT * FROM Venues;
END;

CREATE PROCEDURE `GetVenueByID`(
    IN p_VenueID INT
)
BEGIN
    SELECT * FROM Venues WHERE VenueID = p_VenueID;
END;

-- Retrieves venues based on their type (Hotel, Restaurant, EventSpace)
CREATE PROCEDURE GetVenuesByType(IN p_VenueType VARCHAR(255))
BEGIN
    SELECT * FROM Venues WHERE VenueType = p_VenueType;
END;

CREATE PROCEDURE FilterVenuesByCapacityAndDate(
    IN p_Capacity INT,
    IN p_StartDate DATE,
    IN p_EndDate DATE
)
BEGIN
    SELECT DISTINCT v.* FROM Venues v
    JOIN VenueAvailability va ON v.VenueID = va.venue_id
    WHERE v.Capacity >= p_Capacity AND va.date BETWEEN p_StartDate AND p_EndDate AND va.status = 'available';
END;