CREATE TABLE Venues (
    VenueID INT PRIMARY KEY AUTO_INCREMENT,
    VenueName VARCHAR(255) NOT NULL,
    VenueType ENUM('Hotel', 'Restaurant', 'EventSpace') NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Description TEXT,
    Capacity INT
);