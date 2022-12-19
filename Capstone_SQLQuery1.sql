select * into Master_table
	from Cyclistic_TripData_202111$
	union all
	select *
	from Cyclistic_TripData_202112$
	union all
	select *
	from Cyclistic_TripData_202201$
	union all
	select *
	from Cyclistic_TripData_202202$
	union all
	select *
	from Cyclistic_TripData_202203$
	union all
	select *
	from Cyclistic_TripData_202204$
	union all
	select *
	from Cyclistic_TripData_202205$
	union all
	select *
	from Cyclistic_TripData_202206$
	union all
	select *
	from Cyclistic_TripData_202207$
	union all
	select *
	from Cyclistic_TripData_202208$
	union all
	select *
	from Cyclistic_TripData_202209$
	union all
	select *
	from Cyclistic_TripData_202210$
;


SELECT * into null_cleared
FROM Master_table where start_station_name not like '%NULL%'
						AND end_station_name  NOT LIKE '%NULL%'
							AND start_lat  NOT LIKE '%NULL%'
								AND start_lng  NOT LIKE '%NULL%'
									AND end_lat  NOT LIKE '%NULL%'
										AND end_lng NOT LIKE '%NULL%'
											AND end_station_id NOT LIKE '%NULL%'
												AND start_station_id NOT LIKE '%NULL%';


SELECT * into ride_id_cleaned
from null_cleared 
where len(ride_id) = 16

Select ride_id, datename(weekday,Started_at) into day_of_week
from ride_id_cleaned

select * into day_ofweek_cleaned
from dbo.ride_id_cleaned t1
join dbo.day_of_week t2
on t1.ride_id = t2.ride_id2;

Select ride_id2, replace(ride_type,'docked_bike', 'classic_bike') as ride_type1 into ride_type_cleaned2
from day_ofweek_cleaned

select ride_type1, count(ride_type1)
from ride_type_cleaned2
group by ride_type1

select * into fn
from day_ofweek_cleaned t1
join ride_type_cleaned2 t2
on t1.ride_id2 = t2.ride_id3;

-----------Data Analysis and Visualisation--------


-----1. Find out Type of Ride and Type of Member
SELECT ride_type1, member_type, count(*) AS amount_of_rides
   FROM fn
   GROUP BY ride_type1, member_type
   ORDER BY member_type, amount_of_rides DESC


-----2. Find out total numbers of member or casual riders DEPARTING from respective stations
SELECT COUNT(member_type) AS Casual, start_station_name
	FROM fn
	WHERE member_type = 'casual' 
	GROUP BY start_station_name 

SELECT COUNT(member_type) AS Member, start_station_name
	FROM fn
	WHERE member_type = 'member' 
	GROUP BY start_station_name 


-----3. Find out the how different member type rides of different day of week
   SELECT member_type, day_of_week, count(*) AS num_of_rides
   FROM fn
   GROUP BY member_type, day_of_week


-----4. Find out the starting docking station location for casuals:
	SELECT start_station_name, 
      ROUND(AVG(start_lat), 4) AS start_lat, 
      ROUND(AVG(start_lng), 4) AS start_lng,  
      count(*) AS num_of_rides
   FROM fn
   WHERE member_type = 'casual' 
   GROUP BY start_station_name


-----5. Find out the starting docking station location for members:
    SELECT start_station_name,
      ROUND(AVG(start_lat), 4) AS start_lat, 
      ROUND(AVG(start_lng), 4) AS start_lng,  
      count(*) AS num_of_rides
   FROM fn
   WHERE member_type = 'member' 
   GROUP BY start_station_name


-----6. Find out the ending docking station location for casuals:
   SELECT end_station_name,
      ROUND(AVG(end_lat), 4) AS end_lat, 
      ROUND(AVG(end_lng), 4) AS end_lng,  
      count(*) AS num_of_rides
   FROM fn
   WHERE member_type = 'casual' 
   GROUP BY end_station_name


-----7. Find out the ending docking station location for members:
SELECT end_station_name,
      ROUND(AVG(end_lat), 4) AS end_lat, 
      ROUND(AVG(end_lng), 4) AS end_lng,  
      count(*) AS num_of_rides
   FROM fn
   WHERE member_type = 'member'
   GROUP BY end_station_name
