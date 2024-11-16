WITH skills_for_top_paying_job AS (
  SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date,
    company_dim.name AS company_name
  FROM
    job_postings_fact
    LEFT JOIN
      company_dim
      ON job_postings_fact.company_id = company_dim.company_id
  WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
  ORDER BY
    salary_year_avg DESC
  LIMIT 10
)
SELECT
  skills_for_top_paying_job. *,
  skills_dim.skills
FROM
  skills_for_top_paying_job
  INNER JOIN
    skills_job_dim
    ON skills_for_top_paying_job.job_id = skills_job_dim.job_id
  INNER JOIN
    skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
  salary_year_avg DESC


/*-- The dataset includes the following columns:
	•	job_id: Identifier for each job listing
	•	job_title: Title of the job position
	•	salary_year_avg: Average yearly salary for the position
	•	job_posted_date: Date when the job was posted
	•	company_name: Name of the company offering the job
	•	skills: Skills required for the position

I’ll now analyze the skills column to identify the most frequently required skills for these top-paying data analyst roles.

The top 10 most frequently listed skills in high-paying data analyst roles are:
	1.	SQL - 8 mentions
	2.	Python - 7 mentions
	3.	Tableau - 6 mentions
	4.	R - 4 mentions
	5.	Snowflake - 3 mentions
	6.	Pandas - 3 mentions
	7.	Excel - 3 mentions
	8.	Azure - 2 mentions
	9.	Bitbucket - 2 mentions
	10.	Go - 2 mentions

This suggests that SQL, Python, and Tableau are highly in demand, with SQL and Python being particularly prominent across top-paying data analyst roles. Skills in data visualization (Tableau), data manipulation (Pandas), and cloud/data warehouse solutions (Snowflake and Azure) are also valuable. ￼
--*/