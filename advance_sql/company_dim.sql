-- SELECT *
-- FROM
--   skills_dim

-- SELECT *
-- FROM
--   job_postings_fact
-- LIMIT 100

-- SELECT *
-- FROM
--   skills_job_dim
-- LIMIT 10;

-- SELECT DISTINCT
--   job_country
-- FROM
--   job_postings_fact

SELECT *
FROM
  company_dim

-- SELECT
--   EXTRACT(QUARTER FROM job_posted_date) = 2 AS quarter_2_jobs,
--   company_dim.name,
--   job_id
-- FROM
--   job_postings_fact
-- INNER JOIN
--   company_dim
--   ON job_postings_fact.company_id = company_dim.company_id

-- SELECT
--   job_postings.job_id,
--   job_postings.job_title_short AS job_title,
--   skills_to_job.skill_id,
--   skills.skills
-- FROM
--   job_postings_fact AS job_postings
--   INNER JOIN
--     skills_job_dim AS skills_to_job
--     ON job_postings.job_id = skills_to_job.job_id
--   INNER JOIN
--     skills_dim AS skills
--     ON skills_to_job.skill_id = skills.skill_id
-- LIMIT 10

-- SELECT *
-- FROM (
--   SELECT
--     job_title_short,
--     job_posted_date
--   FROM
--     job_postings_fact
--   WHERE EXTRACT(MONTH FROM job_posted_date) = 3
-- ) AS march_jobs

-- WITH february_jobs AS (
--   SELECT *
--   FROM
--     job_postings_fact
--   WHERE
--     EXTRACT(MONTH FROM job_posted_date) = 2
-- )
-- SELECT *
-- FROM
--   february_jobs

-- SELECT *
-- FROM
--   company_dim
-- LIMIT 10

-- WITH company_job_count AS (
--   SELECT
--     COUNT(*) AS total_jobs,
--     company_id
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
--   LEFT JOIN
--     company_job_count
--     ON company_job_count.company_id = company_dim.company_id
-- ORDER BY
--   total_jobs DESC

-- SELECT *
-- FROM
--   job_postings_fact
-- LIMIT 10

-- WITH remote_job_skills AS (
-- SELECT
--   skills_to_job.skill_id,
--   COUNT(skills_to_job.skill_id) AS skill_count
-- FROM
--   skills_job_dim AS skills_to_job
--   INNER JOIN 
--     job_postings_fact AS job_postings
--     ON skills_to_job.job_id = job_postings.job_id
-- WHERE
--   job_postings.job_work_from_home = TRUE
--   AND job_postings.job_title_short = 'Data Analyst'
-- GROUP BY
--   skills_to_job.skill_id
-- )
-- SELECT
--   skills.skill_id,
--   skill_count,
--   skills.skills
-- FROM
--   remote_job_skills
-- INNER JOIN
--   skills_dim AS skills
--   ON remote_job_skills.skill_id = skills.skill_id
-- ORDER BY
--   skill_count DESC
-- LIMIT 5