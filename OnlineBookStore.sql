CREATE TABLE Books(
   Book_id SERIAL PRIMARY KEY,
   Title VARCHAR(100) NOT NULL,
   Author VARCHAR(50),
   Genre VARCHAR(50),
   Published_Year INT,
   Price NUMERIC(10,2),
   Stock INT
);

CREATE TABLE Customers(
Customer_id SERIAL PRIMARY KEY,
   Name VARCHAR(100),
   Email VARCHAR(100),
   Phone VARCHAR(15),
   City VARCHAR(50),
   Country VARCHAR(150)
);

CREATE TABLE Orders(
   Order_id SERIAL PRIMARY KEY,
   Customer_id INT REFERENCES Customers(Customer_id),
   Book_id INT REFERENCES Books(Book_id),
   Order_date DATE,
   Quantity INT,
   Total_amount NUMERIC(10,2)
);

--IMPORT CSV FILE 
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM '‪C:\Users\user\Desktop\SQL\Books.csv'
CSV HEADER;
 
COPY Customers(Customer_ID, Name, Email, Phone, City, Country)
FROM '‪C:\Users\user\Desktop\SQL\Customers.csv‪'
CSV HEADER; 

COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount)
FROM '‪C:\Users\user\Desktop\SQL\Orders.csv'
CSV HEADER;

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


--BASIC QUERIES

--RETRIEVE ALL BOOKS IN THE "Fiction" GENRE
SELECT * FROM Books 
WHERE genre='Fiction';

--FIND BOOKS PUBLISHED AFTER THE YEAR 1950
SELECT * FROM Books 
WHERE published_year > 1950;

--LIST ALL CUSTOMERS FROM CANADA
SELECT * FROM Customers
WHERE country='Canada';

--SHOW ORDERS PLACED IN NOVEMBER 2023
SELECT * FROM Orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

--RETRIEVE THE TOTAL STOCK OF BOOKS AVAILABLE
SELECT SUM(stock) AS total_stock FROM Books;

--FIND THE DETAILS OF THE MOST EXPENSIVE BOOK
SELECT * FROM Books ORDER BY price DESC;

--SHOW ALL THE CUSTOMERS WHO ORDERED MORE THEN 1 QUANTITY OF A BOOK
SELECT * FROM Orders
WHERE quantity > 1;

--RETRIVE ALL ORDERS WHERE TOTAL AMOUNT EXCEEDS $20
SELECT * FROM Orders 
WHERE total_amount > 20;

--LIST ALL GENRES AVAILABLE IN THE BOOK TABLE
SELECT DISTINCT genre FROM Books;
       
--FIND THE BOOK WITH THE LOWEST STOCK
SELECT * FROM Books ORDER BY stock
LIMIT 1;

--CALCULATE TOTAL REVENUE GENERATED FROM ALL ORDER
SELECT SUM(total_amount) AS total_revenue
FROM Orders;


--ADVANCE QUERIES

--RETRIEVE THE TOTAL NUMBER OF BOOKS SOLD FOR EACH GENRE
SELECT b.genre, SUM(o.quantity) AS total_books_sold
FROM Books b
JOIN
Orders o
ON b.book_id=o.book_id
GROUP BY b.genre;

--FIND THE AVERAGE PRICE OF BOOKS IN THE "Fantasy" GENRE
SELECT AVG(price) AS average_price FROM Books
WHERE genre='Fantasy';

--LIST CUSTOMERS WHO PLACED AT LEAST 2 ORDERS
SELECT o.customer_id ,c.name, COUNT(o.Order_id) AS order_count
FROM Orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY o.customer_id, c.name
HAVING COUNT(order_id) >=2;

--FIND THE MOST FREQUENTLY ORDERED BOOK
SELECT o.Book_id,b.Title, COUNT(o.Order_id) AS order_count
FROM Orders o
JOIN
Books b ON o.book_id=b.book_id
GROUP BY o.Book_id,b.title
ORDER BY order_count DESC 
LIMIT 1;

--SHOW THE TOP 3 MOST EXPENSIVE BOOKS OF 'Fantasy' GENRE
SELECT * FROM Books
WHERE Genre='Fantasy'
ORDER BY Price DESC
LIMIT 3;

--RETRIEVE THE TOTAL QUANTITY OF BOOKS SOLD BY EACH AUTHOR
SELECT b.author, SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN
Books b
ON o.book_id=b.book_id
GROUP BY b.author;

--LIST THE CITIES WHERE CUSTOMERS WHO SPENT OVER $30 ARE LOCATED
SELECT DISTINCT c.city, o.total_amount 
FROM customers c
JOIN
orders o
ON c.customer_id=o.customer_id
WHERE o.total_amount > 30;

--FIND THE CUSTOMER WHO SPENT THE MOST ON ORDERS
SELECT c.customer_id, c.name, SUM(o.total_amount) AS total_Spent
FROM orders o
JOIN
customers c
ON c.customer_id=o.customer_id
GROUP BY c.customer_id,c.name
ORDER BY total_Spent DESC
LIMIT 1;

--CALCULATE THE STOCK REMAINING AFTER FULFILLING ALL ORDERS
SELECT b.book_id,b.title,b.stock,COALESCE(SUM(o.quantity),0) AS order_quantity,
       b.stock - COALESCE(SUM(o.quantity),0) AS remaining_quantity
FROM books b
LEFT JOIN
orders o 
ON b.book_id=o.book_id 
GROUP BY b.book_id ORDER BY book_id;






























