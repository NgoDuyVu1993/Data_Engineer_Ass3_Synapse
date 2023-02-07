/* Date Table */
CREATE TABLE date_table (
   date DATE NOT NULL,
   day INT NOT NULL,
   month INT NOT NULL,
   week_day INT NOT NULL,
   quarter VARCHAR(2) NOT NULL,
   year INT NOT NULL
);

ALTER TABLE  date_table ADD CONSTRAINT Date_dayid PRIMARY KEY NONCLUSTERED (date) NOT ENFORCED;

INSERT INTO date_table (date, day, month, week_day, quarter, year)
SELECT 
[started_at] AS 'date',
DATEPART(DAY, [started_at]) AS 'Day', 
DATEPART(MONTH, [started_at]) AS 'Month',
DATEPART(WEEKDAY, [started_at]) AS 'Week Day',
CASE DATEPART(QUARTER, [started_at]) WHEN 1 THEN 'Q1' WHEN 2 THEN 'Q2' WHEN 3 THEN 'Q3' WHEN 4 THEN 'Q4' END AS 'Quarter',
DATEPART(YEAR, [started_at]) AS 'Year'
 FROM [dbo].[staging_trip];