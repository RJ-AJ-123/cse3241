
CREATE INDEX idx_customer_id ON Customers(CustomerID);
CREATE INDEX idx_books_isbn ON Books(ISBN);
CREATE INDEX idx_purchase_customer_id ON Purchases(CustomerID);
CREATE INDEX idx_purchasedetails_purchaseid ON PurchaseDetails(PurchaseID);
CREATE INDEX idx_purchasedetails_isbn ON PurchaseDetails(ISBN);
CREATE INDEX idx_reviews_customerid ON Reviews(CustomerID);
CREATE INDEX idx_reviews_isbn ON Reviews(ISBN);
CREATE INDEX idx_promotions_isbn ON Promotions(ISBN);
CREATE INDEX idx_reorders_isbn ON Reorders(ISBN);
CREATE INDEX idx_reorders_adminid ON Reorders(AdminID);
