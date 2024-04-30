CREATE TABLE VenueAvailability (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venue_id INT NOT NULL,
    date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    status ENUM('available', 'booked') DEFAULT 'available',
    FOREIGN KEY (venue_id) REFERENCES Venues(VenueID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE INDEX idx_venue_date ON VenueAvailability (venue_id, date);


