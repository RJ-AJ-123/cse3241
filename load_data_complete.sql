-- Inserting data into PUBLISHERS table

INSERT INTO PUBLISHERS (PublisherName, Email, Address, ContactNumber) VALUES

-- Inserting data into BOOKS table

INSERT INTO BOOKS (ISBN, title, authors, publisherName, year, price, category, stockThreshold) VALUES

-- Inserting data into ADMINISTRATORS table

INSERT INTO ADMINISTRATORS (Email, AdminID, Name, ContactNumber) VALUES

-- Inserting data into CUSTOMERS table

INSERT INTO CUSTOMERS (CustomerID, ContactNumber, Name, Address, Email) VALUES

-- Inserting data into PURCHASES table

INSERT INTO PURCHASES (PurchaseID, CustomerID, OrderStatus, PurchaseDate, TotalAmount) VALUES

-- Inserting data into PROMOTIONS table

INSERT INTO PROMOTIONS (PromotionID, PromotionName, DiscountPercentage, StartDate, EndDate, ISBN, AdminID) VALUES

-- Inserting data into INVENTORY table

INSERT INTO INVENTORY (ISBN, CurrentStock) VALUES

-- Inserting data into REVIEWS table

INSERT INTO REVIEWS (ReviewID, CustomerID, ISBN, Rating, ReviewText, ReviewDate) VALUES

-- Inserting data into PurchaseDetailReferences table

INSERT INTO PurchaseDetailReferences (PurchaseDetailsID, PurchaseID, ISBN) VALUES

-- Inserting data into PurchaseItemDetails table

INSERT INTO PurchaseItemDetails (PurchaseID, ISBN, Quantity, PricePerUnit) VALUES
