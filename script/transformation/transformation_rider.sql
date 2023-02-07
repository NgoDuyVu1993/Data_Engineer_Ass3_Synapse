/* Rider Table */
CREATE TABLE rider
(
  rider_id INT NOT NULL,
  birthday  VARCHAR(50) NOT NULL,
  member BIT NOT NULL,
  start_date VARCHAR(50) NOT NULL,
  end_date VARCHAR(50),
  age_at_account_opened TINYINT NOT NULL
),

GO;

INSERT  INTO rider(rider_id, birthday, member, start_date, end_date, age_at_account_opened)
SELECT
    rider_id,
    birthday,
    member,
    start_date,
    end_date,
    DATEDIFF(YEAR, birthday, start_date) AS age_at_account_opened
FROM [dbo].[staging_rider];