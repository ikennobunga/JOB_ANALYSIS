-- SELECT
-- 	COUNT(*) AS job_with_health_insurance
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	job_health_insurance = TRUE

-- SELECT
-- 	job_country,
-- 	COUNT(job_id) AS total_job_count
-- FROM
-- 	job_postings_fact
-- GROUP BY
-- 	job_country
-- ORDER BY
-- 	job_country 

-- SELECT
-- 	SUM(salary_year_avg) / COUNT(salary_year_avg) AS average_yearly_salary_remote
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL
-- AND 
-- 	job_work_from_home = TRUE

-- SELECT
-- 	MIN(salary_year_avg),
-- 	MAX(salary_year_avg)
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL
-- 	AND job_location LIKE '%San Francisco, CA%'

-- SELECT
-- 	MIN(salary_year_avg) AS min_salary_year,
-- 	MAX(salary_year_avg) AS max_salary_year
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL
-- 	AND job_location LIKE '%San Francisco, CA%'

-- SELECT
-- 	AVG(salary_year_avg) AS avg_salary_year
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	job_title_short = 'Data Scientist' 
-- 	AND salary_year_avg IS NOT NULL

-- SELECT
-- 	job_title_short AS job_title,
-- 	AVG(salary_year_avg) AS avg_salary,
-- 	MIN(salary_year_avg) AS min_salary,
-- 	MAX(salary_year_avg) AS max_salary
-- FROM
-- 	job_postings_fact
-- GROUP BY
-- 	job_title_short
-- HAVING
-- 	COUNT(job_title_short) > 1000
-- ORDER BY
-- 	job_title_short ASC

-- SELECT
-- 	job_country,
-- 	COUNT(job_country) AS job_postings_per_country,
-- 	AVG(salary_year_avg) AS avg_salary_year
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL 
-- 	AND job_country IS NOT NULL
-- GROUP BY
-- 	job_country
-- HAVING
-- 	AVG(salary_year_avg) > 100000
-- ORDER BY
-- 	job_postings_per_country DESC

-- SELECT
-- 	job_location,
-- 	job_title_short AS job_title,
-- 	COUNT(job_id) AS no_remote_job
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	job_work_from_home = FALSE
-- GROUP BY
-- 	job_location,
-- 	job_title_short
-- HAVING
-- 	AVG(salary_year_avg) > 70000
-- ORDER BY
-- 	no_remote_job DESC

-- SELECT
--   skills,
--   skill_id
-- FROM 
--   skills_dim
-- WHERE
--   type IS NULL

-- SELECT
--   job_id,
--   job_title,
--   salary_year_avg AS job_without_yearly_salary,
--   salary_hour_avg AS job_without_hourly_salary,
--   job_country,
--   COUNT(job_country)
-- FROM
--   job_postings_fact
-- WHERE
--   salary_hour_avg IS NULL
--   AND salary_year_avg IS NULL
-- GROUP BY
--   job_id,
--   job_title,
--   salary_year_avg,
--   salary_hour_avg,
--   job_country
-- ORDER BY
--   job_id DESC;

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   companies.name AS company_name
-- FROM
--   job_postings_fact AS job_postings
-- LEFT JOIN
--   company_dim AS companies
-- ON
--   job_postings.company_id = companies.company_id

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   skills.skills,
--   skills_to_job.skill_id
-- FROM
--   job_postings_fact AS job_postings
-- INNER JOIN 
--   skills_job_dim AS skills_to_job 
--   ON job_postings.job_id = skills_to_job.job_id
-- INNER JOIN
--   skills_dim AS skills
--   ON skills_to_job.skill_id = skills.skill_id

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   job_postings.job_location AS job_location,
--   job_postings.job_posted_date,
--   companies.name AS company_name
-- FROM
--   job_postings_fact AS job_postings
-- INNER JOIN
--   company_dim AS companies
--   ON job_postings.company_id = companies.company_id
-- WHERE
--   job_title = 'Data Scientist'
-- ORDER BY
--   job_posted_date DESC;

