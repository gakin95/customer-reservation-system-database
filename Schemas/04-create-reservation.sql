CREATE TABLE Reservations (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    VenueID INT NOT NULL,
    ReservationDate DATETIME NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    NumberOfGuests INT NOT NULL,
    Status ENUM('Confirmed', 'Cancelled', 'Completed', 'Pending') NOT NULL DEFAULT 'Pending',
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID) ON DELETE CASCADE ON UPDATE CASCADE
);