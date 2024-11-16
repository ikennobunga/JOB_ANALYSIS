-- WITH skills_demand AS (
--   SELECT
--     skills_dim.skill_id,
--     skills_dim.skills,
--     job_postings_fact.job_title_short AS job_title,
--     COUNT(skills_job_dim.job_id) AS demand_count
--   FROM
--     job_postings_fact
--     INNER JOIN
--       skills_job_dim
--       ON job_postings_fact.job_id = skills_job_dim.job_id
--     INNER JOIN
--       skills_dim
--       ON skills_job_dim.skill_id = skills_dim.skill_id
--   WHERE
--     job_title_short = 'Data Analyst'
--     AND salary_year_avg IS NOT NULL
--     AND job_work_from_home = TRUE
--   GROUP BY
--     skills_dim.skill_id,
--     job_postings_fact.job_title_short
-- ),
-- avarage_salary AS (
--   SELECT
--     skills_dim.skill_id,
--     skills_dim.skills,
--     ROUND(
--       AVG(job_postings_fact.salary_year_avg),
--       0
--       ) AS avg_yearly_salary
--   FROM
--     job_postings_fact
--     INNER JOIN
--       skills_job_dim
--       ON job_postings_fact.job_id = skills_job_dim.job_id
--     INNER JOIN
--       skills_dim
--       ON skills_job_dim.skill_id = skills_dim.skill_id
-- WHERE
--   job_title_short = 'Data Analyst'
--   AND salary_year_avg IS NOT NULL
--   AND job_work_from_home = TRUE
-- GROUP BY
--   skills_dim.skill_id
-- )

-- SELECT
--   skills_demand.skill_id,
--   skills_demand.skills,
--   demand_count,
--   avg_yearly_salary
-- FROM
--   skills_demand
--   INNER JOIN
--     avarage_salary
--     ON skills_demand.skill_id = avarage_salary.skill_id
-- WHERE
--   demand_count > 10
-- ORDER BY
--   avg_yearly_salary DESC
-- LIMIT 25


-- rewriting this same query more concisely

SELECT
  skills_dim.skill_id,
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count,
  ROUND(
      AVG(job_postings_fact.salary_year_avg),
      0
    ) AS avg_yearly_salary
FROM
  job_postings_fact
  INNER JOIN
    skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
  INNER JOIN
    skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY
  skills_dim.skill_id
HAVING
  COUNT(skills_job_dim.job_id) > 10
ORDER BY
  avg_yearly_salary DESC
LIMIT 25