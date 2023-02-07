/* Bike Type Table */
CREATE TABLE  bike_type
(
  biketype_id INTEGER,
  biketype  VARCHAR(20) NOT NULL
);

GO;

INSERT INTO bike_type (biketype_id, biketype)
VALUES(1, 'Classic Bike');

INSERT INTO bike_type (biketype_id, biketype)
VALUES(2, 'Docked Bike');

INSERT INTO bike_type (biketype_id, biketype)
VALUES(3, 'Electric Bike');