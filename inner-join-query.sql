SELECT Venues.VenueName, AVG(Reviews.Rating) AS AverageRating
FROM Venues
INNER JOIN Reviews ON Venues.VenueID = Reviews.VenueID
GROUP BY Venues.VenueName;
