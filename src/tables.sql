USE DATABASE capstone_de;
USE SCHEMA capstone_de.group_3_schema;

CREATE TABLE capstone_de.group_3_schema.fact_green_yellow (
    VendorID INT,
    pickup_datetime DATETIME,
    dropoff_datetime DATETIME,
    passenger_count FLOAT,
    trip_distance FLOAT,
    RatecodeID FLOAT,
    store_and_fwd_flag VARCHAR,
    PULocationID INT,
    DOLocationID INT,
    payment_type FLOAT,
    fare_amount FLOAT,
    extra FLOAT,
    mta_tax FLOAT,
    tip_amount FLOAT,
    tolls_amount FLOAT,
    improvement_surcharge FLOAT,
    total_amount FLOAT,
    congestion_surcharge FLOAT,
    Airport_fee FLOAT,
    taxi_type VARCHAR,
    trip_duration FLOAT,
    average_speed FLOAT,
    month INT,
    time VARCHAR,
    hour VARCHAR,
    timeofday VARCHAR,
    day_of_month INT,
    year INT,
    day_of_week INT,
    is_weekend boolean,
    ehail_fee FLOAT,
    trip_type FLOAT
);

CREATE TABLE capstone_de.group_3_schema.fact_hvhfv (
-- todo?
);

-- Dim tables
CREATE TABLE capstone_de.group_3_schema.dim_hvfhs_license_num (
    id VARCHAR,
    licensee VARCHAR
);
INSERT INTO capstone_de.group_3_schema.dim_hvfhs_license_num
VALUES
('HV0002', 'Juno'),
('HV0003', 'Uber'),
('HV0004', 'Via'),
('HV0005', 'Lyft');

CREATE TABLE capstone_de.group_3_schema.dim_ratecode (
    id INT,
    ratecode VARCHAR
);
INSERT INTO capstone_de.group_3_schema.dim_ratecode (id, ratecode)
VALUES
(1, 'Standard Rate'),
(2, 'JFK'),
(3, 'Newark'),
(4, 'Nassau or Westchester'),
(5, 'Negotiated Fare'),
(6, 'Group Ride');

CREATE TABLE capstone_de.group_3_schema.dim_payment_type (
    id INT,
    payment_type VARCHAR
);
INSERT INTO capstone_de.group_3_schema.dim_payment_type (id, payment_type)
VALUES
(1, 'Credit Card'),
(2, 'Cash'),
(3, 'No Charge'),
(4, 'Dispute'),
(5, 'Unknown'),
(6, 'Voided Trip');

CREATE TABLE capstone_de.group_3_schema.dim_store_fwd_flag (
    y_n VARCHAR,
    s VARCHAR
);
INSERT INTO capstone_de.group_3_schema.dim_store_fwd_flag (y_n, s)
VALUES
('Y', 'store and forward trip'),
('N', 'not a store and forward trip');

CREATE TABLE capstone_de.group_3_schema.dim_trip_type (
    id INT,
    trip_type VARCHAR
);
INSERT INTO capstone_de.group_3_schema.dim_trip_type (id, trip_type)
VALUES
(1, 'Street-hail'),
(2, 'Dispatch');

CREATE TABLE capstone_de.group_3_schema.dim_vendor_id (
    id INT,
    vendor VARCHAR
);
INSERT INTO capstone_de.group_3_schema.dim_vendor_id (id, vendor)
VALUES
(1, 'Creative Mobile Technologies, LLC'),
(2, 'VeriFone Inc.');

