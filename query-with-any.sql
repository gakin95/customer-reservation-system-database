SELECT * 
FROM Reviews
WHERE Rating > ANY (SELECT MIN(Rating) FROM Reviews);
