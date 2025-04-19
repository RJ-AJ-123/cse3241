-- 🔍 Query A: Books by Pratchett under $10
-- Find titles of books by Pratchett that cost less than $10
SELECT Title
FROM BOOKS
WHERE Authors = 'Pratchett' AND Price < 10;

-- 🔍 Query B: Purchases made by CustomerID 1
-- Get all titles and their purchase dates made by CustomerID 1
SELECT Title, PurchaseDate
FROM CUSTOMERS
JOIN PURCHASES ON CUSTOMERS.CustomerID = PURCHASES.CustomerID
JOIN PURCHASEDETAILS ON PURCHASES.PurchaseID = PURCHASEDETAILS.PurchaseID
JOIN BOOKS ON PURCHASEDETAILS.ISBN = BOOKS.ISBN
WHERE CUSTOMERS.CustomerID = 1;

-- 🔍 Query C: Books with fewer than 5 in stock
-- Find titles and ISBNs for books with fewer than 5 copies in inventory
SELECT Title, BOOKS.ISBN
FROM BOOKS
JOIN INVENTORY ON BOOKS.ISBN = INVENTORY.ISBN
WHERE CurrentStock < 5;

-- 🔍 Query D: Customers who purchased books by Pratchett
-- List customers and the titles of Pratchett books they purchased
SELECT CUSTOMERS.Name, BOOKS.Title
FROM CUSTOMERS
JOIN PURCHASES ON CUSTOMERS.CustomerID = PURCHASES.CustomerID
JOIN PURCHASEDETAILS ON PURCHASES.PurchaseID = PURCHASEDETAILS.PurchaseID
JOIN BOOKS ON PURCHASEDETAILS.ISBN = BOOKS.ISBN
WHERE BOOKS.Authors = 'Pratchett';

-- 🔍 Query E: Total books purchased by a customer
-- Find total number of books purchased by CustomerID 1
SELECT SUM(Quantity) AS TotalBooks, CUSTOMERS.Name
FROM CUSTOMERS
JOIN PURCHASES ON CUSTOMERS.CustomerID = PURCHASES.CustomerID
JOIN PURCHASEDETAILS ON PURCHASES.PurchaseID = PURCHASEDETAILS.PurchaseID
WHERE CUSTOMERS.CustomerID = 1;

-- 🔍 Query F: Most books purchased by a single customer
-- Find the customer who purchased the most books and how many
SELECT CUSTOMERS.Name, SUM(PURCHASEDETAILS.Quantity) AS TotalBooks
FROM CUSTOMERS
JOIN PURCHASES ON CUSTOMERS.CustomerID = PURCHASES.CustomerID
JOIN PURCHASEDETAILS ON PURCHASES.PurchaseID = PURCHASEDETAILS.PurchaseID
GROUP BY CUSTOMERS.CustomerID
ORDER BY TotalBooks DESC
LIMIT 1;

-- 🔍 View: TopBooksByRevenue
-- Shows books that generated the most revenue and number of copies sold
SELECT B.Title, B.Authors, SUM(PID.Quantity * PID.PricePerUnit) AS TotalRevenue, SUM(PID.Quantity) AS TotalCopiesSold
FROM BOOKS B
JOIN PurchaseDetailReferences ON B.ISBN = PurchaseDetailReferences.ISBN
JOIN PurchaseItemDetails PID ON PurchaseDetailReferences.PurchaseID = PID.PurchaseID
    AND PurchaseDetailReferences.ISBN = PID.ISBN
GROUP BY B.Title, B.Authors
ORDER BY TotalRevenue DESC;

-- 🔍 View: HighValueCustomers
-- Summarizes customer purchase activity with total spent and number of purchases
SELECT C.Name, C.Email, COUNT(P.PurchaseID) AS TotalPurchases, SUM(P.TotalAmount) AS TotalSpent
FROM CUSTOMERS C
JOIN PURCHASES P ON C.CustomerID = P.CustomerID
GROUP BY C.Name, C.Email
ORDER BY TotalSpent DESC;
