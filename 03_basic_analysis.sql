Use RetailBanking;


-- 11.What is the total number of customers?

select count(1)  as Total_Customers from customers;

-- 12.What is the total number of accounts?

select count(1) as Total_Accounts from accounts;

-- 13.What are the different account types available?

select distinct account_type as Account_Types from accounts;

-- 14.How many customers are currently active?

select count(1) as Customers_count from customers c join loans a
on c.customer_id=a.customer_id where loan_status='Active';

-- 15.What are the different transaction types available?

select distinct transaction_type from transactions;

-- 16.What is the total amount of completed transactions?

select sum(amount) as Total_Amount from transactions 
where status='completed';

-- 17.What are the different loan types available?

select distinct loan_type from loans ;

-- 18.What is the total number of loans?

select count(1) as total_loans from loans;

-- 19.What are the different card types available?

select distinct card_type from cards;

-- 20.What is the total outstanding loan balance?

select sum(outstanding_balance) as total_outstanding_balance from loans;
