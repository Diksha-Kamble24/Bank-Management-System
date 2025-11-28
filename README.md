# 🏦 Bank Management System (SQL Project)

This project is a **Bank Management System** developed using SQL.  
It includes database creation, table structures, relationships, sample data insertion, and commonly used SQL queries for banking operations.

The goal of this project is to help users understand how a relational database works in a banking environment, including **banks**, **branches**, **customers**, **accounts**, **loans**, and **transactions**.

---

### ✔ Database & Table Creation
- `Bank` – Stores bank details  
- `Branch` – Stores branch information mapped to a bank  
- `Customer` – Customer personal details  
- `Account` – Account information linked to customers  
- `Loan` – Loan details for customers  
- `Transaction` – Deposit & withdrawal records  

### ✔ Foreign Key Relationships
- Branch → Bank  
- Account → Branch + Customer  
- Loan → Customer  
- Transaction → Account  

### ✔ Sample Data Inserted
The project inserts **10 records** each for:
- Banks  
- Branches  
- Customers  
- Accounts  
- Loans  
- Transactions  

This makes it easy to practice SQL queries on real-looking data.

---

## 🛠 Technologies Used
- **MySQL / SQL Server / MariaDB** (compatible)
- SQL constraints  
- Joins  
- Subqueries  

---
