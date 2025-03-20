CREATE table IF NOT EXISTS Administrators (
    AdminID INTEGER PRIMARY KEY,
    Email TEXT NOT NULL UNIQUE,
    NAME TEXT,
    ContactNumber TEXT
);

CREATE table  IF NOT EXISTS Publishers(
    PublisherName TEXT PRIMARY KEY,
    Email TEXT,
    Address TEXT,
    ContactNumber TEXT
);

CREATE table if not exists Books(
    ISBN TEXT Primary key,
    Title TEXT NOT NULL,
    Author TEXT,
    PublisherName TEXT,
    Year INTEGER,
    Price REAL,
    Category TEXT,
    StockThreshold INTEGER,
    FOREIGN KEY (PublisherName) REFERENCES Publishers (publishername)
        on update CASCADE
        on delete set null
);


INSERT OR REPLACE INTO Administrators (AdminID, Email, Name, ContactNumber)
VALUES
  (1, 'admin1@bookstore.com', 'Alice Admin', '123-456-7890'),
  (2, 'admin2@bookstore.com', 'Bob Admin',   '234-567-8901'),
  (3,'admin3@bookstore.com', 'Eugene Y', '614-435-0291');



