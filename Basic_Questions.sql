use onlinebookstore;
-- 1) Retrieve all books in the "Fiction" genre:
SELECT *
FROM books
WHERE Genre = "Fiction";

-- 2) Find books published after the year 1950:
SELECT *
FROM books
WHERE Published_Year > '1950';

-- 3) List all customers from the Canada:
SELECT * 
FROM Customers
WHERE Country = 'Canada';

-- 4) Show orders placed in November 2023:
SELECT *
FROM orders
WHERE Order_Date BETWEEN '2023-11-01' AND "2023-11-30";

-- 5) Retrieve the total stock of books available:
SELECT SUM(stock) AS TOTAL_STOCK
FROM books;

 -- 6) Find the details of the most expensive book:
SELECT * 
FROM books 
ORDER BY Price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT *
FROM orders
WHERE Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT * 
FROM orders
WHERE Total_Amount > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT Genre 
FROM books; 

-- 10) Find the books with the lowest stock:
SELECT *
FROM books
ORDER BY Stock
LIMIT 5;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(Total_Amount) AS Revenue_Generated
FROM orders;