-- SELECT
--   skills.skills,
--   COUNT(skills_to_job.job_id) AS total_jobs_posted,
--   AVG(job_postings.salary_year_avg) AS avg_yearly_salary
-- FROM
--   skills_dim AS skills
-- LEFT JOIN
--   skills_job_dim AS skills_to_job
--   ON skills.skill_id = skills_to_job.skill_id
-- LEFT JOIN
--   job_postings_fact AS job_postings
--   ON skills_to_job.job_id = job_postings.job_id
-- WHERE
--   job_postings.salary_year_avg IS NOT NULL
-- GROUP BY
--   skills.skills
-- ORDER BY
--   avg_yearly_salary DESC;

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   skills.skills
-- FROM
--   job_postings_fact AS job_postings
--   LEFT JOIN
--     skills_job_dim AS skills_to_job
--     ON job_postings.job_id = skills_to_job.job_id
--   LEFT JOIN
--     skills_dim AS skills
--     ON skills_to_job.skill_id = skills.skill_id
-- WHERE
--   job_postings.job_location = 'New York'
--   AND job_health_insurance = TRUE
-- ORDER BY
--   job_postings.job_id

-- SELECT
--   COUNT(job_postings.job_id) AS total_jobs,
--   skills.skills
-- FROM
--   job_postings_fact AS job_postings
--   INNER JOIN
--     skills_job_dim AS skills_to_job
--     ON job_postings.job_id = skills_to_job.job_id
--   INNER JOIN
--     skills_dim AS skills
--     ON skills_to_job.skill_id = skills.skill_id
-- WHERE
--   job_postings.salary_year_avg > 100000
--   AND job_postings.job_work_from_home = TRUE
-- GROUP BY
--   skills.skills
-- ORDER BY
--   total_jobs DESC


-- ALTER TABLE job_postings_fact
-- ADD contact VARCHAR(255);

-- SELECT *
-- FROM job_postings_fact
-- WHERE job_id = 1

-- UPDATE job_postings_fact
-- SET contact = 'Lusail Commercial Boulverde'
-- WHERE job_id = 1;

-- ALTER TABLE job_postings_fact
-- RENAME COLUMN contact TO contact_address

-- ALTER TABLE job_postings_fact
-- ALTER COLUMN contact_address TYPE TEXT;
-- SELECT
-- 	COUNT(*) AS job_with_health_insurance
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	job_health_insurance = TRUE

-- SELECT
-- 	job_country,
-- 	COUNT(job_id) AS total_job_count
-- FROM
-- 	job_postings_fact
-- GROUP BY
-- 	job_country
-- ORDER BY
-- 	job_country 

-- SELECT
-- 	SUM(salary_year_avg) / COUNT(salary_year_avg) AS average_yearly_salary_remote
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL
-- AND 
-- 	job_work_from_home = TRUE

-- SELECT
-- 	MIN(salary_year_avg),
-- 	MAX(salary_year_avg)
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL
-- 	AND job_location LIKE '%San Francisco, CA%'

-- SELECT
-- 	MIN(salary_year_avg) AS min_salary_year,
-- 	MAX(salary_year_avg) AS max_salary_year
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL
-- 	AND job_location LIKE '%San Francisco, CA%'

-- SELECT
-- 	AVG(salary_year_avg) AS avg_salary_year
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	job_title_short = 'Data Scientist' 
-- 	AND salary_year_avg IS NOT NULL

-- SELECT
-- 	job_title_short AS job_title,
-- 	AVG(salary_year_avg) AS avg_salary,
-- 	MIN(salary_year_avg) AS min_salary,
-- 	MAX(salary_year_avg) AS max_salary
-- FROM
-- 	job_postings_fact
-- GROUP BY
-- 	job_title_short
-- HAVING
-- 	COUNT(job_title_short) > 1000
-- ORDER BY
-- 	job_title_short ASC

