/* Trip Table */
CREATE TABLE trip
(
    trip_id VARCHAR(50) NOT NULL,
    rideable_id INTEGER,
    start_at VARCHAR(50)NOT NULL,
    end_at VARCHAR(50) NOT NULL,
    start_station_id VARCHAR(50) NOT NULL,
    end_station_id VARCHAR(50) NOT NULL,
    member_id INT NOT NULL,
    time_hour TINYINT NOT NULL,
    duration_minute INT NOT NULL
);

ALTER TABLE trip ADD CONSTRAINT Trip_fact_customerid PRIMARY KEY NONCLUSTERED (trip_id) NOT ENFORCED;

GO;

INSERT INTO trip( trip_id, rideable_id, start_at, end_at, start_station_id, end_station_id, member_id, time_hour, duration_minute)
SELECT
    trip_id,
    CASE rideable_type WHEN '"classic_bike"' THEN 1 WHEN '"docked_bike"' THEN 2 WHEN '"electric_bike"' THEN 3 END AS rideable_id,
    started_at,
    ended_at,
    start_station_id,
    end_station_id,
    member_id,
    DATEPART(HOUR, started_at) AS time_hour,
    DATEDIFF(MINUTE, started_at, ended_at) AS duration_minute
FROM [dbo].[staging_trip];