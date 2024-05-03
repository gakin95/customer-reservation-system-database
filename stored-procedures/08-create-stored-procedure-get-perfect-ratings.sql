-- Creates a stored procedure to fetch venues with perfect ratings
-- Creates a stored procedure to fetch venues with perfect average ratings
CREATE PROCEDURE GetPerfectRatedVenues()
BEGIN
    -- Selects venue names from the Venues table where the average rating is exactly 5
    SELECT V.VenueName
    FROM Venues V
    JOIN (
        -- Subquery to select VenueIDs and calculate average ratings
        SELECT R.VenueID, AVG(R.Rating) AS AvgRating
        FROM Reviews R
        GROUP BY R.VenueID
        HAVING AvgRating = 5
    ) AS PerfectRatings ON V.VenueID = PerfectRatings.VenueID;
END;

