# Google-Capstone-Project-Cyclistic

## Introduction:

I have selected the Cyclistic case study for the Capstone Project of the Google Data Analytics Professional Certificate.

I follow the six stages of the data analysis process (Ask, Prepare, Process, Analyse, Share & Act), and apply technical tools (SQL, Tableau, R) in each stage to gather insights from data.

I have completed this Project as a junior data analyst for the marketing team at Cyclistic, a bike-share company in Chicago.





## 1. Ask

The business strategy of Cyclistic is to convert Casuals to Members and the Marketing Team will launch a campaign to achieve this goal. As a junior data analyst, I will provide insight to help the campaign better attracting Causals by analysing How Members and Casual use Cyclistic bikes differently.


## 2. Prepare

I am analysing historical Cyclistic data for 12 months (from Nov 2021 to Oct 2022) The data is reliable and stored in CSV file. 

Note: The raw Cyclistic dataset can be found here (https://divvy-tripdata.s3.amazonaws.com/index.html).

The identity of the riders has been safeeguarded by hiding personal information through tokenisation.


## 3. Process

I used SQL on Microsoft SQL to combine and clean the data.

- Combine data from 12 separate excel files into one.

- Data verification and Cleaning
a. Remove invalid data, cells that are empty ("null") in all row and column.

b. Remove rows where ride_id is inconsistent as the standard lengths values, 16 characters.

c. Replace "docked_bike" with "classic_bike" as they represent the same classic bike.

d. Extract days of the week, month, time and duration of rides.
 

## 4 & 5. Analyse & Share Insights

The two stages are perfromed together here.

Microsoft SQL and Tableau Public are used for Data Exploration and Data Visualisation.

Insight from analysis

1. Classic Bike is preferred over Electric Bike for both Members and Casuals. The campaign should focus on Classic Bike.

2. The ridership of members rises between 6am and 8am, peaks between 4pm and 6pm and steadily decreases after 7pm. Also, the ridership for members on weekdays is significantly higher than weekend while casuals is higher on weekends.
   It supports two assumptions:
   
   a. Members ride for commute since the ridership levels peaks during the typical commute time and plummet out of business hours. 
   
   b. Casuals ride for leisure purpose as the ridership in weekend is dramatically higher than weekdays.
   
3. The average duration for Casuals are higher than Members, which is generally between 20 to 30 minutes while Members is only about 10 minutes.

4. The riderships of both casuals and members are dramatically higher between March and June. The average duration is also higher during these months. It indicates that customers prefer to ride in Summer. It could possibly due to the weather.

5. The length of ride for members is relatively consistant across the year. It may be due to the same distance of transit from office to home. Another evidence supports that members ride for commute.

6. Members generally ride in the business area as it is where most the starting and ending locations are while casuals are more close to coastal area. Another strong finding backs that casuals are tourists while members are for commute in the business area.

Summary of Insights


1. Casuals tend to ride for leisure and the preferred time is between midday and evening on the weekend in the late spring and early summer (March to June).

2. Members tend to ride for commute and the preferred time is the peak commute hours (8am and 5pm) in the weekdays in the late spring and early summer (March to June).

3. Casuals tend to start and finish their trips next to the coastal area and tourist attractions while members ride in the business area.


## 6. Act

- The marketing campaign should be held in the summer to capture the highest level of ridership of casuals and more resources should be spent on coastal area, the most popular starting and ending stations for casuals during weekends.

- Cyclistic should consider a new short-term membership which is valid for weekend to capture casuals who are Chicago resident and rides for leisure in the weekends.

- A summer pass should also be considered to seize the peak in the level of ridership between March and June.
