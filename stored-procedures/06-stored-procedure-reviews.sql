
CREATE PROCEDURE AddReview(
    IN p_UserID INT,
    IN p_VenueID INT,
    IN p_Rating INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLSTATE '23000'
        SELECT 'Duplicate entry. User has already reviewed this venue.' AS Error;

    INSERT INTO Reviews (UserID, VenueID, Rating, ReviewDate)
    VALUES (p_UserID, p_VenueID, p_Rating, CURDATE());

    SELECT 'Review added successfully.' AS Message;
END;