CREATE TABLE capstone_de.group_3_schema.dim_zone_lookup (
    LocationId INT,
    Borough VARCHAR,
    Zone VARCHAR,
    service_zone VARCHAR
);
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (1,'EWR','Newark Airport','EWR');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (2,'Queens','Jamaica Bay','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (3,'Bronx','Allerton/Pelham Gardens','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (4,'Manhattan','Alphabet City','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (5,'Staten Island','Arden Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (6,'Staten Island','Arrochar/Fort Wadsworth','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (7,'Queens','Astoria','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (8,'Queens','Astoria Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (9,'Queens','Auburndale','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (10,'Queens','Baisley Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (11,'Brooklyn','Bath Beach','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (12,'Manhattan','Battery Park','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (13,'Manhattan','Battery Park City','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (14,'Brooklyn','Bay Ridge','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (15,'Queens','Bay Terrace/Fort Totten','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (16,'Queens','Bayside','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (17,'Brooklyn','Bedford','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (18,'Bronx','Bedford Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (19,'Queens','Bellerose','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (20,'Bronx','Belmont','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (21,'Brooklyn','Bensonhurst East','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (22,'Brooklyn','Bensonhurst West','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (23,'Staten Island','Bloomfield/Emerson Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (24,'Manhattan','Bloomingdale','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (25,'Brooklyn','Boerum Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (26,'Brooklyn','Borough Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (27,'Queens','Breezy Point/Fort Tilden/Riis Beach','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (28,'Queens','Briarwood/Jamaica Hills','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (29,'Brooklyn','Brighton Beach','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (30,'Queens','Broad Channel','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (31,'Bronx','Bronx Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (32,'Bronx','Bronxdale','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (33,'Brooklyn','Brooklyn Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (34,'Brooklyn','Brooklyn Navy Yard','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (35,'Brooklyn','Brownsville','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (36,'Brooklyn','Bushwick North','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (37,'Brooklyn','Bushwick South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (38,'Queens','Cambria Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (39,'Brooklyn','Canarsie','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (40,'Brooklyn','Carroll Gardens','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (41,'Manhattan','Central Harlem','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (42,'Manhattan','Central Harlem North','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (43,'Manhattan','Central Park','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (44,'Staten Island','Charleston/Tottenville','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (45,'Manhattan','Chinatown','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (46,'Bronx','City Island','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (47,'Bronx','Claremont/Bathgate','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (48,'Manhattan','Clinton East','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (49,'Brooklyn','Clinton Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (50,'Manhattan','Clinton West','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (51,'Bronx','Co-Op City','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (52,'Brooklyn','Cobble Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (53,'Queens','College Point','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (54,'Brooklyn','Columbia Street','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (55,'Brooklyn','Coney Island','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (56,'Queens','Corona','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (57,'Queens','Corona','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (58,'Bronx','Country Club','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (59,'Bronx','Crotona Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (60,'Bronx','Crotona Park East','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (61,'Brooklyn','Crown Heights North','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (62,'Brooklyn','Crown Heights South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (63,'Brooklyn','Cypress Hills','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (64,'Queens','Douglaston','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (65,'Brooklyn','Downtown Brooklyn/MetroTech','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (66,'Brooklyn','DUMBO/Vinegar Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (67,'Brooklyn','Dyker Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (68,'Manhattan','East Chelsea','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (69,'Bronx','East Concourse/Concourse Village','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (70,'Queens','East Elmhurst','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (71,'Brooklyn','East Flatbush/Farragut','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (72,'Brooklyn','East Flatbush/Remsen Village','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (73,'Queens','East Flushing','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (74,'Manhattan','East Harlem North','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (75,'Manhattan','East Harlem South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (76,'Brooklyn','East New York','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (77,'Brooklyn','East New York/Pennsylvania Avenue','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (78,'Bronx','East Tremont','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (79,'Manhattan','East Village','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (80,'Brooklyn','East Williamsburg','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (81,'Bronx','Eastchester','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (82,'Queens','Elmhurst','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (83,'Queens','Elmhurst/Maspeth','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (84,'Staten Island','Eltingville/Annadale/Prince''s Bay','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (85,'Brooklyn','Erasmus','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (86,'Queens','Far Rockaway','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (87,'Manhattan','Financial District North','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (88,'Manhattan','Financial District South','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (89,'Brooklyn','Flatbush/Ditmas Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (90,'Manhattan','Flatiron','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (91,'Brooklyn','Flatlands','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (92,'Queens','Flushing','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (93,'Queens','Flushing Meadows-Corona Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (94,'Bronx','Fordham South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (95,'Queens','Forest Hills','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (96,'Queens','Forest Park/Highland Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (97,'Brooklyn','Fort Greene','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (98,'Queens','Fresh Meadows','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (99,'Staten Island','Freshkills Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (100,'Manhattan','Garment District','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (101,'Queens','Glen Oaks','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (102,'Queens','Glendale','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (103,'Manhattan','Governor''s Island/Ellis Island/Liberty Island','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (104,'Manhattan','Governor''s Island/Ellis Island/Liberty Island','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (105,'Manhattan','Governor''s Island/Ellis Island/Liberty Island','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (106,'Brooklyn','Gowanus','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (107,'Manhattan','Gramercy','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (108,'Brooklyn','Gravesend','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (109,'Staten Island','Great Kills','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (110,'Staten Island','Great Kills Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (111,'Brooklyn','Green-Wood Cemetery','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (112,'Brooklyn','Greenpoint','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (113,'Manhattan','Greenwich Village North','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (114,'Manhattan','Greenwich Village South','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (115,'Staten Island','Grymes Hill/Clifton','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (116,'Manhattan','Hamilton Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (117,'Queens','Hammels/Arverne','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (118,'Staten Island','Heartland Village/Todt Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (119,'Bronx','Highbridge','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (120,'Manhattan','Highbridge Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (121,'Queens','Hillcrest/Pomonok','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (122,'Queens','Hollis','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (123,'Brooklyn','Homecrest','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (124,'Queens','Howard Beach','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (125,'Manhattan','Hudson Sq','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (126,'Bronx','Hunts Point','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (127,'Manhattan','Inwood','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (128,'Manhattan','Inwood Hill Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (129,'Queens','Jackson Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (130,'Queens','Jamaica','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (131,'Queens','Jamaica Estates','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (132,'Queens','JFK Airport','Airports');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (133,'Brooklyn','Kensington','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (134,'Queens','Kew Gardens','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (135,'Queens','Kew Gardens Hills','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (136,'Bronx','Kingsbridge Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (137,'Manhattan','Kips Bay','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (138,'Queens','LaGuardia Airport','Airports');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (139,'Queens','Laurelton','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (140,'Manhattan','Lenox Hill East','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (141,'Manhattan','Lenox Hill West','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (142,'Manhattan','Lincoln Square East','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (143,'Manhattan','Lincoln Square West','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (144,'Manhattan','Little Italy/NoLiTa','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (145,'Queens','Long Island City/Hunters Point','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (146,'Queens','Long Island City/Queens Plaza','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (147,'Bronx','Longwood','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (148,'Manhattan','Lower East Side','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (149,'Brooklyn','Madison','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (150,'Brooklyn','Manhattan Beach','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (151,'Manhattan','Manhattan Valley','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (152,'Manhattan','Manhattanville','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (153,'Manhattan','Marble Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (154,'Brooklyn','Marine Park/Floyd Bennett Field','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (155,'Brooklyn','Marine Park/Mill Basin','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (156,'Staten Island','Mariners Harbor','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (157,'Queens','Maspeth','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (158,'Manhattan','Meatpacking/West Village West','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (159,'Bronx','Melrose South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (160,'Queens','Middle Village','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (161,'Manhattan','Midtown Center','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (162,'Manhattan','Midtown East','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (163,'Manhattan','Midtown North','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (164,'Manhattan','Midtown South','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (165,'Brooklyn','Midwood','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (166,'Manhattan','Morningside Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (167,'Bronx','Morrisania/Melrose','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (168,'Bronx','Mott Haven/Port Morris','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (169,'Bronx','Mount Hope','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (170,'Manhattan','Murray Hill','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (171,'Queens','Murray Hill-Queens','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (172,'Staten Island','New Dorp/Midland Beach','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (173,'Queens','North Corona','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (174,'Bronx','Norwood','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (175,'Queens','Oakland Gardens','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (176,'Staten Island','Oakwood','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (177,'Brooklyn','Ocean Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (178,'Brooklyn','Ocean Parkway South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (179,'Queens','Old Astoria','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (180,'Queens','Ozone Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (181,'Brooklyn','Park Slope','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (182,'Bronx','Parkchester','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (183,'Bronx','Pelham Bay','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (184,'Bronx','Pelham Bay Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (185,'Bronx','Pelham Parkway','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (186,'Manhattan','Penn Station/Madison Sq West','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (187,'Staten Island','Port Richmond','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (188,'Brooklyn','Prospect-Lefferts Gardens','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (189,'Brooklyn','Prospect Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (190,'Brooklyn','Prospect Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (191,'Queens','Queens Village','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (192,'Queens','Queensboro Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (193,'Queens','Queensbridge/Ravenswood','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (194,'Manhattan','Randalls Island','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (195,'Brooklyn','Red Hook','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (196,'Queens','Rego Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (197,'Queens','Richmond Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (198,'Queens','Ridgewood','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (199,'Bronx','Rikers Island','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (200,'Bronx','Riverdale/North Riverdale/Fieldston','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (201,'Queens','Rockaway Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (202,'Manhattan','Roosevelt Island','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (203,'Queens','Rosedale','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (204,'Staten Island','Rossville/Woodrow','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (205,'Queens','Saint Albans','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (206,'Staten Island','Saint George/New Brighton','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (207,'Queens','Saint Michaels Cemetery/Woodside','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (208,'Bronx','Schuylerville/Edgewater Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (209,'Manhattan','Seaport','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (210,'Brooklyn','Sheepshead Bay','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (211,'Manhattan','SoHo','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (212,'Bronx','Soundview/Bruckner','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (213,'Bronx','Soundview/Castle Hill','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (214,'Staten Island','South Beach/Dongan Hills','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (215,'Queens','South Jamaica','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (216,'Queens','South Ozone Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (217,'Brooklyn','South Williamsburg','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (218,'Queens','Springfield Gardens North','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (219,'Queens','Springfield Gardens South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (220,'Bronx','Spuyten Duyvil/Kingsbridge','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (221,'Staten Island','Stapleton','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (222,'Brooklyn','Starrett City','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (223,'Queens','Steinway','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (224,'Manhattan','Stuy Town/Peter Cooper Village','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (225,'Brooklyn','Stuyvesant Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (226,'Queens','Sunnyside','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (227,'Brooklyn','Sunset Park East','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (228,'Brooklyn','Sunset Park West','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (229,'Manhattan','Sutton Place/Turtle Bay North','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (230,'Manhattan','Times Sq/Theatre District','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (231,'Manhattan','TriBeCa/Civic Center','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (232,'Manhattan','Two Bridges/Seward Park','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (233,'Manhattan','UN/Turtle Bay South','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (234,'Manhattan','Union Sq','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (235,'Bronx','University Heights/Morris Heights','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (236,'Manhattan','Upper East Side North','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (237,'Manhattan','Upper East Side South','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (238,'Manhattan','Upper West Side North','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (239,'Manhattan','Upper West Side South','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (240,'Bronx','Van Cortlandt Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (241,'Bronx','Van Cortlandt Village','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (242,'Bronx','Van Nest/Morris Park','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (243,'Manhattan','Washington Heights North','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (244,'Manhattan','Washington Heights South','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (245,'Staten Island','West Brighton','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (246,'Manhattan','West Chelsea/Hudson Yards','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (247,'Bronx','West Concourse','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (248,'Bronx','West Farms/Bronx River','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (249,'Manhattan','West Village','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (250,'Bronx','Westchester Village/Unionport','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (251,'Staten Island','Westerleigh','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (252,'Queens','Whitestone','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (253,'Queens','Willets Point','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (254,'Bronx','Williamsbridge/Olinville','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (255,'Brooklyn','Williamsburg (North Side)','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (256,'Brooklyn','Williamsburg (South Side)','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (257,'Brooklyn','Windsor Terrace','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (258,'Queens','Woodhaven','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (259,'Bronx','Woodlawn/Wakefield','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (260,'Queens','Woodside','Boro Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (261,'Manhattan','World Trade Center','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (262,'Manhattan','Yorkville East','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (263,'Manhattan','Yorkville West','Yellow Zone');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (264,'Unknown','N/A','N/A');
INSERT INTO capstone_de.group_3_schema.dim_zone_lookup(LocationID,Borough,Zone,service_zone) VALUES (265,'N/A','Outside of NYC','N/A');
