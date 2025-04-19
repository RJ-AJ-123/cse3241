-- CreateDatabase_FIXED.sql

-- Contains only clean CREATE TABLE, INDEX, and VIEW statements

-- No data or 

-- =====================================
-- CREATE TABLE: ADMINISTRATORS
-- =====================================

CREATE TABLE ADMINISTRATORS (
    Email VARCHAR(100) NOT NULL,
    AdminID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactNumber VARCHAR(20)
);

-- =====================================
-- CREATE TABLE: CUSTOMERS
-- =====================================

CREATE TABLE CUSTOMERS (
    CustomerID INT PRIMARY KEY,
    ContactNumber VARCHAR(20),
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255),
    Email VARCHAR(100) NOT NULL
);

-- =====================================
-- CREATE TABLE: BOOKS
-- =====================================

CREATE TABLE BOOKS (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Authors VARCHAR(255) NOT NULL,
    PublisherName VARCHAR(100),
    Year INT,
    Price DECIMAL(10, 2), -- Price with 2 decimal places (e.g., 29.99)
    Category VARCHAR(50),
    StockThreshold INT,
    FOREIGN KEY (PublisherName) REFERENCES PUBLISHERS(PublisherName)
);

-- =====================================
-- CREATE TABLE: PURCHASES
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
-- CREATE TABLE: REORDERS
-- =====================================

CREATE TABLE REORDERS (
    ReorderID INT PRIMARY KEY,
    ISBN VARCHAR(13),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Status VARCHAR(50) NOT NULL, -- Status of the reorder (e.g., "Pending", "Completed")
    TotalAmount DECIMAL(10, 2) NOT NULL,
    AdminID INT,
    ReOrderDate DATE NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN),
    FOREIGN KEY (AdminID) REFERENCES ADMINISTRATORS(AdminID)
);

-- =====================================
-- CREATE TABLE: REVIEWS
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
-- CREATE TABLE: PROMOTIONS
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
-- CREATE TABLE: INVENTORY
-- =====================================

CREATE TABLE INVENTORY (
    ISBN VARCHAR(13) PRIMARY KEY,
    CurrentStock INT NOT NULL CHECK (CurrentStock >= 0),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN)
);

-- =====================================
-- CREATE TABLE: PURCHASEDETAILREFERENCES
-- =====================================

CREATE TABLE PurchaseDetailReferences (
    PurchaseDetailsID INT PRIMARY KEY,
    PurchaseID INT,
    ISBN VARCHAR(13),
    FOREIGN KEY (PurchaseID) REFERENCES PURCHASES(PurchaseID),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN)
);

-- =====================================
-- CREATE TABLE: PURCHASEITEMDETAILS
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
-- CREATE TABLE: HAVE_BETWEEN_BOOKS_AND_PROMOTION
-- =====================================

CREATE TABLE HAVE_BETWEEN_BOOKS_AND_PROMOTION (
    ISBN VARCHAR(13),
    PromotionID INT,
    PRIMARY KEY (ISBN, PromotionID),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN),
    FOREIGN KEY (PromotionID) REFERENCES PROMOTIONS(PromotionID)
);

-- =====================================
-- CREATE TABLE: PURCHASEDETAILS
-- =====================================

CREATE TABLE PURCHASEDETAILS (
    PurchaseDetailsID INT PRIMARY KEY,
    PurchaseID INT,
    ISBN VARCHAR(13),
    Quantity INT NOT NULL,
    PricePerUnit DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (PurchaseID) REFERENCES PURCHASES(PurchaseID),
    FOREIGN KEY (ISBN) REFERENCES BOOKS(ISBN)
);

-- =====================================
-- Suggested Indexes
-- =====================================
CREATE INDEX idx_books_isbn ON BOOKS(ISBN);
CREATE INDEX idx_customers_id ON CUSTOMERS(CustomerID);
CREATE INDEX idx_purchases_customer ON PURCHASES(CustomerID);
CREATE INDEX idx_reviews_customer ON REVIEWS(CustomerID);
CREATE INDEX idx_reorders_admin ON REORDERS(AdminID);