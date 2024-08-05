CREATE VIEW capstone_de.group_3_schema.PICKUP_BY_AIRPORT_VW AS
SELECT BOROUGH, ZONE AS PICKUP_ZONE, dolocationid, COUNT(PULOCATIONID) AS NUM_OF_PICKUPS,
    CASE
        WHEN DOLOCATIONID = 1 then 'Newark Airport (EWR)'
        WHEN DOLOCATIONID = 132 then 'JFK Airport (JFK)'
        WHEN DOLOCATIONID = 138 then 'LaGuardia Airport (LGA)'
    END AS airport_dropfoff
FROM FACT_GREEN_YELLOW as f
JOIN dim_zone_lookup as l ON f.PULOCATIONID = l.LOCATIONID
WHERE DOLOCATIONID IN (1, 132, 138) and ZONE not in ('JFK Airport', 'LaGuardia Airport', 'Newark Airport')
GROUP BY l.borough, l.zone, DOLOCATIONID
ORDER BY COUNT(PULOCATIONID) DESC;