-- SELECT
-- 	job_country,
-- 	COUNT(job_country) AS job_postings_per_country,
-- 	AVG(salary_year_avg) AS avg_salary_year
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	salary_year_avg IS NOT NULL 
-- 	AND job_country IS NOT NULL
-- GROUP BY
-- 	job_country
-- HAVING
-- 	AVG(salary_year_avg) > 100000
-- ORDER BY
-- 	job_postings_per_country DESC

-- SELECT
-- 	job_location,
-- 	job_title_short AS job_title,
-- 	COUNT(job_id) AS no_remote_job
-- FROM
-- 	job_postings_fact
-- WHERE
-- 	job_work_from_home = FALSE
-- GROUP BY
-- 	job_location,
-- 	job_title_short
-- HAVING
-- 	AVG(salary_year_avg) > 70000
-- ORDER BY
-- 	no_remote_job DESC

-- SELECT
--   skills,
--   skill_id
-- FROM 
--   skills_dim
-- WHERE
--   type IS NULL

-- SELECT
--   job_id,
--   job_title,
--   salary_year_avg AS job_without_yearly_salary,
--   salary_hour_avg AS job_without_hourly_salary,
--   job_country,
--   COUNT(job_country)
-- FROM
--   job_postings_fact
-- WHERE
--   salary_hour_avg IS NULL
--   AND salary_year_avg IS NULL
-- GROUP BY
--   job_id,
--   job_title,
--   salary_year_avg,
--   salary_hour_avg,
--   job_country
-- ORDER BY
--   job_id DESC;

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   companies.name AS company_name
-- FROM
--   job_postings_fact AS job_postings
-- LEFT JOIN
--   company_dim AS companies
-- ON
--   job_postings.company_id = companies.company_id

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   skills.skills,
--   skills_to_job.skill_id
-- FROM
--   job_postings_fact AS job_postings
-- INNER JOIN 
--   skills_job_dim AS skills_to_job 
--   ON job_postings.job_id = skills_to_job.job_id
-- INNER JOIN
--   skills_dim AS skills
--   ON skills_to_job.skill_id = skills.skill_id

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   job_postings.job_location AS job_location,
--   job_postings.job_posted_date,
--   companies.name AS company_name
-- FROM
--   job_postings_fact AS job_postings
-- INNER JOIN
--   company_dim AS companies
--   ON job_postings.company_id = companies.company_id
-- WHERE
--   job_title = 'Data Scientist'
-- ORDER BY
--   job_posted_date DESC;

-- SELECT
--   skills.skills,
--   COUNT(skills_to_job.job_id) AS total_jobs_posted,
--   AVG(job_postings.salary_year_avg) AS avg_yearly_salary
-- FROM
--   skills_dim AS skills
-- LEFT JOIN
--   skills_job_dim AS skills_to_job
--   ON skills.skill_id = skills_to_job.skill_id
-- LEFT JOIN
--   job_postings_fact AS job_postings
--   ON skills_to_job.job_id = job_postings.job_id
-- WHERE
--   job_postings.salary_year_avg IS NOT NULL
-- GROUP BY
--   skills.skills
-- ORDER BY
--   avg_yearly_salary DESC;

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   skills.skills
-- FROM
--   job_postings_fact AS job_postings
--   LEFT JOIN
--     skills_job_dim AS skills_to_job
--     ON job_postings.job_id = skills_to_job.job_id
--   LEFT JOIN
--     skills_dim AS skills
--     ON skills_to_job.skill_id = skills.skill_id
-- WHERE
--   job_postings.job_location = 'New York'
--   AND job_health_insurance = TRUE
-- ORDER BY
--   job_postings.job_id

-- SELECT
--   COUNT(job_postings.job_id) AS total_jobs,
--   skills.skills
-- FROM
--   job_postings_fact AS job_postings
--   INNER JOIN
--     skills_job_dim AS skills_to_job
--     ON job_postings.job_id = skills_to_job.job_id
--   INNER JOIN
--     skills_dim AS skills
--     ON skills_to_job.skill_id = skills.skill_id
-- WHERE
--   job_postings.salary_year_avg > 100000
--   AND job_postings.job_work_from_home = TRUE
-- GROUP BY
--   skills.skills
-- ORDER BY
--   total_jobs DESC


