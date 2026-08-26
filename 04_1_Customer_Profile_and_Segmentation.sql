Use RetailBanking;

select * from accounts;
select * from customers;
select * from branches;
select * from cards;
select * from loan_payments;
select * from loans;
select * from transactions;

-- 1.How many customers belong to each customer segment?

select segment,count(1) as customers_count from customers
group by segment;

-- 2.Which cities have the highest number of customers?

select city,count(1) as Highest_customer_count from customers 
group by city order by Highest_customer_count desc;

-- 3.Which states have the highest number of customers?

select state,count(1) as Highest_number_count from customers
group by state order by Highest_number_count desc;

-- 4.What is the average age of customers in each customer segment?

SELECT segment,
    AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM customers
GROUP BY segment;

-- 5.What is the average income of customers in each customer segment?

select segment,avg(annual_income) as avg_income
from customers group by segment;

-- 6.How does the average credit score differ across customer segments?

select segment,avg(credit_score) as avg_credit_score
from customers group by segment;

-- 7.How many customers are currently active and inactive?

select count(1) as customers_count, 
    case when is_active=1 then 'Active'
        else 'InActive'
    end customer_status 
    from customers group by is_active;

-- 8.What is the distribution of customers based on KYC status?

select kyc_status,count(1) as customer_count
from customers group by kyc_status;

-- 9.Which customer segments have the highest average account balance?

select top 1 segment , 
    avg(annual_income) as Highest_avg_account_balance
    from customers group by segment
    order by Highest_avg_account_balance desc;

-- 10.What is the average tenure of customers with the bank?

SELECT AVG(DATEDIFF(YEAR, open_date, GETDATE())) AS average_tenure
FROM accounts;

-- 11.Which cities have customers with the highest average income?

select top 1
    city,avg(annual_income) as Highest_avg_income
    from customers group by city order by Highest_avg_income;

-- 12.Which customer segment has the highest average credit score and income?

select top 1
        segment,avg(credit_score) as Highest_avg_Score
        from customers group by segment 
        order by Highest_avg_Score desc;