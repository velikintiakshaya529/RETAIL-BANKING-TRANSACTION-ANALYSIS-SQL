Use RetailBanking;

select * from accounts;
select * from customers;
select * from branches;
select * from cards;
select * from loan_payments;
select * from loans;
select * from transactions;

-- 1. Which account types have the highest average account balance?

select account_type, 
		avg(current_balance) as account_balance
		from accounts group by account_type 
		order by account_balance desc;

-- 2. Which account types have the highest number of active accounts?

select account_type,
	   count(1) as active_accounts
	   from accounts where status='Active'
	   group by account_type order by active_accounts;

-- 3. Which branches have the highest number of accounts?

select b.branch_name,
	   count(1) as accounts_count
	   from accounts a join branches b on a.branch_id=b.branch_id
		group by b.branch_name order by accounts_count desc;

-- 4.Which account types have the highest average interest rate?

select account_type,
	   avg(interest_rate) as avg_interest_rate
	   from accounts group by account_type 
	   order by avg_interest_rate desc;

-- 5.Which branches have the highest total account balance?

select branch_name,
	   sum(current_balance) as total_amount
	   from accounts a join branches b on a.branch_id=b.branch_id
	   group by branch_name order by total_amount desc;

-- 6.Which customers have more than one bank account?

select customer_id, 
	   count(1) as total_accounts
	   from accounts group by customer_id
	   having count(1) > 1 ;

-- 7.What percentage of accounts are active versus closed?

select status, 
	   count(1) as total_accounts,
	   round(count(1) * 100 / (select count(1) from accounts), 2) as percentage_
	   from accounts group by status;

-- 8.Which account types have the highest number of closed accounts?

select account_type, 
	   count(1) as closed_accounts
	   from accounts where status='closed'
	   group by account_type order by closed_accounts desc;

-- 9.Which branches have the highest average account balance?

select branch_name,
	   avg(current_balance) as avg_current_balance
	   from accounts a join branches b on a.branch_id=b.branch_id
	   group by branch_name order by avg_current_balance desc;

-- 10.Which account types contribute the most to the bank's total account balance?

select account_type,
	   sum(current_balance) as total_account_balance
	   from accounts group by account_type
	   order by  total_account_balance desc;
