CREATE TABLE PaymentDetails (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    ReservationID INT,
    PaymentMethod VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentStatus ENUM('Pending', 'Completed', 'Refunded') NOT NULL,
    PaymentDate DATE NOT NULL,
    Receipt_Url VARCHAR(1000),
    FOREIGN KEY (ReservationID) REFERENCES Reservations(ReservationID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

