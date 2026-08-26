Use RetailBanking;

select * from accounts;
select * from customers;
select * from branches;
select * from cards;
select * from loan_payments;
select * from loans;
select * from transactions;


-- 1. Which card types have the highest number of cards?

SELECT 
    card_type,
    COUNT(*) AS total_cards
FROM cards
GROUP BY card_type
ORDER BY total_cards DESC;

-- 2. Which card types have the highest average credit limit?

SELECT 
    card_type,
    AVG(credit_limit) AS average_credit_limit
FROM cards
GROUP BY card_type
ORDER BY average_credit_limit DESC;

-- 3. Which card types have the highest average outstanding balance?

SELECT 
    card_type,
    AVG(outstanding_balance) AS average_outstanding_balance
FROM cards
GROUP BY card_type
ORDER BY average_outstanding_balance DESC;

-- 4. What is the distribution of cards by status?

SELECT 
    CASE 
        WHEN is_active = 1 THEN 'Active'
        WHEN is_active = 0 THEN 'Inactive'
    END AS card_status,
    COUNT(*) AS total_cards
FROM cards
GROUP BY is_active
ORDER BY total_cards DESC;

-- 5. Which card types have the highest average reward points?

SELECT 
    card_type,
    AVG(reward_points) AS average_reward_points
FROM cards
GROUP BY card_type
ORDER BY average_reward_points DESC;

-- 6. Which card networks are used most frequently?

SELECT 
    network,
    COUNT(*) AS total_cards
FROM cards
GROUP BY network
ORDER BY total_cards DESC;

-- 7. Which accounts have the highest number of linked cards?

SELECT 
    account_id,
    COUNT(*) AS total_cards
FROM cards
GROUP BY account_id
ORDER BY total_cards DESC;

-- 8. Which customers have multiple cards?

SELECT 
    a.customer_id,
    COUNT(c.card_id) AS total_cards
FROM accounts a
JOIN cards c
    ON a.account_id = c.account_id
GROUP BY a.customer_id
HAVING COUNT(c.card_id) > 1
ORDER BY total_cards DESC;

-- 9. Which customers use multiple banking products such as accounts, cards, and loans?

SELECT 
    c.customer_id,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COUNT(DISTINCT ca.card_id) AS total_cards,
    COUNT(DISTINCT l.loan_id) AS total_loans
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN cards ca
    ON a.account_id = ca.account_id
LEFT JOIN loans l
    ON c.customer_id = l.customer_id
GROUP BY c.customer_id
HAVING 
    CASE WHEN COUNT(DISTINCT a.account_id) > 0 THEN 1 ELSE 0 END +
    CASE WHEN COUNT(DISTINCT ca.card_id) > 0 THEN 1 ELSE 0 END +
    CASE WHEN COUNT(DISTINCT l.loan_id) > 0 THEN 1 ELSE 0 END >= 2;

-- 10. Which card types have the highest total outstanding balance?

SELECT 
    card_type,
    SUM(outstanding_balance) AS total_outstanding_balance
FROM cards
GROUP BY card_type
ORDER BY total_outstanding_balance DESC;