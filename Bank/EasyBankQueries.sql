use bank;
-- 1. Show all customers.
select * from BankCustomers;

-- 2. Show first_name and last_name of all customers.
select first_name,last_name from BankCustomers;

-- 3. Show all accounts with balance greater than 20,000.
select * from BankAccounts where balance >20000;

-- 4. Show all customers born after 1990.
select * from BankCustomers where dob > '1990-01-01';

-- 5. List all transactions where amount > 5000.
select * from Transactions where amount > 5000;

-- 6. Get all loans with loan_type = 'Home Loan'.
select * from BankLoans where loan_type = 'Home Loan';

-- 7. Show accounts opened after 2021.
select * from BankAccounts where opened_date > '2021-01-01';

-- 8. Show distinct account types.
select distinct account_type from BankAccounts ;

-- 9. Show all credits from transactions
select * from Transactions where txn_type = 'credit';

-- 10. Show all debits from transactions.
select * from Transactions where txn_type = 'debit';


-- 11. Get customer_id and email of all customers from Delhi.
select customer_id,email from BankCustomers where address = 'Delhi';

-- 12. Find customers whose last_name is 'Sharma'.
select * from BankCustomers where last_name = 'Sharma';

-- 13. Show all accounts with balance between 10,000 and 50,000.
select * from BankAccounts where balance between 10000 and 50000;

-- 14. Show all customers with phone numbers starting with '98765'.
select * from BankCustomers where phone like '98765%';

-- 15. Count total number of customers.
select count(*) from BankCustomers;

-- 16. Count number of accounts.
select count(*) from BankAccounts;

-- 17. Count number of transactions.
select count(*) from Transactions;

-- 18. Count number of loans
select count(*) from BankLoans;

-- 19. Find maximum balance across all accounts.
select max(balance) from BankAccounts;

-- 20. Find minimum loan amount.
select min(loan_amount) from BankLoans;


-- 21. Find average balance of all accounts
select avg(balance) from BankAccounts;

-- 22. Find total amount of all transactions.
select sum(amount) from Transactions;

-- 23. Show accounts with balance = 0.
select * from BankAccounts where balance = 0;

select * from Transactions;

-- 24. Show all Salary Deposit description from transactions  
select * from Transactions where description = 'Salary Deposit';


-- 25. Show customer_id of customers who took a 'Car Loan'.
select customer_id from BankLoans where loan_type = 'Car Loan';