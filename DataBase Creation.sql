CREATE DATABASE OnlineBookStore;
USE OnlineBookStore;

DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
	Book_ID INT PRIMARY KEY, 
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price DECIMAL(10,2),
    Stock INT
);

DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers (
	Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
	Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Book_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),
    FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY(Book_ID) REFERENCES Books(Book_ID)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