-- ALTER TABLE job_postings_fact
-- ADD contact VARCHAR(255);

-- SELECT *
-- FROM job_postings_fact
-- WHERE job_id = 1

-- UPDATE job_postings_fact
-- SET contact = 'Lusail Commercial Boulverde'
-- WHERE job_id = 1;

-- ALTER TABLE job_postings_fact
-- RENAME COLUMN contact TO contact_address

-- ALTER TABLE job_postings_fact
-- ALTER COLUMN contact_address TYPE TEXT;

-- ALTER TABLE job_postings_fact
-- DROP COLUMN contact_address;

-- SELECT *
-- FROM job_postings_fact
-- LIMIT 1

-- CREATE TABLE public.data_science_jobs (
--   job_id INT PRIMARY KEY,
--   job_title TEXT,
--   company_name TEXT,
--   post_date DATE
-- )

-- INSERT INTO data_science_jobs (
--   job_id,
--   job_title,
--   company_name,
--   post_date
-- ) 

-- VALUES 
--   (
--     1,
--     'Data Scientist',
--     'Google',
--     '2022-01-01'
--   ),
--   (
--     2,
--     'Machine Learning Engineer',
--     'Microsoft',
--     '2022-01-02'
--   ),
--   (
--     3,
--     'Data Analyst',
--     'Facebook',
--     '2022-01-03'
--   )

-- ALTER TABLE data_science_jobs
-- ADD COLUMN remote BOOLEAN

-- ALTER TABLE data_science_jobs
-- RENAME COLUMN post_date TO posted_on

-- ALTER TABLE data_science_jobs
-- ALTER COLUMN remote SET DEFAULT FALSE  

-- INSERT INTO data_science_jobs (
--   job_id,
--   job_title, 
--   company_name,
--   posted_on,
-- )
-- VALUES (
--   4,
--   'Data Engineer',
--   'Ubeer',
--   '2022-01-04'
-- )

-- ALTER TABLE data_science_jobs
-- DROP COLUMN company_name

-- UPDATE data_science_jobs
-- SET remote = TRUE
-- WHERE job_id = 2

-- DROP TABLE data_science_jobs

-- SELECT
--   job_posted_date
-- FROM
--   job_postings_fact

-- SELECT
--   job_title_short AS title,
--   job_location AS location,
--   job_posted_date :: DATE AS date_posted
-- FROM
--   job_postings_fact

-- SELECT
--   job_title_short AS title,
--   job_location AS location,
--   job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_posted
-- FROM
--   job_postings_fact
-- LIMIT 10

-- SELECT
--   job_title_short AS title,
--   job_location AS location,
--   job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_posted,
--   EXTRACT(MONTH FROM job_posted_date) AS month,
--   EXTRACT(YEAR FROM job_posted_date) AS year
-- FROM
--   job_postings_fact
-- LIMIT 10

/*HOW JOB POSTINGS ON DATA SCIENTIST ARE TRENDING FROM MONTH TO MONTH
-- SELECT
--   COUNT(job_id) AS job_count,
--   job_title_short AS title,
--   EXTRACT(MONTH FROM job_posted_date) AS month
-- FROM
--   job_postings_fact AS job_postings
-- WHERE
--   job_title_short = 'Data Scientist'
-- GROUP BY
--   month,
--   job_title_short
-- ORDER BY
--   job_count DESC
*/

/*CREATE TABLE FROM OTHER TABLES ON DATES / MONTH
--January
CREATE TABLE january_jobs AS
  SELECT*
  FROM
    job_postings_fact
  WHERE
    EXTRACT(MONTH FROM job_posted_date) = 1;

--February
CREATE TABLE february_jobs AS
  SELECT*
  FROM
    job_postings_fact
  WHERE
    EXTRACT(MONTH FROM job_posted_date) = 2;

--March
CREATE TABLE march_jobs AS
  SELECT*
  FROM
    job_postings_fact
  WHERE
    EXTRACT(MONTH FROM job_posted_date) = 3;
*/

