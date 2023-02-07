/* Payment Table */
CREATE TABLE payment
(
    payment_id VARCHAR(45)  NOT NULL ,
    date DATE NOT NULL,
    amount BIGINT NOT NULL,
    account_number  INT NOT NULL
)

ALTER TABLE payment ADD CONSTRAINT Payment_fact_customerid PRIMARY KEY NONCLUSTERED (payment_id) NOT ENFORCED;

GO;


INSERT INTO payment (payment_id, date, amount, account_number)
SELECT
    payment_id,
    date,
    amount,
    account_number
FROM [dbo].[staging_payment];