/* Based on date and time factors such as day of week and time of day */
SELECT
    AVG(CAST(duration_minute AS FLOAT)) AS 'Average Duration (Minutes)',
    time_hour,
    week_day 
FROM trip
JOIN date_table ON (TRY_CONVERT(DATE,start_at)=date_table.Date)
GROUP BY time_hour,week_day
ORDER BY  week_day,time_hour;

/* Based on which station is the starting and / or ending station */
SELECT
    AVG(CAST(duration_minute AS FLOAT)) AS 'Average Duration (Minutes)',
    name AS 'Station Name' 
FROM trip
JOIN station ON(station.station_id = trip.start_station_id)
GROUP BY name

/* Based on age of the rider at time of the ride */
SELECT 
    AVG(CAST(duration_minute AS FLOAT)) AS 'Average Duration (Minutes)',
    age_at_account_opened 
FROM trip
JOIN rider ON(rider.rider_id = trip.member_id)
GROUP BY age_at_account_opened
ORDER BY AVG(CAST(duration_minute AS FLOAT)) ASC

/* Based on whether the rider is a member or a casual rider */
SELECT 
    AVG(CAST(duration_minute AS FLOAT)) AS 'Average Duration (Minutes)',
    member 
FROM trip
JOIN rider ON(rider.rider_id = trip.member_id)
GROUP BY member