-- SELECT
--   job_posted_date
-- FROM
--   march_jobs

-- CASE EXPRESSION
-- SELECT
--   COUNT(job_id) AS number_of_jobs,
--   job_title_short,
--   job_location,
--   CASE
--     WHEN job_location = 'Anywhere' THEN 'Remote'
--     WHEN job_location = 'New York, NY' THEN 'Local'
--     ELSE 'Onsite'
--   END AS location_category
-- FROM
--   job_postings_fact
-- WHERE
--   job_title_short = 'Data Analyst'
-- GROUP BY
--   location_category,
--   job_location,
--   job_title_short
-- ORDER BY
--   number_of_jobs DESC
-- LIMIT 10

-- SELECT
--   job_schedule_type,
--   AVG(salary_year_avg) AS avg_yearly_salary,
--   AVG(salary_hour_avg) AS avg_hourly_salary
-- FROM
--   job_postings_fact
-- WHERE
--   job_posted_date :: DATE > '2023-06-1'
-- GROUP BY
--   job_schedule_type
-- ORDER BY
--   job_schedule_type

-- SELECT
--   COUNT(*) AS job_postings,
--   EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month
-- FROM
--   job_postings_fact
-- GROUP BY
--   month
-- ORDER BY
--   month

-- SELECT
--   COUNT(job_postings_fact.job_id) AS number_of_jobs_posted,
--   company_dim.name AS company_name
-- FROM
--   job_postings_fact
-- INNER JOIN
--   company_dim
--   ON job_postings_fact.company_id = company_dim.company_id
-- WHERE
--   job_postings_fact.job_health_insurance = TRUE
--   AND EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 2
-- GROUP BY
--   company_name
-- HAVING
--   COUNT(job_postings_fact.job_id) > 0
-- ORDER BY
--   number_of_jobs_posted DESC
-- LIMIT 100

-- SELECT
--   job_id,
--   job_title_short,
--   salary_year_avg,
-- CASE
--   WHEN salary_year_avg > 100000 THEN 'High Salary'
--   WHEN salary_year_avg BETWEEN 60000 AND 99999 THEN 'Standard Salary'
--   WHEN salary_year_avg < 60000 THEN 'Low Salary'
--   END AS salary_category
-- FROM
--   job_postings_fact
-- WHERE
--   job_title_short = 'Data Analyst'
--   AND salary_year_avg IS NOT NULL
-- ORDER BY
--   salary_year_avg DESC

-- SELECT 
--   COUNT(DISTINCT company_id) AS number_of_companies,
--   job_work_from_home,
--   CASE
--     WHEN job_work_from_home = TRUE THEN 'Work from Home'
--     WHEN job_work_from_home = FALSE THEN 'Onsite'
--     END AS remote_status
-- FROM
--   job_postings_fact
-- GROUP BY
--   job_work_from_home

-- SELECT 
--     COUNT(DISTINCT CASE WHEN job_work_from_home = TRUE THEN company_id END) AS wfh_companies,
--     COUNT(DISTINCT CASE WHEN job_work_from_home = FALSE THEN company_id END) AS non_wfh_companies
-- FROM job_postings_fact;
  
-- SELECT
--   job_id,
--   salary_year_avg,
--   CASE
--     WHEN job_title_short ILIKE '%Senior%' THEN 'Senior'
--     WHEN job_title_short ILIKE 'Manager' OR job_title_short ILIKE '%Lead%' THEN 'lead/Manager'
--     WHEN job_title_short ILIKE '%Junior%' OR job_title_short ILIKE '%Entry%' THEN 'Junior/Entry'
--     ELSE 'not specified'
--   END AS job_experience_level,
--   CASE
--     WHEN job_work_from_home = TRUE THEN 'Yes'
--     WHEN job_work_from_home = FALSE THEN 'No'
--   END AS remote_option
-- FROM
--   job_postings_fact
-- WHERE
--   salary_year_avg IS NOT NULL
-- ORDER BY
--   job_id
-- LIMIT 500

