/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

with top_jobs as (
    SELECT 
        job_id,
        cd.name as company_name,
        job_title_short,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact as jp
    LEFT JOIN company_dim as cd 
    ON jp.company_id = cd.company_id 

    WHERE job_title_short = 'Data Analyst' and 
    job_location = 'Anywhere' AND 
    salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_jobs.*, skd.skills

FROM top_jobs

INNER JOIN skills_job_dim as sjd 
on top_jobs.job_id = sjd.job_id

INNER JOIN skills_dim as skd 
ON sjd.skill_id = skd.skill_id

ORDER BY salary_year_avg DESC