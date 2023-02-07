/* Station Table */
CREATE TABLE  station
(
  station_id VARCHAR(60) NOT NULL,
  name  VARCHAR(60) NOT NULL,
  latitude FLOAT,
  longitude FLOAT
);

GO; 

INSERT INTO station (station_id, name, latitude, longitude)
SELECT
    station_id,
    name,
    latitude,
    longitude
FROM [dbo].[staging_station];