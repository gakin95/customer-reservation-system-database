CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    VenueID INT,
    UserID INT,
    Rating INT NOT NULL,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (VenueID) REFERENCES Venues(VenueID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE (VenueID, UserID) -- Ensures a user can only rate a venue once
);
