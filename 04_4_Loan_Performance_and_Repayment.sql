Use RetailBanking;

select * from accounts;
select * from customers;
select * from branches;
select * from cards;
select * from loan_payments;
select * from loans;
select * from transactions;

-- 1. Which loan types have the highest number of loans?

SELECT 
    loan_type,
    COUNT(*) AS total_loans
FROM loans
GROUP BY loan_type
ORDER BY total_loans DESC;

-- 2. Which loan types have the highest average loan amount?

SELECT 
    loan_type,
    AVG(principal_amount) AS average_loan_amount
FROM loans
GROUP BY loan_type
ORDER BY average_loan_amount DESC;

-- 3. Which loan purposes have the highest total loan amount?

SELECT 
    purpose,
    SUM(principal_amount) AS total_loan_amount
FROM loans
GROUP BY purpose
ORDER BY total_loan_amount DESC;

-- 4. Which loan types have the highest total outstanding balance?

SELECT 
    loan_type,
    SUM(outstanding_balance) AS total_outstanding_balance
FROM loans
GROUP BY loan_type
ORDER BY total_outstanding_balance DESC;

-- 5. What is the distribution of loans by loan status?

SELECT 
    loan_status,
    COUNT(*) AS total_loans
FROM loans
GROUP BY loan_status
ORDER BY total_loans DESC;

-- 6. Which loans have repayment delays?

-- 6. Which loans have repayment delays?

SELECT 
    loan_id,
    customer_id,
    loan_type,
    principal_amount,
    outstanding_balance,
    loan_status
FROM loans
WHERE outstanding_balance > 0
ORDER BY outstanding_balance DESC;

-- 7. Which loan types have the highest number of late payments?

SELECT 
    loan_type,
    SUM(outstanding_balance) AS total_outstanding_balance
FROM loans
GROUP BY loan_type
ORDER BY total_outstanding_balance DESC;

-- 8. Which loan types generate the highest total penalties?

SELECT 
    loan_type,
    AVG(outstanding_balance) AS average_outstanding_balance
FROM loans
GROUP BY loan_type
ORDER BY average_outstanding_balance DESC;

-- 9. Which branches have the highest total loan amount?

SELECT 
    branch_id,
    SUM(principal_amount) AS total_loan_amount
FROM loans
GROUP BY branch_id
ORDER BY total_loan_amount DESC;

-- 10. Which payment methods are most commonly used for loan repayments?

SELECT 
    loan_type,
    AVG(emi_amount) AS average_emi_amount
FROM loans
GROUP BY loan_type
ORDER BY average_emi_amount DESC;
