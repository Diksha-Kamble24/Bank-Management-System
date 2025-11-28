CREATE DATABASE BankManagement;
USE BankManagement;

-- Bank Table--
CREATE TABLE Bank (
    Id VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

-- Branch Table--
CREATE TABLE Branch (
    Id VARCHAR(10) PRIMARY KEY,
    BankId VARCHAR(10),
    
    cqqqq
    Address VARCHAR(150),
    Manager VARCHAR(50),
    FOREIGN KEY (BankId) REFERENCES Bank(Id)
);

-- Customer Table--
CREATE TABLE Customer (
    Id VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Account Table--
CREATE TABLE Account (
    Id VARCHAR(10) PRIMARY KEY,
    BranchId VARCHAR(10),
    CustomerId VARCHAR(10),
    AccountType VARCHAR(50),
    Balance FLOAT,
    FOREIGN KEY (BranchId) REFERENCES Branch(Id),
    FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
);

-- Loan Table--
CREATE TABLE Loan (
    Id VARCHAR(10) PRIMARY KEY,
    CustomerId VARCHAR(10),
    Amount FLOAT,
    InterestRate FLOAT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (CustomerId) REFERENCES Customer(Id)
);

-- Transaction Table--
CREATE TABLE Transaction (
    Id VARCHAR(10) PRIMARY KEY,
    AccountId VARCHAR(10),
    Date DATETIME,
    Amount FLOAT,
    Type VARCHAR(20), -- deposit or withdrawal
    FOREIGN KEY (AccountId) REFERENCES Account(Id)
);
-- Banks--
INSERT INTO Bank VALUES
('B1', 'State Bank of India', 'Mumbai'),
('B2', 'HDFC Bank', 'Delhi'),
('B3', 'ICICI Bank', 'Bangalore');

-- Branches--
INSERT INTO Branch VALUES
('BR1', 'B1', 'Andheri, Mumbai', 'Rajesh Singh'),
('BR2', 'B1', 'Thane, Mumbai', 'Priya Sharma'),
('BR3', 'B2', 'Connaught Place, Delhi', 'Arun Mehta'),
('BR4', 'B2', 'Dwarka, Delhi', 'Sneha Nair'),
('BR5', 'B3', 'MG Road, Bangalore', 'Vikram Joshi'),
('BR6', 'B3', 'Whitefield, Bangalore', 'Meena Gupta'),
('BR7', 'B1', 'Borivali, Mumbai', 'Rohit Kumar'),
('BR8', 'B2', 'Karol Bagh, Delhi', 'Kavita Verma'),
('BR9', 'B3', 'JP Nagar, Bangalore', 'Suresh Rao'),
('BR10', 'B1', 'Navi Mumbai', 'Anita Patil');

-- Customers--
INSERT INTO Customer VALUES
('C1', 'Amit', 'Sharma', '9876543210', 'amit@gmail.com'),
('C2', 'Priya', 'Verma', '9123456780', 'priya@gmail.com'),
('C3', 'Rahul', 'Kumar', '9988776655', 'rahul@gmail.com'),
('C4', 'Sneha', 'Patil', '9090909090', 'sneha@gmail.com'),
('C5', 'Arjun', 'Mehta', '9191919191', 'arjun@gmail.com'),
('C6', 'Kavita', 'Joshi', '8888888888', 'kavita@gmail.com'),
('C7', 'Rohan', 'Desai', '7777777777', 'rohan@gmail.com'),
('C8', 'Neha', 'Kapoor', '6666666666', 'neha@gmail.com'),
('C9', 'Manish', 'Gupta', '9999999999', 'manish@gmail.com'),
('C10', 'Pooja', 'Reddy', '9555555555', 'pooja@gmail.com');

-- Accounts--
INSERT INTO Account VALUES
('A1', 'BR1', 'C1', 'Savings', 15000),
('A2', 'BR2', 'C2', 'Current', 25000),
('A3', 'BR3', 'C3', 'Savings', 12000),
('A4', 'BR4', 'C4', 'Savings', 18000),
('A5', 'BR5', 'C5', 'Current', 50000),
('A6', 'BR6', 'C6', 'Savings', 22000),
('A7', 'BR7', 'C7', 'Current', 30000),
('A8', 'BR8', 'C8', 'Savings', 27000),
('A9', 'BR9', 'C9', 'Current', 35000),
('A10', 'BR10', 'C10', 'Savings', 40000);

-- Loans--
INSERT INTO Loan VALUES
('L1', 'C1', 50000, 8.5, '2025-01-01', '2026-01-01'),
('L2', 'C2', 75000, 9.0, '2025-02-15', '2026-02-15'),
('L3', 'C3', 60000, 7.5, '2025-03-01', '2026-03-01'),
('L4', 'C4', 90000, 10.0, '2025-04-01', '2026-04-01'),
('L5', 'C5', 120000, 8.0, '2025-05-01', '2026-05-01'),
('L6', 'C6', 55000, 9.5, '2025-06-01', '2026-06-01'),
('L7', 'C7', 80000, 7.8, '2025-07-01', '2026-07-01'),
('L8', 'C8', 45000, 8.2, '2025-08-01', '2026-08-01'),
('L9', 'C9', 100000, 9.0, '2025-09-01', '2026-09-01'),
('L10', 'C10', 95000, 7.9, '2025-09-05', '2026-09-05');

-- Transactions--
INSERT INTO Transaction VALUES
('T1', 'A1', '2025-09-01', 5000, 'deposit'),
('T2', 'A2', '2025-09-02', 2000, 'withdrawal'),
('T3', 'A3', '2025-09-03', 4000, 'deposit'),
('T4', 'A4', '2025-09-04', 1500, 'withdrawal'),
('T5', 'A5', '2025-09-05', 7000, 'deposit'),
('T6', 'A6', '2025-09-06', 2500, 'withdrawal'),
('T7', 'A7', '2025-09-07', 6000, 'deposit'),
('T8', 'A8', '2025-09-08', 3500, 'withdrawal'),
('T9', 'A9', '2025-09-09', 8000, 'deposit'),
('T10', 'A10', '2025-09-10', 4500, 'withdrawal');


-- 1. List all branches with their bank name
SELECT br.Id AS BranchID, br.Address, br.Manager, b.Name AS BankName
FROM Branch br
JOIN Bank b ON br.BankId = b.Id;
-- 2. Show all customers with their account details -- 
SELECT c.Id AS CustomerID, c.FirstName, c.LastName, a.Id AS AccountID, a.AccountType, a.Balance
FROM Customer c
JOIN Account a ON c.Id = a.CustomerId;

-- 3. Find all branches under "State Bank of India" == 
SELECT b.Name AS BankName, br.Id AS BranchID, br.Address, br.Manager
FROM Bank b
JOIN Branch br ON b.Id = br.BankId
WHERE b.Name = 'State Bank of India';

-- 4 Customers who have taken a loan more than the average loan amount
SELECT FirstName, LastName
FROM Customer
WHERE Id IN (
    SELECT CustomerId
    FROM Loan
    WHERE Amount > (SELECT AVG(Amount) FROM Loan)
);

-- 5 Accounts that have balance greater than the minimum loan amount
SELECT Id, AccountType, Balance
FROM Account
WHERE Balance > (SELECT MIN(Amount) FROM Loan);