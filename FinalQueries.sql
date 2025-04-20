

-- SECTION 1: Book Info and Inventory
-- Get all books along with their current stock
SELECT B.Title, B.ISBN, I.CurrentStock
FROM BOOKS B
JOIN INVENTORY I ON B.ISBN = I.ISBN;

-- SECTION 2: Promotions Overview
-- List all active promotions with associated book titles
SELECT P.PromotionName, P.DiscountPercentage, P.StartDate, P.EndDate, B.Title
FROM PROMOTIONS P
JOIN BOOKS B ON P.ISBN = B.ISBN
WHERE date('now') BETWEEN P.StartDate AND P.EndDate;

-- SECTION 3: Customer Purchases
-- Fetch customer names and their total purchase amounts
SELECT C.Name, SUM(P.TotalAmount) AS TotalSpent
FROM CUSTOMERS C
JOIN PURCHASES P ON C.CustomerID = P.CustomerID
GROUP BY C.CustomerID;

-- SECTION 4: Book Ratings
-- List books with their average rating
SELECT B.Title, AVG(R.Rating) AS AvgRating
FROM BOOKS B
JOIN REVIEWS R ON B.ISBN = R.ISBN
GROUP BY B.ISBN;

-- SECTION 5: Low Stock Alerts
-- Show books where current stock is below the stock threshold
SELECT B.Title, I.CurrentStock, B.StockThreshold
FROM BOOKS B
JOIN INVENTORY I ON B.ISBN = I.ISBN
WHERE I.CurrentStock < B.StockThreshold;

-- SECTION 6: Top Reviewed Books
-- List top 5 books by number of reviews
SELECT B.Title, COUNT(R.ReviewID) AS ReviewCount
FROM BOOKS B
JOIN REVIEWS R ON B.ISBN = R.ISBN
GROUP BY B.ISBN
ORDER BY ReviewCount DESC
LIMIT 5;

-- SECTION 7: Recent Orders
-- Show recent 5 purchases with customer name and total
SELECT C.Name, P.PurchaseDate, P.TotalAmount
FROM PURCHASES P
JOIN CUSTOMERS C ON P.CustomerID = C.CustomerID
ORDER BY P.PurchaseDate DESC
LIMIT 5;

-- SECTION 8: Reorders Summary
-- Display reorder status for each book
SELECT B.Title, R.Quantity, R.Status
FROM REORDERS R
JOIN BOOKS B ON R.ISBN = B.ISBN;
