-- medium joins,aggregates
use bank;
show tables;

-- 26. Show customers with their accounts.
select c.first_name,c.last_name,a.account_type,a.balance from BankCustomers c join BankAccounts a on c.customer_id = a.customer_id;

desc Transactions;
desc BankAccounts;
desc BankCustomers;
desc BankLoans;

-- 27. Show customers who made transactions.
select c.first_name,c.last_name,t.txn_type from BankCustomers c 
join BankAccounts a on c.customer_id = a.customer_id 
join Transactions t on a.account_id = t.account_id;

-- 28. Show all loans with customer names.
select c.first_name,c.last_name,l.loan_type from BankCustomers c join BankLoans l on c.customer_id = l.customer_id;
 
 -- 29. Find total balance per customer.
select c.first_name,c.last_name,sum(a.balance) from BankCustomers c join BankAccounts a  on c.customer_id = a.customer_id group by c.customer_id;
 
 -- 30. Find total transaction amount per account.
select account_id,sum(amount) as total_txn from Transactions group by account_id;
 
select account_id,sum(amount)  from Transactions group by account_id;
  
-- 31. Find average loan amount per loan_type.
select loan_type,avg(loan_amount)  as avg_loan from BankLoans group by loan_type;
    
select loan_type,avg(loan_amount) from BankLoans group by loan_type;
 
 -- 32. Find customers with more than one account.
select c.first_name,c.last_name,count(*) as accounts from BankCustomers c join BankAccounts a on c.customer_id = a.customer_id group by c.customer_id having count(*)>1;

SELECT customer_id, COUNT(*) AS accounts FROM BankAccounts GROUP BY customer_id HAVING COUNT(*) > 1;

-- 33. Find accounts with more than 2 transactions.
select account_id , count(*) as txn_times from Transactions group by account_id having count(*) > 2;

-- 34. Show customers with total loan > 1,000,000.
select c.first_name,c.last_name,sum(l.loan_amount) as totalLoan from BankCustomers c join BankLoans l on c.customer_id = l.customer_id group by c.customer_id having totalLoan > 1000000;

-- 35. Show customers with at least one debit transaction.
select c.first_name,c.last_name,sum(txn_type = 'debit') as debittxn from BankCustomers c join BankAccounts a on c.customer_id = a.customer_id join Transactions t on a.account_id = t.account_id group by c.customer_id having  debittxn >=1; 

SELECT DISTINCT c.first_name, c.last_name
FROM BankCustomers c
JOIN BankAccounts a ON c.customer_id = a.customer_id
JOIN BankTransactions t ON a.account_id = t.account_id
WHERE t.txn_type = 'debit';

-- 36. Show total credits vs debits.
select txn_type, sum(amount) as total from Transactions group by txn_type;

-- 37. Find customers with both Savings and Current accounts.
select c.first_name,c.last_name from BankCustomers c join BankAccounts a on a.customer_id = a.customer_id where a.account_type IN ('Savings', 'Current') group by c.customer_id, c.first_name, c.last_name HAVING COUNT(DISTINCT a.account_type) = 2;
 
 -- 38. Find highest balance account per customer.
 select customer_id,max(balance) as max_bal from BankAccounts group by customer_id;
 
 -- 39. Find total transactions per customer.
 select a.customer_id,count(t.amount) as total_txn from Transactions t join BankAccounts a on a.account_id = t.account_id group by a.customer_id; 
 
SELECT c.first_name, SUM(t.amount) AS total_txn
FROM BankCustomers c
JOIN BankAccounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
GROUP BY c.customer_id;

 -- 40. Find customers without loans.
select c.* from BankCustomers c left join BankLoans l  on c.customer_id = l.customer_id where l.customer_id is null;  

select *  from  BankCustomers where customer_id not in (select customer_id from BankLoans);

-- 42. Find customers without transactions.
select a.customer_id from BankAccounts a left join Transactions t on a.account_id = t.account_id where txn_id is null;
 
SELECT c.*
FROM BankCustomers c
LEFT JOIN BankAccounts a ON c.customer_id = a.customer_id
LEFT JOIN Transactions t ON a.account_id = t.account_id
WHERE t.txn_id IS NULL;

-- 43. Show customers who only have Savings account.
select customer_id from BankAccounts group by customer_id having COUNT(DISTINCT account_type) = 1 AND MAX(account_type) = 'Savings' ;

SELECT DISTINCT customer_id
FROM BankAccounts
WHERE account_type = 'Savings'
  AND customer_id NOT IN (
      SELECT customer_id
      FROM BankAccounts
      WHERE account_type <> 'Savings'
  );

-- 45. Show top 5 biggest loans.
select * from BankLoans order by loan_amount desc limit 5;

-- 46. Show customers with youngest DOB.
select * from BankCustomers order by dob desc limit 1;

-- 47. Show customers with oldest DOB.
select * from BankCustomers order by dob  limit 1;

-- 49. Find customers whose balance > loan_amount.
select c.first_name,c.last_name,c.customer_id,l.loan_amount from BankCustomers c join  BankAccounts a on c.customer_id= a.customer_id  join BankLoans l on c.customer_id  = l.customer_id where a.balance > l.loan_amount;

-- 50. Find customers who paid more than 1,000 in debit transactions.
select  c.first_name,c.last_name,c.customer_id,t.amount  from BankCustomers c join BankAccounts a on c.customer_id = a.account_id join Transactions t on a.account_id = t.account_id where t.amount > 1000 and t.txn_type = 'debit';

-- 51. Find customers who paid more than 10,000 in total debit transactions.
select  c.first_name,c.last_name,c.customer_id,sum(t.amount) as total_amt  from BankCustomers c join BankAccounts a on c.customer_id = a.account_id join Transactions t on a.account_id = t.account_id where t.txn_type = 'debit' group by c.customer_id having total_amt > 10000;