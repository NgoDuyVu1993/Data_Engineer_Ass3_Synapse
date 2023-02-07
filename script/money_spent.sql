/* Per month, quarter, year */
SELECT
    AVG(amount) AS 'Average Amount',
    SUM(amount) AS 'Sum Amount',
    year,
    quarter,
    month
FROM payment
JOIN date_table ON (TRY_CONVERT(DATE, payment.date) = date_table.date)
JOIN rider ON(rider.rider_id = payment.account_number)
GROUP BY year, quarter, month
ORDER BY AVG(amount), SUM(amount)

/* Per member, based on the age of the rider at account start */ 
SELECT
    AVG(amount) AS 'Average Amount',
    SUM(amount) AS 'Sum Amount',
    COUNT(amount)as 'Count',
    age_at_account_opened AS 'Age until Account Opened'
FROM payment
JOIN date_table ON (TRY_CONVERT(DATE, payment.date) = date_table.date)
JOIN rider ON(rider.rider_id = payment.account_number)
GROUP BY age_at_account_opened
ORDER BY AVG(amount), SUM(amount)