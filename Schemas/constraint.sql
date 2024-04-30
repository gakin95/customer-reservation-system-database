ALTER TABLE Users
ADD CONSTRAINT unique_email UNIQUE (email),
ADD CONSTRAINT unique_username UNIQUE (username);
