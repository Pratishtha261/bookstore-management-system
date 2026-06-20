# Bookstore Management System

## Project Overview

The Bookstore Management System is a SQL-based database project developed using PostgreSQL.
This project is designed to manage books, customers, and order records efficiently while demonstrating SQL concepts such as joins, filtering, aggregation, grouping, and analytical queries.

---

## Objectives

* Create a relational database for a bookstore
* Store books, customer, and order information
* Perform data retrieval using SQL queries
* Analyze sales and customer purchasing patterns
* Practice joins, aggregate functions, grouping, and filtering

---

## Skills Demonstrated

* SQL
* PostgreSQL
* Database Design
* Joins
* Aggregate Functions
* Query Optimization

---

## Project Files

* OnlineBookStore.sql
* Books.csv
* Customers.csv
* Orders.csv
* README.md

---

## Technologies Used

* PostgreSQL
* SQL
* Git
* GitHub

---

## Database Tables

### 1. Books Table

Stores details about books available in the bookstore.

| Column Name    | Data Type          |
| -------------- | ------------------ |
| Book_id        | SERIAL PRIMARY KEY |
| Title          | VARCHAR(100)       |
| Author         | VARCHAR(50)        |
| Genre          | VARCHAR(50)        |
| Published_Year | INT                |
| Price          | NUMERIC(10,2)      |
| Stock          | INT                |

---

### 2. Customers Table

Stores customer details.

| Column Name | Data Type          |
| ----------- | ------------------ |
| Customer_id | SERIAL PRIMARY KEY |
| Name        | VARCHAR(100)       |
| Email       | VARCHAR(100)       |
| Phone       | VARCHAR(15)        |
| City        | VARCHAR(50)        |
| Country     | VARCHAR(150)       |

---

### 3. Orders Table

Stores customer order records.

| Column Name  | Data Type          |
| ------------ | ------------------ |
| Order_id     | SERIAL PRIMARY KEY |
| Customer_id  | INT                |
| Book_id      | INT                |
| Order_date   | DATE               |
| Quantity     | INT                |
| Total_amount | NUMERIC(10,2)      |

---

## Database Creation

```sql id="vzce8d"
CREATE DATABASE OnlineBookstore;
```

---

## Table Creation Queries

### Books Table

```sql id="0t4rcm"
CREATE TABLE Books(
    Book_id SERIAL PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10,2),
    Stock INT
);
```

### Customers Table

```sql id="f7jjlu"
CREATE TABLE Customers(
    Customer_id SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
```

### Orders Table

```sql id="7u6vdv"
CREATE TABLE Orders(
    Order_id SERIAL PRIMARY KEY,
    Customer_id INT REFERENCES Customers(Customer_id),
    Book_id INT REFERENCES Books(Book_id),
    Order_date DATE,
    Quantity INT,
    Total_amount NUMERIC(10,2)
);
```

---

## Data Import

CSV files were imported into PostgreSQL tables for:

* Books
* Customers
* Orders

---

## Basic SQL Queries

Some SQL operations performed in this project:

* Retrieve books by genre
* Find books published after 1950
* List customers from Canada
* Show orders placed in November 2023
* Calculate total stock
* Find the most expensive book
* Retrieve orders above a certain amount
* List available genres
* Calculate total revenue

---

## Advanced SQL Queries

Advanced SQL concepts used:

* JOIN operations
* Aggregate functions
* GROUP BY and HAVING clauses
* Sales analysis
* Customer spending analysis
* Most frequently ordered books
* Remaining stock calculation

---

## Key Learnings

* Learned relational database design
* Practiced SQL joins and aggregate functions
* Worked with CSV data import in PostgreSQL
* Improved query writing and data analysis skills
* Understood inventory and sales tracking systems

---

## Conclusion

This project demonstrates the practical implementation of SQL concepts including:

* Table creation
* Data insertion
* Filtering
* Joins
* Grouping
* Aggregation
* Business analysis queries

using PostgreSQL.
