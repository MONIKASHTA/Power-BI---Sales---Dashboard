-- Sample Data for Sales Database
USE SalesAnalytics;
GO

-- Insert Categories
INSERT INTO Categories (CategoryName, Description) VALUES
('Electronics', 'Electronic devices and gadgets'),
('Clothing', 'Apparel and fashion items'),
('Home & Garden', 'Home improvement and garden supplies'),
('Sports', 'Sports equipment and athletic wear'),
('Books', 'Books and educational materials');

-- Insert sample products, customers, sales reps, and orders
INSERT INTO Products (ProductName, CategoryID, UnitPrice, Cost, StockQuantity) VALUES
('Wireless Headphones', 1, 79.99, 35.00, 150),
('Cotton T-Shirt', 2, 19.99, 7.50, 400),
('LED Desk Lamp', 3, 39.99, 18.00, 100);

INSERT INTO Customers (FirstName, LastName, Email, City, State, Country, CustomerType) VALUES
('John', 'Smith', 'john.smith@email.com', 'New York', 'NY', 'USA', 'Individual'),
('TechCorp Inc', '', 'orders@techcorp.com', 'Seattle', 'WA', 'USA', 'Business');

PRINT 'Sample data inserted successfully!';
