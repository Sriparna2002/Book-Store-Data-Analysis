USE ONLINEBOOKSTORE;
-- 1) Retrieve the total number of books sold for each genre:
SELECT B.GENRE, SUM(O.QUANTITY) AS TOTAL_NUMBER_OF_BOOKS
FROM BOOKS B 
JOIN ORDERS O
ON B.BOOK_ID = O.BOOK_ID
GROUP BY B.GENRE; 

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(PRICE) AS AVERAGE_PRICE
FROM BOOKS
WHERE GENRE = 'FANTASY';

-- 3) List customers who have placed at least 2 orders:
SELECT O.CUSTOMER_ID , C.NAME, COUNT(O.ORDER_ID) AS TOTAL_ORDER
FROM CUSTOMERS C 
JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY O.CUSTOMER_ID, C.NAME
HAVING COUNT(ORDER_ID) >= 2;

-- 4) Find the most frequently ordered book:
SELECT O.BOOK_ID, B.TITLE, COUNT(O.ORDER_ID) AS TOTAL_COUNT
FROM BOOKS B
JOIN ORDERS O 
ON B.BOOK_ID = O.BOOK_ID
GROUP BY O.BOOK_ID, B.TITLE
ORDER BY TOTAL_COUNT DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT * 
FROM BOOKS
WHERE GENRE = 'FANTASY'
ORDER BY PRICE DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT B.AUTHOR, SUM(O.QUANTITY) AS TOTAL_QUANTITY
FROM BOOKS B
JOIN ORDERS O 
ON B.BOOK_ID = O.BOOK_ID
GROUP BY B.AUTHOR;



-- 7) List the cities where customers who spent over $30 are located:
SELECT C.CITY, O.TOTAL_AMOUNT 
FROM CUSTOMERS C 
JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE O.TOTAL_AMOUNT > 30;

-- 8) Find the customer who spent the most on orders:
SELECT C.CUSTOMER_ID,C.NAME, SUM(O.TOTAL_AMOUNT) AS TOTAL_SPENT
FROM CUSTOMERS C 
JOIN ORDERS O 
ON C.CUSTOMER_ID = O.CUSTOMER_ID
GROUP BY C.CUSTOMER_ID, C.NAME
ORDER BY TOTAL_SPENT DESC
LIMIT 1;

-- 9) Calculate the stock remaining after fulfilling all orders:

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;