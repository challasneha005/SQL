create database bank;
SHOW DATABASES;
use bank;
create table BankCustomers(
customer_id int primary key auto_increment,
first_name varchar(50),
last_name varchar(50),
dob date,
email varchar(100) unique,
phone varchar(15),
address varchar(200));
 -- sample data
INSERT INTO BankCustomers (first_name, last_name, dob, email, phone, address)
VALUES
('Rahul', 'Sharma', '1990-05-15', 'rahul.sharma@email.com', '9876500001', 'Delhi'),
('Priya', 'Iyer', '1985-09-20', 'priya.iyer@email.com', '9876500002', 'Mumbai'),
('Amit', 'Kumar', '1992-12-10', 'amit.kumar@email.com', '9876500003', 'Bangalore'),
('Sneha', 'Patel', '1995-03-18', 'sneha.patel@email.com', '9876500004', 'Ahmedabad'),
('Karan', 'Mehta', '1988-07-22', 'karan.mehta@email.com', '9876500005', 'Pune'),
('Alok', 'Singh', '1975-04-12', 'alok.singh@email.com', '9876500006', 'Lucknow'),
('Divya', 'Rao', '1998-11-30', 'divya.rao@email.com', '9876500007', 'Hyderabad'),
('Vikram', 'Joshi', '1982-08-05', 'vikram.joshi@email.com', '9876500008', 'Chennai'),
('Pooja', 'Desai', '1993-02-18', 'pooja.desai@email.com', '9876500009', 'Surat'),
('Ravi', 'Verma', '1990-01-12', 'ravi.verma@email.com', '9876500010', 'Jaipur'),
('Neha', 'Shukla', '1989-06-25', 'neha.shukla@email.com', '9876500011', 'Kanpur'),
('Arjun', 'Kapoor', '1991-04-05', 'arjun.kapoor@email.com', '9876500012', 'Delhi'),
('Meena', 'Nair', '1983-11-22', 'meena.nair@email.com', '9876500013', 'Kochi'),
('Rakesh', 'Gupta', '1987-03-29', 'rakesh.gupta@email.com', '9876500014', 'Indore'),
('Shalini', 'Mishra', '1994-09-10', 'shalini.mishra@email.com', '9876500015', 'Patna'),
('Deepak', 'Reddy', '1996-12-05', 'deepak.reddy@email.com', '9876500016', 'Hyderabad'),
('Sunita', 'Malhotra', '1979-07-19', 'sunita.malhotra@email.com', '9876500017', 'Chandigarh'),
('Anil', 'Yadav', '1986-10-28', 'anil.yadav@email.com', '9876500018', 'Nagpur'),
('Rajesh', 'Pillai', '1990-02-16', 'rajesh.pillai@email.com', '9876500019', 'Thiruvananthapuram'),
('Nisha', 'Bhatia', '1992-08-14', 'nisha.bhatia@email.com', '9876500020', 'Bhopal'),
('Suresh', 'Nair', '1984-01-30', 'suresh.nair@email.com', '9876500021', 'Kozhikode'),
('Komal', 'Agarwal', '1997-05-25', 'komal.agarwal@email.com', '9876500022', 'Noida'),
('Rohit', 'Chauhan', '1981-09-17', 'rohit.chauhan@email.com', '9876500023', 'Gurgaon'),
('Tanya', 'Jain', '1993-06-09', 'tanya.jain@email.com', '9876500024', 'Udaipur'),
('Mohit', 'Bansal', '1980-12-01', 'mohit.bansal@email.com', '9876500025', 'Delhi');
select * from BankCustomers;
 
 create table BankAccounts(
 account_id int primary key auto_increment,
 customer_id int,
 account_type varchar(50),
 balance decimal(15,2) default 0.00,
 opened_date date default(current_date()),
 foreign key (customer_id) references BankCustomers(customer_id));
  -- sample data
INSERT INTO BankAccounts (customer_id, account_type, balance, opened_date)
VALUES
(1, 'Savings', 5000.00, '2020-01-10'),
(2, 'Current', 12000.50, '2019-05-15'),
(3, 'Savings', 30000.00, '2021-11-01'),
(4, 'Savings', 15000.75, '2022-07-22'),
(5, 'Current', 25000.00, '2018-02-14'),
(6, 'Savings', 22000.00, '2020-09-01'),
(7, 'Current', 75000.00, '2021-03-15'),
(8, 'Savings', 18000.00, '2022-06-10'),
(9, 'Savings', 95000.00, '2021-12-05'),
(10, 'Current', 40000.00, '2023-01-22'),
(11, 'Savings', 17000.00, '2019-04-18'),
(12, 'Savings', 28000.00, '2020-11-09'),
(13, 'Current', 35000.00, '2021-08-25'),
(14, 'Savings', 45000.00, '2022-03-30'),
(15, 'Current', 21000.00, '2018-07-12'),
(16, 'Savings', 31000.00, '2019-10-05'),
(17, 'Current', 27000.00, '2020-02-14'),
(18, 'Savings', 60000.00, '2022-09-19'),
(19, 'Current', 90000.00, '2021-05-11'),
(20, 'Savings', 24000.00, '2019-06-22'),
(21, 'Savings', 38000.00, '2020-08-15'),
(22, 'Current', 42000.00, '2018-11-03'),
(23, 'Savings', 53000.00, '2021-07-07'),
(24, 'Savings', 47000.00, '2022-10-10'),
(25, 'Current', 15000.00, '2023-04-04');
select * from BankAccounts;
  
