
-- Pricing Strategy
-- Even though Manhattan has the most demand it does not has a significant amount of crashes. 
-- From collisons dash we can see that Brookyn has the highest count of crashes.
-- Lets take a closer look at our taxi presence in Brooklyn.

SELECT  BOROUGH,
        ROUND(AVG(PASSENGER_COUNT), 1) AS AVG_PASSENGER_COUNT,
        ROUND(AVG(TRIP_DISTANCE), 2) AS AVG_TRIP_DISTANCE,
        ROUND(SUM(vendorid), 2) AS AVG_RIDE_COUNT,
        ROUND(AVG(FARE_AMOUNT), 2) AS AVG_FARE_AMOUNT,
        ROUND(AVG(TIP_AMOUNT), 2) AS AVG_TIP_AMOUNT,
        ROUND(AVG(TOTAL_AMOUNT), 2) AS AVG_TOTAL_AMOUNT
FROM FACT_GREEN_YELLOW F
JOIN DIM_ZONE_LOOKUP Z ON F.PULOCATIONID = Z.LOCATIONID
WHERE BOROUGH IN ('Bronx', 'Brooklyn', 'Queens', 'Staten Island', 'Manhattan')
GROUP BY BOROUGH
ORDER BY AVG_RIDE_COUNT;

CREATE OR REPLACE VIEW CAPSTONE_DE.GROUP_3_SCHEMA.AVG_TAXI_STATS_VIEW(
    BOROUGH,
    AVG_PASSENGER_COUNT,
    AVG_TRIP_DISTANCE,
    AVG_RIDE_COUNT,
    AVG_FARE_AMOUNT,
    AVG_TIP_AMOUNT,
    AVG_TOTAL_AMOUNT
)AS 
SELECT  BOROUGH,
        ROUND(AVG(PASSENGER_COUNT), 1) AS AVG_PASSENGER_COUNT,
        ROUND(AVG(TRIP_DISTANCE), 2) AS AVG_TRIP_DISTANCE,
        ROUND(SUM(vendorid), 2) AS AVG_RIDE_COUNT,
        ROUND(AVG(FARE_AMOUNT), 2) AS AVG_FARE_AMOUNT,
        ROUND(AVG(TIP_AMOUNT), 2) AS AVG_TIP_AMOUNT,
        ROUND(AVG(TOTAL_AMOUNT), 2) AS AVG_TOTAL_AMOUNT
FROM FACT_GREEN_YELLOW F
JOIN DIM_ZONE_LOOKUP Z ON F.PULOCATIONID = Z.LOCATIONID
WHERE BOROUGH IN ('Bronx', 'Brooklyn', 'Queens', 'Staten Island', 'Manhattan')
GROUP BY BOROUGH
ORDER BY AVG_RIDE_COUNT;

SELECT *
FROM AVG_TAXI_STATS_VIEW;

-- brooklyn has one of the lowest passenfer counts, avg for trip distance, lowest fare amounts & tip amounts, one of highest ride count?


-- pricing by hour 
-- 8am, 5-6pm (REALLY INC since this is when most crashes occur), 10-11pm increase price since that is when most rides are
SELECT HOUR, TIMEOFDAY, SUM(VENDORID) AS RIDE_COUNT, BOROUGH
FROM FACT_GREEN_YELLOW F
JOIN DIM_ZONE_LOOKUP Z ON F.PULOCATIONID = Z.LOCATIONID
WHERE BOROUGH IN ('Bronx', 'Brooklyn', 'Queens', 'Staten Island', 'Manhattan')
GROUP BY HOUR, TIMEOFDAY, BOROUGH
ORDER BY RIDE_COUNT DESC
LIMIT 5;


CREATE OR REPLACE VIEW CAPSTONE_DE.GROUP_3_SCHEMA.PRICE_HR_VIEW(
    HOUR_OF_DAY,
    TIME_OF_DAY,
    DAY_OF_WEEK,
    RIDE_COUNT,
    BOROUGH
)AS 
SELECT HOUR, TIMEOFDAY, DAY_OF_WEEK, SUM(VENDORID) AS RIDE_COUNT, BOROUGH
FROM FACT_GREEN_YELLOW F
JOIN DIM_ZONE_LOOKUP Z ON F.PULOCATIONID = Z.LOCATIONID
WHERE BOROUGH IN ('Bronx', 'Brooklyn', 'Queens', 'Staten Island', 'Manhattan')
GROUP BY HOUR, TIMEOFDAY, DAY_OF_WEEK, BOROUGH
ORDER BY RIDE_COUNT DESC;

SELECT *
FROM PRICE_HR_VIEW;