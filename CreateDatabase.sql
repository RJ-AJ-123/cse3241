
-- =====================================
-- Table: ADMINISTRATORS
-- =====================================
CREATE TABLE ADMINISTRATORS (
    Email VARCHAR(100) NOT NULL,
    AdminID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20)
);

-- =====================================
-- Table: CUSTOMERS
-- =====================================
CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY,
    ContactNumber VARCHAR(20),
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Email VARCHAR(100) NOT NULL
);

-- =====================================
-- Table: PUBLISHERS
-- =====================================
CREATE TABLE PUBLISHERS (
    PublisherName VARCHAR(100) PRIMARY KEY,
    Email VARCHAR(100),
    Address VARCHAR(255),
    ContactNumber VARCHAR(20)
);

-- =====================================
-- Table: BOOKS
-- =====================================
CREATE TABLE BOOKS (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Authors VARCHAR(255) NOT NULL,
    PublisherName VARCHAR(100),
    Year INT,
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockThreshold INT,
    FOREIGN KEY (PublisherName) REFERENCES PUBLISHERS(PublisherName)
);

-- =====================================
-- Table: INVENTORY
-- =====================================
CREATE TABLE INVENTORY (
    ISBN VARCHAR(13) PRIMARY KEY,
    CurrentStock INT NOT NULL CHECK (CurrentStock >= 0),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN)
);

-- =====================================
-- Table: PURCHASES
-- =====================================
CREATE TABLE PURCHASES (
    PurchaseID INT PRIMARY KEY,
    CustomerID INT,
    OrderStatus VARCHAR(50) NOT NULL,
    PurchaseDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID)
);

-- =====================================
-- Table: REVIEWS
-- =====================================
CREATE TABLE REVIEWS (
    ReviewID INT PRIMARY KEY,
    CustomerID INT,
    ISBN VARCHAR(13),
    Rating INT NOT NULL CHECK (Rating >= 1 AND Rating <= 5),
    ReviewText TEXT,
    ReviewDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMERS(CustomerID),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN)
);

-- =====================================
-- Table: REORDERS
-- =====================================
CREATE TABLE REORDERS (
    ReorderID INT PRIMARY KEY,
    ISBN VARCHAR(13),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Status VARCHAR(50) NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    AdminID INT,
    ReOrderDate DATE NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN),
    FOREIGN KEY (AdminID) REFERENCES ADMINISTRATORS(AdminID)
);

-- =====================================
-- Table: PROMOTIONS
-- =====================================
CREATE TABLE PROMOTIONS (
    PromotionID INT PRIMARY KEY,
    PromotionName VARCHAR(100) NOT NULL,
    DiscountPercentage DECIMAL(5, 2) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    ISBN VARCHAR(13),
    AdminID INT,
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN),
    FOREIGN KEY (AdminID) REFERENCES ADMINISTRATORS(AdminID)
);

-- =====================================
-- Table: PurchaseDetailReferences
-- =====================================
CREATE TABLE PurchaseDetailReferences (
    PurchaseDetailsID INT PRIMARY KEY,
    PurchaseID INT,
    ISBN VARCHAR(13),
    FOREIGN KEY (PurchaseID) REFERENCES PURCHASES(PurchaseID),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN)
);

-- =====================================
-- Table: PurchaseItemDetails
-- =====================================
CREATE TABLE PurchaseItemDetails (
    PurchaseID INT,
    ISBN VARCHAR(13),
    Quantity INT NOT NULL,
    PricePerUnit DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (PurchaseID, ISBN),
    FOREIGN KEY (PurchaseID, ISBN) REFERENCES PurchaseDetailReferences(PurchaseID, ISBN)
);

-- =====================================
-- Sample INDEX
-- =====================================
CREATE INDEX idx_books_category ON BOOKS(Category);
CREATE INDEX idx_reviews_rating ON REVIEWS(Rating);

-- =====================================
-- Sample VIEW: Top-Rated Books
-- =====================================
CREATE VIEW TopRatedBooks AS
SELECT b.ISBN, b.Title, AVG(r.Rating) AS AvgRating
FROM BOOKS b
JOIN REVIEWS r ON b.ISBN = r.ISBN
GROUP BY b.ISBN
HAVING AvgRating >= 4.5;
