# Tech Catalyst Data Engineering Capstone
### Group 3
Ginamarie Mastrorilli, Joseph Cocozza, Andy Amoah Mensah & Jason Juncker


## Project Overview
NYC Taxi Corporation engaged a team of coluntants from the Tech Catalyst Data Engineering Program to assist with implementing a dynamic pricing system. The team must identify areas where revenue can be increased by reducing risk or modifying the amount of drivers in the area. The scope of the project involves creating a data pipeline to extract the raw data from S3, perform necessary transformations, load the data into a Conformed S3 bucket, and finally into a Transformed S3 bucket before importing it into Snowflake for final analysis using Tableau. Our team must create a implementation plan for NYC Taxi Corporation in moving forward with the next steps for further enhancements to the business. 

## Reference Architecture Diagram
![diagram](./RAD.JPG)


## Tableau Dashboards
### Dynamic Pricing Based on Collisions and Rides 
This dashboard allows users to find collisions by identifying the locations with the highest number of crashes, the hours when collisions are most likely to happen, and the volume of taxi rides in these areas at these times. The first visualization in the dashboard highlights the Ride Count by Time of Day. The user can see the total count of rides for the specified time range of September 2024 to May 2024, for all Boroughs and Days of Week. This KPI is attached to the filter for the Ride Count by Hour & Time of Day Visualization. Next, the user can see summary statistics for each Borough such as average fare amount and average trip distance. This allows users to see if any Borough is not reaching the benchmark for any area. The next visualizaiton is a map of collisions in NYC based on Zip Code. This map can be filtered by Borough and Weekday of Crash Date. The user can then visualize the rice count by hour and time of day for the borough of their interest. Finally, the last visualization of of collisions by hour. This chart connects with the filters from the map, so the user can specify which borough and day of week to focus on. 

**Example Use Case:**
NYC Taxi Corporation has the most rides in Manhattan and Queens. Based on the map below there does not seem to be significant crashes in those Boroughs which is a great sign. One borough they should be aware of for crashes is Brooklyn. Many of the crash hotpots are in Brooklyn which is a cause of concern for NYC Taxi Corporation. The user can now look at which hours or time of day has the highet ride count in Brooklyn. We can see that during the hours of 8AM, 5-6PM and 10-11PM are when most of the rides occur. By implementing dynamic pricing, NYC Taxi Corporation can mitigate their risk by charging more for rides in Brooklyn during these times. On the other hand, NYC Taxi Corporation could offer a discount for rides in Brooklyn during the hours of 1-5AM since that is their lowest ride count. These price fluctuations are justified because the collisions by hour align with these times. The most collisions happen around 8AM and 5PM, whereas the least collisions happen from 1-5AM. 