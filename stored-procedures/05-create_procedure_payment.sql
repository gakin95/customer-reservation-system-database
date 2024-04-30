CREATE PROCEDURE InsertPaymentDetails(
    IN p_ReservationID INT,
    IN p_PaymentMethod VARCHAR(255),
    IN p_Amount DECIMAL(10, 2),
    IN p_Receipt_Url VARCHAR(255),
    IN p_PaymentStatus ENUM('Pending', 'Completed', 'Refunded'),
    IN p_PaymentDate DATE
)
BEGIN
    INSERT INTO PaymentDetails (
        ReservationID,
        PaymentMethod,
        Amount,
        Receipt_Url,
        PaymentStatus,
        PaymentDate
    ) 
    VALUES (
        p_ReservationID,
        p_PaymentMethod,
        p_Amount,
        p_Receipt_Url,
        p_PaymentStatus,
        p_PaymentDate
    );
END;


CREATE PROCEDURE GetAllPayments()
BEGIN
    SELECT * FROM PaymentDetails;
END;
