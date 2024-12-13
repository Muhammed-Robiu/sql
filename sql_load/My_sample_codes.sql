SELECT '123'::INTEGER,
		'2024-12-09'::DATE,
		'TRUE':: BOOLEAN,
		'3.24'::REAL;

SELECT job_title_short, 
	 	job_location, 
        job_posted_date::date as date; --remove timestamp and return date only
FROM
	job_postings_fact
limit 5;		

SELECT job_title_short, 
	 	job_location, 
        job_posted_date at TIME zone 'UTC' at time zone 'EST'
FROM
	job_postings_fact
limit 5;

SELECT 
    job_location,
    job_title_short,
    extract (YEAR from job_posted_date) as DATEV
from job_postings_fact;

SELECT 
	COUNT(job_id) as no_jobs,
	CASE
    	when job_location = 'Anywhere' then 'Remote'
        when job_location = 'New York, NY' then 'local'
        else 'Onsite'
    end as location_category
from job_postings_fact
where job_title_short = 'Data Analyst'
group by
	location_category;
	
select * 
	from ( select * 
          	FROM job_postings_fact
            where job_title_short = 'Data Analyst') as Data_job	

CREATE TABLE Jan_table AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

select * from mar_table LIMIT 5 

CREATE TABLE feb_table AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE mar_table AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

CREATE TABLE combined_table AS
SELECT * FROM jan_table
UNION ALL
SELECT * FROM feb_table
UNION ALL
SELECT * FROM mar_table;

select * from combined_table 
ORDER BY salary_year_avg
LIMIT 5;