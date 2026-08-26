Use RetailBanking;

select * from accounts;
select * from customers;
select * from branches;
select * from cards;
select * from loan_payments;
select * from loans;
select * from transactions;

-- 1. Which transaction types are the most common?

select transaction_type,
		count(1) as total_transaction
		from transactions group by transaction_type
		order by total_transaction desc;

-- 2. Which transaction channels are used most frequently?

select channels,
	   count(1) as total_channels
	   from transactions group by channels
	   order by total_channels desc;

-- 3. Which transaction types generate the highest total transaction amount?

select transaction_type,
	   sum(amount) as total_amount 
	   from transactions group by transaction_type
	   order by total_amount desc;

-- 4. What is the average transaction amount for each transaction type?

select transaction_type,
	   avg(amount) as avg_transaction_amount
	   from transactions group by transaction_type;

-- 5. Which transaction descriptions are most common?

select description,
	   count(1) as total_description
	   from transactions group by description
	   order by total_description;

-- 6. Which accounts have the highest number of transactions?

select account_id,
	   count(1) as transactions_count
	   from transactions group by account_id
	   order by transactions_count desc;

-- 7. Which customers have the highest transaction activity?

select a.customer_id, 
	   count(t.transaction_id) as transaction_count
	   from accounts a join transactions t on a.account_id=t.account_id
	   group by a.customer_id order by transaction_count desc;

-- 8. How does transaction activity vary over time?

SELECT 
    CAST(transaction_date AS DATE) AS transaction_date,
    COUNT(*) AS total_transactions
	FROM transactions
	GROUP BY CAST(transaction_date AS DATE)
	ORDER BY transaction_date;

-- 9. Which transaction channels have the highest average transaction amount?

select channel, 
	   avg(amount) as avg_transaction_amount
	   from transactions group by channel 
	   order by avg_transaction_amount desc;

-- 10. What is the total completed transaction amount for each transaction type?

select transaction_type,
	   sum(amount) as transaction_amount
	   from transactions group by transaction_type;