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

CREATE TABLE IF NOT EXISTS Promotions (
    PromotionID       INTEGER PRIMARY KEY,
    PromotionName     TEXT    NOT NULL,
    DiscountPercentage REAL,
    StartDate         TEXT,
    EndDate           TEXT,
    ISBN TEXT,
    FOREIGN KEY (ISBN) REFERENCES Books (ISBN)
        on update  CASCADE
        on delete  set null
);

CREATE TABLE IF NOT EXISTS Have_Between_Books_And_Promotions (
    ISBN        TEXT,
    PromotionID INTEGER,
    PRIMARY KEY (ISBN, PromotionID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID)
       on update  CASCADE
       on delete  set null
);

CREATE TABLE  IF NOT EXISTS Customers(
    CustomerID INTEGER PRIMARY KEY,
    ContactNumber TEXT,
    Name TEXT,
    Address TEXT,
    Email TEXT
);

CREATE TABLE IF NOT EXISTS Purchases(
    PurchaseID INTEGER PRIMARY KEY ,
    CustomerID INTEGER,
    OrderStatus TEXT,
    PurchaseDate TEXT,
    TotalAmount REAL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        on update  CASCADE
        on delete  set null
);

CREATE TABLE  if not exists PurchaseDetails (
    PurchaseDetailsID INTEGER PRIMARY KEY,
    PurchaseID  INTEGER,
    ISBN TEXT,
    Quantity INTEGER,
    PricePerUnit REAL,
    FOREIGN KEY(PurchaseID) REFERENCES Purchases(PurchaseID)
        on update  CASCADE
        on delete  CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Reviews (
    ReviewID    INTEGER PRIMARY KEY,
    CustomerID  INTEGER,
    ISBN        TEXT,
    Rating      INTEGER,
    ReviewText  TEXT,
    ReviewDate  TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Reorders (
    ReorderID   INTEGER PRIMARY KEY,
    ISBN        TEXT,
    Quantity    INTEGER,
    Status      TEXT,
    TotalAmount REAL,
    AdminID     INTEGER,
    ReOrderDate TEXT,
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
    FOREIGN KEY (AdminID) REFERENCES Administrators(AdminID)
       ON UPDATE CASCADE
       ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS Inventory (
    ISBN         TEXT PRIMARY KEY,
    CurrentStock INTEGER,
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);

INSERT OR REPLACE INTO Administrators (AdminID, Email, Name, ContactNumber)
VALUES
  (1, 'admin1@bookstore.com', 'Alice Admin', '123-456-7890'),
  (2, 'admin2@bookstore.com', 'Bob Admin',   '234-567-8901'),
  (3,'admin3@bookstore.com', 'Eugene Y', '614-435-0291');



