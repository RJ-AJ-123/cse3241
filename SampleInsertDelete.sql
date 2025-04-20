
-- ====================================
-- SAMPLE INSERTS (Based on Schema)
-- ====================================

-- 1. Insert a new Publisher
INSERT INTO PUBLISHERS (PublisherName, Email, Address, ContactNumber)
VALUES ('Sample Publisher', 'sample@example.com', '123 Sample Street, Sample City', '123-456-7890');

-- 2. Insert a new Book that references the above Publisher
INSERT INTO BOOKS (ISBN, Title, Authors, PublisherName, Year, Price, Category, StockThreshold)
VALUES ('9991112223334', 'Sample Book Title', 'John Sample', 'Sample Publisher', 2025, 19.99, 'Philosophy', 5);

-- 3. Insert corresponding Inventory entry
INSERT INTO INVENTORY (ISBN, CurrentStock)
VALUES ('9991112223334', 10);

-- 4. Insert a new Customer
INSERT INTO CUSTOMERS (CustomerID, ContactNumber, Name, Address, Email)
VALUES (999, '999-999-9999', 'Sample Customer', '999 Fiction Lane, Imaginaria', 'samplecustomer@example.com');

-- 5. Insert a new Purchase by that Customer
INSERT INTO PURCHASES (PurchaseID, CustomerID, OrderStatus, PurchaseDate, TotalAmount)
VALUES (999, 999, 'Pending', '2025-04-19', 19.99);

-- 6. Reference the book in PurchaseDetailReferences
INSERT INTO PurchaseDetailReferences (PurchaseDetailsID, PurchaseID, ISBN)
VALUES (999, 999, '9991112223334');

-- 7. Add item details for the purchase
INSERT INTO PurchaseItemDetails (PurchaseID, ISBN, Quantity, PricePerUnit)
VALUES (999, '9991112223334', 1, 19.99);

-- 8. Add a Review
INSERT INTO REVIEWS (ReviewID, CustomerID, ISBN, Rating, ReviewText, ReviewDate)
VALUES (999, 999, '9991112223334', 5, 'This is a sample review for testing.', '2025-04-19');

-- ====================================
-- SAMPLE DELETES (Reversing the Inserts)
-- ====================================

-- 1. Delete dependent Review
DELETE FROM REVIEWS WHERE ReviewID = 999;

-- 2. Delete Purchase Item Details
DELETE FROM PurchaseItemDetails WHERE PurchaseID = 999 AND ISBN = '9991112223334';

-- 3. Delete Purchase Detail Reference
DELETE FROM PurchaseDetailReferences WHERE PurchaseDetailsID = 999;

-- 4. Delete Purchase
DELETE FROM PURCHASES WHERE PurchaseID = 999;

-- 5. Delete Inventory entry
DELETE FROM INVENTORY WHERE ISBN = '9991112223334';

-- 6. Delete Book
DELETE FROM BOOKS WHERE ISBN = '9991112223334';

-- 7. Delete Publisher
DELETE FROM PUBLISHERS WHERE PublisherName = 'Sample Publisher';

-- 8. Delete Customer
DELETE FROM CUSTOMERS WHERE CustomerID = 999;
