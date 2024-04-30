CREATE VIEW VenueRatings AS
SELECT VenueID, AVG(Rating) AS AverageRating
FROM Reviews
GROUP BY VenueID;
