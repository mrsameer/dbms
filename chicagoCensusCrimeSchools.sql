--Find the total number of crimes recorded in the CRIME table
select count(*) from chicago_crime_data;

--Retrieve first 10 rows from the CRIME table
select * from chicago_crime_data limit 10;

--How many crimes involve an arrest?
select count(*) from  chicago_crime_data where arrest = 'TRUE';

--Which unique types of crimes have been recorded at GAS STATION locations?
select DISTINCT(primary_type) from chicago_crime_data where location_description = 'GAS STATION';

--In the CENUS_DATA table list all Community Areas whose names start with the letter ‘B’.
select community_area_name from CENSUS_DATA where community_area_name like 'B%';

--Which schools in Community Areas 10 to 15 are healthy school certified?
select name_of_school from CHICAGO_PUBLIC_SCHOOLS where (community_area_number between 10 and 15) and healthy_school_certified = 'Yes';

--What is the average school Safety Score?
select avg(safety_score) from CHICAGO_PUBLIC_SCHOOLS;

--List the top 5 Community Areas by average College Enrollment [number of students]

select community_area_name, avg(college_enrollment) as average
from CHICAGO_PUBLIC_SCHOOLS
group by community_area_name order by average desc limit 5;

--Use a sub-query to determine which Community Area has the least value for school Safety Score?
select community_area_name 
from CHICAGO_PUBLIC_SCHOOLS 
where safety_score in (select min(safety_score) from CHICAGO_PUBLIC_SCHOOLS);

--[Without using an explicit JOIN operator] Find the Per Capita Income of the Community Area which has a school Safety Score of 1
select per_capita_income from CENSUS_DATA 
where lower (community_area_name) in (select lower(community_area_name) from CHICAGO_PUBLIC_SCHOOLS where safety_score = 1);
