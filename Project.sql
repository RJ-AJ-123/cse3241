CREATE table IF NOT EXISTS Administrators (
    AdminID INTEGER PRIMARY KEY,
    Email TEXT NOT NULL UNIQUE,
    NAME TEXT,
    ContactNumber TEXT
);

INSERT OR REPLACE INTO Administrators (AdminID, Email, Name, ContactNumber)
VALUES
  (1, 'admin1@bookstore.com', 'Alice Admin', '123-456-7890'),
  (2, 'admin2@bookstore.com', 'Bob Admin',   '234-567-8901'),
  (3,'admin3@bookstore.com', 'Eugene Y', '614-435-0291');



