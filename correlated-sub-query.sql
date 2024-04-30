SELECT DISTINCT r1.UserID, u.FullName
FROM Reviews r1
INNER JOIN Users u ON r1.UserID = u.UserID
WHERE r1.Rating > (
    SELECT AVG(r2.Rating)
    FROM Reviews r2
    WHERE r2.VenueID = r1.VenueID
);
