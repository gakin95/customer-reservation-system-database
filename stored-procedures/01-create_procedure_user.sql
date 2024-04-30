
-- Stored Procedure for creating a new user in the system
CREATE PROCEDURE CreateUser(
    IN p_Username VARCHAR(255),
    IN p_Email VARCHAR(255),
    IN p_Password VARCHAR(255),
    IN p_FirstName VARCHAR(255),
    IN p_LastName VARCHAR(255),
    IN p_PhoneNumber VARCHAR(50),
    IN p_UserType ENUM('Admin', 'Super Admin', 'Customer')
)
BEGIN
    DECLARE existingUser INT DEFAULT 0;-- Temporary variable to check for existing users
    
    SELECT COUNT(*) INTO existingUser FROM Users
    WHERE Username = p_Username OR Email = p_Email;
    
    IF existingUser = 0 THEN
        INSERT INTO Users (Username, Email, Password, FirstName, LastName, PhoneNumber, UserType)
        VALUES (p_Username, p_Email, p_Password, p_FirstName, p_LastName, p_PhoneNumber, p_UserType);
        
        SELECT LAST_INSERT_ID() AS UserID; -- Return the ID of the new user
    ELSE
        -- Raise an error if the username or email already exists
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Username or Email already exists.';
    END IF;
END;

-- Stored Procedure to log in a user by verifying their email
CREATE PROCEDURE `spLoginUser`(
    IN p_Email VARCHAR(255)
)
BEGIN
    SELECT UserID, Username, Email, Password, FirstName, LastName, PhoneNumber, UserType 
    FROM Users 
    WHERE Email = p_Email;
END;

-- Stored Procedure to retrieve all users filtered by their user type
CREATE PROCEDURE `spGetUsersByType`(
    IN p_UserType ENUM('Admin', 'Super Admin', 'Customer')
)
BEGIN
    SELECT UserID, Username, Email, FirstName, LastName, PhoneNumber, UserType 
    FROM Users 
    WHERE UserType = p_UserType;
END;

-- For retrieving all users

CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT UserID, Username, Email, FirstName, LastName, PhoneNumber, UserType FROM Users;
END;

-- For retrieving users by type

CREATE PROCEDURE GetUsersByType(IN p_UserType VARCHAR(255))
BEGIN
    SELECT UserID, Username, Email, FirstName, LastName, PhoneNumber, UserType FROM Users WHERE UserType = p_UserType;
END;

-- For retrieving a user by ID

CREATE PROCEDURE GetUserByID(IN p_UserID INT)
BEGIN
    SELECT UserID, Username, Email, FirstName, LastName, PhoneNumber, UserType FROM Users WHERE UserID = p_UserID;
END;




