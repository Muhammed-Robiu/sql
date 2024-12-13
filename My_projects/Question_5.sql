/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

WITH skills_demand as (

    SELECT skd.skill_id, skd.skills, COUNT(sjd.job_id) as demand_count

    FROM job_postings_fact as jp

    INNER JOIN skills_job_dim as sjd 
    on jp.job_id = sjd.job_id

    INNER JOIN skills_dim as skd 
    ON sjd.skill_id = skd.skill_id
    WHERE jp.job_title_short = 'Data Analyst'
    AND salary_year_avg is not NULL

    GROUP BY skd.skill_id

    ORDER BY demand_count DESC
),  average_salary as (

    SELECT skd.skill_id, skd.skills, 
            ROUND(AVG(salary_year_avg),0) as avg_salary
            
    FROM job_postings_fact as jp

    INNER JOIN skills_job_dim as sjd 
    on jP.job_id = sjd.job_id

    INNER JOIN skills_dim as skd 
    ON sjd.skill_id = skd.skill_id

    WHERE job_title_short = 'Data Analyst' 
    AND salary_year_avg is not NULL
    
    GROUP BY skd.skill_id

    ORDER BY avg_salary DESC
)

SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
from skills_demand
INNER JOIN average_salary 
on skills_demand.skill_id = average_salary.skill_id
 ORDER BY demand_count DESC,
 avg_salary