-- SELECT *
-- FROM (
--   SELECT *
--   FROM
--     job_postings_fact
--   WHERE
--     EXTRACT(MONTH FROM job_posted_date) = 2
-- ) AS january_jobs


-- SELECT *
-- FROM (
--   SELECT *
--   FROM
--     job_postings_fact
--   WHERE
--     EXTRACT(MONTH FROM job_posted_date) = 3
-- ) AS march_jobs


------------------------------------------------------
-- WITH january_jobs AS (
--   SELECT *
--   FROM
--     job_postings_fact
--   WHERE
--     EXTRACT(MONTH FROM job_posted_date) = 2
-- )

-- SELECT *
-- FROM
--   january_jobs
------------------------------------------------------

-- SELECT
--   company_id,
--   name AS company_name
-- FROM
--   company_dim
-- WHERE
--   company_id IN (
--     SELECT
--       company_id
--     FROM
--       job_postings_fact
--     WHERE
--       job_no_degree_mention = TRUE
--     ORDER BY
--       company_id
--   )

-- WITH company_job_count AS (
--   SELECT
--     company_id,
--     COUNT(*) AS total_jobs
--   FROM
--     job_postings_fact
--   GROUP BY
--     company_id
-- )
-- SELECT
--   company_dim.name AS company_name,
--   company_job_count.total_jobs
-- FROM
--   company_dim
-- LEFT JOIN
--   company_job_count 
--   ON company_job_count.company_id = company_dim.company_id
-- ORDER BY
--   total_jobs DESC

-- WITH remote_job_skills AS (
--   SELECT
--     skills_to_job.skill_id,
--     COUNT(skills_to_job.skill_id) AS skill_count
--   FROM
--     skills_job_dim AS skills_to_job
--   INNER JOIN
--     job_postings_fact AS job_postings
--     ON skills_to_job.job_id = job_postings.job_id
--   WHERE
--     job_postings.job_work_from_home = TRUE
--     AND job_postings.job_title_short = 'Data Analyst'
--   GROUP BY
--     skills_to_job.skill_id
--   ORDER BY
--     skill_count DESC
-- )
-- SELECT
--   skills.skill_id,
--   skills.skills AS skillS_name,
--   skill_count
-- FROM
--   remote_job_skills
-- INNER JOIN
--   skills_dim AS skills
--   ON remote_job_skills.skill_id = skills.skill_id
-- ORDER BY
--   skill_count DESC
-- LIMIT 5

-- ..........

-- SELECT
--   job_title_short,
--   company_id,
--   job_location
-- FROM
--   january_jobs

-- UNION

-- SELECT
--   job_title_short,
--   company_id,
--   job_location
-- FROM
--   february_jobs

-- UNION

-- SELECT
--   job_title_short,
--   company_id,
--   job_location
-- FROM
--   march_jobs

-- ..........

-- SELECT
--   job_title_short,
--   company_id,
--   job_location
-- FROM
--   january_jobs

-- UNION ALL

-- SELECT
--   job_title_short,
--   company_id,
--   job_location
-- FROM
--   february_jobs

-- UNION ALL

-- SELECT
--   job_title_short,
--   company_id,
--   job_location
-- FROM
--   march_jobs

-- ..........

SELECT
  quarter1_jobs.job_title_short,
  quarter1_jobs.job_location,
  quarter1_jobs.job_via,
  quarter1_jobs.job_posted_date :: DATE,
  quarter1_jobs.salary_year_avg
FROM (
  SELECT *
  FROM
    january_jobs

  UNION ALL

  SELECT*
  FROM
    february_jobs

  UNION ALL

  SELECT *
  FROM
    march_jobs
) AS quarter1_jobs
WHERE
  quarter1_jobs.salary_year_avg > 70000
  AND quarter1_jobs.job_title_short = 'Data Analyst'
ORDER BY
  quarter1_jobs.salary_year_avg DESC

-- ..........
