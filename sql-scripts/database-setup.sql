-- Sales Database Setup Script
-- Run this in SQL Server Management Studio

-- Create Database
CREATE DATABASE SalesAnalytics;
GO

USE SalesAnalytics;
GO

-- Create Tables
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50) NOT NULL,
    Description NVARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    CategoryID INT FOREIGN KEY REFERENCES Categories(CategoryID),
    UnitPrice DECIMAL(10,2) NOT NULL,
    Cost DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
    City NVARCHAR(50),
    State NVARCHAR(50),
    Country NVARCHAR(50),
    CustomerType NVARCHAR(20)
);

CREATE TABLE SalesReps (
    SalesRepID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    HireDate DATE,
    Territory NVARCHAR(50),
    CommissionRate DECIMAL(5,4)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    SalesRepID INT FOREIGN KEY REFERENCES SalesReps(SalesRepID),
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    OrderStatus NVARCHAR(20),
    TotalAmount DECIMAL(12,2),
    DiscountPercent DECIMAL(5,2) DEFAULT 0
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Discount DECIMAL(5,2) DEFAULT 0
);

PRINT 'Database schema created successfully!';
