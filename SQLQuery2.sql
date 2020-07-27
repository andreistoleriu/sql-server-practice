USE master
GO
IF NOT EXISTS (
   SELECT name
   FROM sys.databases
   WHERE name = N'TutorialDB'
)
CREATE DATABASE [TutorialDB]
GO

ALTER DATABASE [TutorialDB] SET QUERY_STORE=ON
GO

USE [TutorialDB]
-- Create a new table called 'Customers' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
DROP TABLE dbo.Customers
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customers
(
   CustomerId        INT    NOT NULL   PRIMARY KEY, -- primary key column
   Name      [NVARCHAR](50)  NOT NULL,
   Location  [NVARCHAR](50)  NOT NULL,
   Email     [NVARCHAR](50)  NOT NULL
);
GO

-- Insert rows into table 'Customers'
INSERT INTO dbo.Customers
   ([CustomerId],[Name],[Location],[Email])
VALUES
   ( 1, N'Orlando', N'Australia', N''),
   ( 2, N'Keith', N'India', N'keith0@adventure-works.com'),
   ( 3, N'Donna', N'Germany', N'donna0@adventure-works.com'),
   ( 4, N'Janet', N'United States', N'janet1@adventure-works.com')
GO

 -- Select rows from table 'Customers'
 SELECT * FROM dbo.Customers;


 INSERT INTO dbo.Customers
   ([CustomerId],[Name],[Location],[Email])
VALUES
   ( 5, N'Orlando', N'Australia', N''),
   ( 6, N'Keith', N'India', N'keith0@adventure-works.com'),
   ( 7, N'Donna', N'Germany', N'donna0@adventure-works.com'),
   ( 8, N'Janet', N'United States', N'janet1@adventure-works.com')
GO

 SELECT * FROM dbo.Customers WHERE Location = 'Australia';

 SELECT DISTINCT Name FROM dbo.Customers;

 SELECT * FROM Customers 
 ORDER BY Name;
CREATE DATABASE [ProductsDB];

USE [ProductsDB]

-- Create a new table called 'Products' in schema 'dbo';
CREATE TABLE dbo.Products
(
	ProductId	INT	NOT NULL PRIMARY KEY IDENTITY(1,1),
	Title	[NVARCHAR](50) NOT NULL,
	Description [NVARCHAR](100) NOT NULL,
	Price [NUMERIC] NOT NULL
);
GO

CREATE TABLE dbo.Orders
(
	OrderId	INT	NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name	[NVARCHAR](30) NOT NULL,
	Contact_details [NVARCHAR](100) NOT NULL,
	Price [NUMERIC](10, 2) NOT NULL
);
GO

CREATE TABLE dbo.OrderProducts
(
	OrderProductId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	ProductId  INT FOREIGN KEY REFERENCES dbo.Products(ProductId),
	OrderId INT FOREIGN KEY REFERENCES dbo.Orders(OrderId)
);
GO

INSERT INTO dbo.Products
   ([Title],[Description],[Price])
VALUES
   ( 'Samsung S20', 'Telefon mobil Samsung S20', '1399.99'),
   ( 'Huawei P40Pro', 'Telefon mobil Huawei P40Pro', '999.99'),
   ( 'Iphone 11', 'Telefon mobil Apple Iphone 11', '1099.99'),
   ( 'Oneplus 8 Pro', 'Telefon mobil Oneplus 8 Pro', '1299.99')
GO

SELECT * FROM dbo.Products;
GO

INSERT INTO dbo.Products
   ([Title],[Description],[Price])
VALUES
   ( 'Samsung S20', 'Telefon mobil Samsung S20', '1399.99'),
   ( 'Huawei P40Pro', 'Telefon mobil Huawei P40Pro', '999.99'),
   ( 'Iphone 11', 'Telefon mobil Apple Iphone 11', '1099.99'),
   ( 'Oneplus 8 Pro', 'Telefon mobil Oneplus 8 Pro', '1299.99')
GO

INSERT INTO dbo.Orders
   ([Name],[Contact_details],[Price])
VALUES
   ( 'Orlando', 'orlando0@adventure-works.com', '5399.99'),
   ( 'Keith', 'keith0@adventure-works.com', '3999.99'),
   ( 'Donna', 'donna1@adventure-works.com', '6099.99'),
   ( 'Janet', 'janet2@adventure-works.com', '4299.99')
GO

SELECT DISTINCT Title, Description, Price FROM dbo.Products;

SELECT DISTINCT Name FROM dbo.Orders;

SELECT * FROM dbo.OrderProducts;
GO

INSERT INTO dbo.OrderProducts
   ([ProductId],[OrderId])
VALUES
   ( '1', '1'),
   ( '3', '1'),
   ( '4', '1'),
   ( '2', '2'),
   ( '1', '2'),
   ( '1', '3'),
   ( '2', '3'),
   ( '3', '3')
GO

 SELECT * FROM orders WHERE orders.OrderId = 1;

SELECT	OrderProducts.OrderId,
		Products.ProductId,
		Products.Title,
		Products.Price
		FROM OrderProducts
		JOIN Products
		ON Products.ProductId = OrderProducts.ProductId
		WHERE OrderProducts.OrderId = 3
UNION 
SELECT	OrderProducts.OrderId,
		Products.ProductId,
		Products.Title,
		Products.Price
		FROM OrderProducts
		JOIN Products
		ON Products.ProductId = OrderProducts.ProductId
		WHERE OrderProducts.OrderId = 2
UNION
SELECT	OrderProducts.OrderId,
		Products.ProductId,
		Products.Title,
		Products.Price
		FROM OrderProducts
		JOIN Products
		ON Products.ProductId = OrderProducts.ProductId
		WHERE OrderProducts.OrderId = 1;
GO



