CREATE PROCEDURE GetTotalPaymentsByVenue()
BEGIN
    SELECT
      V.VenueName,
      SUM(P.Amount) AS TotalAmountCollected
    FROM PaymentDetails P
    JOIN Reservations R ON P.ReservationID = R.ReservationID
    JOIN Venues V ON R.VenueID = V.VenueID
    GROUP BY V.VenueName;
END;
