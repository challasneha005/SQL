-- subqueries nested joins
use bank;
show tables;

desc BankAccounts;
desc BankCustomers;
desc Transactions;
desc BankLoans;

-- 51. Find customers with the maximum balance account.
select c.* from BankCustomers c join BankAccounts a on c.customer_id = a.customer_id where a.balance =  (select max(balance) from BankAccounts);

select * from BankCustomers where customer_id in(select customer_id from BankAccounts where balance = (select max(balance) from BankAccounts));

-- 52. Find accounts that never had a transaction.
select a.* from BankAccounts a left join Transactions t on a.account_id = t.account_id where t.account_id is null;

 SELECT * FROM BankAccounts
WHERE account_id NOT IN (SELECT DISTINCT account_id FROM BankTransactions);

-- 53. Find customers who took the highest loan.
select * from BankCustomers   where customer_id in(select customer_id from BankLoans where loan_amount =  (select max(loan_amount) from BankLoans));

SELECT c.*
FROM BankCustomers c
JOIN BankLoans l on c.customer_id = l.customer_id WHERE l.loan_amount = (SELECT MAX(loan_amount) FROM BankLoans);

-- 54. Find customers who never took a loan.
select c.* from BankCustomers c left join BankLoans l on c.customer_id = l.customer_id where l.customer_id is null;

SELECT * FROM BankCustomers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM BankLoans);

-- 55. Find average balance of customers who took loans
-- may have duplicates..
select avg(a.balance) from BankAccounts a join BankLoans l on a.customer_id = l.customer_id  ;

select avg(balance) from BankAccounts where customer_id in(select distinct customer_id from BankLoans);

SELECT AVG(a.balance)
FROM (
    SELECT DISTINCT a.account_id, a.balance
    FROM BankAccounts a
    JOIN BankLoans l 
        ON a.customer_id = l.customer_id
) sub;

-- 56. Find transactions greater than average transaction amount
select * from Transactions where amount > (select avg(amount) from Transactions);

-- 57. Find customers with total balance greater than average balance.
select c.* ,SUM(a.balance) AS total_balance from BankCustomers c join BankAccounts a on c.customer_id = a.customer_id
group by c.customer_id having sum(a.balance) > (select avg(balance) from BankAccounts);

-- 58. Find customers who took more than one loan.
-- HAVING COUNT(...) = 0 ensures only customers with zero debits
select c.customer_id,c.first_name,c.last_name from BankCustomers c join BankLoans l on c.customer_id = l.customer_id group by c.customer_id  having count(l.loan_id)>1 ;

SELECT DISTINCT c.customer_id, c.first_name
FROM BankCustomers c
JOIN BankAccounts a ON c.customer_id = a.customer_id
JOIN BankTransactions t ON a.account_id = t.account_id
WHERE c.customer_id NOT IN (
  SELECT DISTINCT c2.customer_id
  FROM BankCustomers c2
  JOIN BankAccounts a2 ON c2.customer_id = a2.customer_id
  JOIN BankTransactions t2 ON a2.account_id = t2.account_id
  WHERE t2.txn_type = 'debit'
);
-- 59. Find loan types with average interest rate > 8%.
select loan_type from BankLoans group by loan_type having avg(interest_rate) >8;

-- 60. Find customers who made only credit transactions.
select c.customer_id,c.first_name,c.last_name from BankCustomers c join BankAccounts a on c.customer_id = a.customer_id join Transactions t on a.account_id = t.account_id group by c.customer_id having COUNT(CASE WHEN t.txn_type = 'debit' THEN 1 END) = 0;

SELECT DISTINCT c.customer_id, c.first_name FROM BankCustomers c
JOIN BankAccounts a ON c.customer_id = a.customer_id
JOIN Transactions t ON a.account_id = t.account_id
WHERE c.customer_id NOT IN (
  SELECT DISTINCT c2.customer_id FROM BankCustomers c2
  JOIN BankAccounts a2 ON c2.customer_id = a2.customer_id
  JOIN Transactions t2 ON a2.account_id = t2.account_id
  WHERE t2.txn_type = 'debit'
);

-- 61. Find customers with at least one loan and one account.
select distinct c.customer_id,c.first_name,c.last_name from BankCustomers c join BankAccounts a on c.customer_id = a.customer_id join BankLoans l on c.customer_id = l.customer_id ;

-- only savings account
select customer_id from BankAccounts group by customer_id having count(case when account_type = "Current" then 1 end) = 0;

select * from BankAccounts ;
INSERT INTO BankAccounts (customer_id, account_type, balance, opened_date)
VALUES
(1, 'Current', 5000.00, '2025-01-10');

select customer_id from BankAccounts where account_type in("Savings","Current") 
group by customer_id having count(distinct account_type) = 2;

select customer_id from BankAccounts where account_type in("Savings","Current") 
group by customer_id having count(distinct account_type) = 1;

select customer_id from BankAccounts where account_type in("Current") 
group by customer_id having count(distinct account_type) = 1;

select customer_id from BankAccounts   
group by customer_id having count(distinct account_type) = 1 and min(account_type = "Current");

 
 