create table Transactions(
  txn_id int primary key auto_increment,
  account_id int,
  txn_type varchar(10),
  amount decimal(15,2),
  description varchar(225),
  foreign key (account_id) references BankAccounts(account_id));
  -- sample data
INSERT INTO Transactions (account_id, txn_type, amount, description)
VALUES
(1, 'credit', 2000.00, 'Salary Deposit'),
(1, 'debit', 500.00, 'ATM Withdrawal'),
(2, 'credit', 10000.00, 'Business Payment'),
(3, 'debit', 2000.00, 'Online Shopping'),
(4, 'credit', 5000.00, 'Freelance Income'),
(5, 'debit', 1200.00, 'Restaurant Bill'),
(6, 'credit', 7000.00, 'Dividend Income'),
(7, 'debit', 3000.00, 'EMI Payment'),
(8, 'credit', 4500.00, 'Cash Deposit'),
(9, 'debit', 8000.00, 'Travel Booking'),
(10, 'credit', 15000.00, 'Bonus'),
(11, 'debit', 600.00, 'Grocery Shopping'),
(12, 'credit', 2200.00, 'Rent Received'),
(13, 'debit', 4000.00, 'Car EMI'),
(14, 'credit', 12000.00, 'Stock Profits'),
(15, 'debit', 2500.00, 'Mobile Recharge'),
(16, 'credit', 3000.00, 'Cash Deposit'),
(17, 'debit', 1800.00, 'Fuel Payment'),
(18, 'credit', 9500.00, 'Salary'),
(19, 'debit', 7000.00, 'Insurance Payment'),
(20, 'credit', 11000.00, 'Project Income'),
(21, 'debit', 2000.00, 'Movie Tickets'),
(22, 'credit', 5000.00, 'Gift Received'),
(23, 'debit', 3500.00, 'Shopping Mall'),
(24, 'credit', 8000.00, 'Refund'),
(25, 'debit', 4000.00, 'Electricity Bill');
  
  select * from Transactions;
 
 create table BankLoans(
 loan_id int primary key auto_increment,
 customer_id int,
 loan_type varchar(50),
 loan_amount decimal(15,2),
 interest_rate decimal(5,2),
 start_date date,
 end_date date,
 foreign key (customer_id) references BankCustomers(customer_id));
 -- sample data
 INSERT INTO BankLoans (customer_id, loan_type, loan_amount, interest_rate, start_date, end_date)
VALUES
(1, 'Home Loan', 1500000.00, 7.50, '2020-06-01', '2030-06-01'),
(2, 'Car Loan', 800000.00, 8.00, '2021-01-10', '2026-01-10'),
(3, 'Education Loan', 500000.00, 6.50, '2022-08-15', '2027-08-15'),
(4, 'Personal Loan', 250000.00, 11.00, '2022-09-01', '2025-09-01'),
(5, 'Gold Loan', 100000.00, 9.00, '2023-02-10', '2024-02-10'),
(6, 'Business Loan', 2000000.00, 10.00, '2021-01-15', '2026-01-15'),
(7, 'Car Loan', 600000.00, 8.50, '2022-11-05', '2027-11-05'),
(8, 'Home Loan', 1200000.00, 7.25, '2020-07-01', '2030-07-01'),
(9, 'Education Loan', 400000.00, 6.75, '2021-08-01', '2026-08-01'),
(10, 'Personal Loan', 150000.00, 12.00, '2019-04-01', '2022-04-01'),
(11, 'Car Loan', 550000.00, 8.75, '2020-03-15', '2025-03-15'),
(12, 'Home Loan', 1800000.00, 7.40, '2021-09-20', '2031-09-20'),
(13, 'Gold Loan', 75000.00, 9.20, '2022-12-01', '2023-12-01'),
(14, 'Education Loan', 600000.00, 6.80, '2020-05-12', '2025-05-12'),
(15, 'Business Loan', 2500000.00, 10.50, '2019-02-01', '2029-02-01'),
(16, 'Home Loan', 2000000.00, 7.35, '2021-07-10', '2031-07-10'),
(17, 'Car Loan', 450000.00, 8.30, '2022-01-05', '2027-01-05'),
(18, 'Personal Loan', 120000.00, 11.20, '2023-03-11', '2026-03-11'),
(19, 'Education Loan', 700000.00, 6.55, '2021-10-25', '2026-10-25'),
(20, 'Gold Loan', 95000.00, 9.10, '2022-06-30', '2023-06-30'),
(21, 'Business Loan', 1800000.00, 10.00, '2020-08-14', '2025-08-14'),
(22, 'Car Loan', 500000.00, 8.40, '2021-09-09', '2026-09-09'),
(23, 'Home Loan', 1600000.00, 7.60, '2019-11-17', '2029-11-17'),
(24, 'Personal Loan', 200000.00, 11.50, '2022-02-22', '2025-02-22'),
(25, 'Education Loan', 450000.00, 6.70, '2023-04-04', '2028-04-04');
 
 select * from BankLoans;
 -- deletes row
 truncate table BankLoans;
 show databases;
 use bank;
 show tables;
 -- deletes table
 drop table Transactions;
 drop table BankLoans;
 -- deletes database
 drop database bank;
