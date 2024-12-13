/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT skd.skills, 
        ROUND(AVG(salary_year_avg),0) as avg_salary
        
FROM job_postings_fact as jp

INNER JOIN skills_job_dim as sjd 
on jP.job_id = sjd.job_id

INNER JOIN skills_dim as skd 
ON sjd.skill_id = skd.skill_id

WHERE job_title_short = 'Data Analyst' AND salary_year_avg is not NULL
GROUP BY skd.skills

ORDER BY avg_salary DESC
LIMIT 25


/*The top-paying skills for data analysts reflect a strong demand for 
expertise in cloud technologies, machine learning, real-time data processing,
and DevOps. Skills related to data storage, processing, and cloud infrastructure,
such as Couchbase, Kafka, VMware, and Terraform, command high salaries, indicating 
their importance in managing big data systems and scalable infrastructures. Machine 
learning frameworks like TensorFlow, Keras, PyTorch, and Hugging Face are also highly 
valued, highlighting the increasing reliance on AI-driven analytics. Additionally, 
programming languages like Go (Golang), Scala, and Perl are sought after for building 
data pipelines and scalable applications. DevOps and automation tools, including Ansible, 
Puppet, and Terraform, show the growing need for efficient workflows and reliable data 
infrastructure. Cloud platforms and SaaS tools like Twilio, GitLab, Notion, and Atlassian 
are key in modern data teams for communication, collaboration, and project management. 
Furthermore, technologies for real-time data processing, such as Kafka and Airflow, are 
essential for continuous data analytics. Advanced database technologies like Cassandra 
also play a significant role in handling large-scale data. Overall, the top-paying skills 
indicate that data analysts with a combination of cloud, AI/ML, real-time processing, and 
automation expertise are in high demand and can command lucrative salaries.*/
