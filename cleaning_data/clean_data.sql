CREATE TABLE job_postings_fact_staging (
  LIKE job_postings_fact INCLUDING ALL
);


INSERT INTO job_postings_fact_staging
SELECT *
FROM
  job_postings_fact


SELECT *
FROM
  job_postings_fact_staging


WITH duplicate_cte AS ( 
  SELECT *,
    ROW_NUMBER() OVER (
        PARTITION BY 
          job_id,
          company_id,
          job_title_short,
          job_title,
          job_location,
          job_via,
          job_schedule_type,
          job_work_from_home,
          job_posted_date,
          job_no_degree_mention,
          job_health_insurance,
          job_country,
          salary_year_avg,
          salary_rate,
          salary_hour_avg,
          search_location
      ) AS row_number
  FROM
    job_postings_fact_staging
)
SELECT *
FROM
  duplicate_cte
WHERE
  row_number > 1


-- SELECT *
-- FROM (
--   SELECT *,
--     ROW_NUMBER() OVER (
--         PARTITION BY 
--           job_id,
--           company_id,
--           job_title_short,
--           job_title,
--           job_location,
--           job_via,
--           job_schedule_type,
--           job_work_from_home,
--           job_posted_date,
--           job_no_degree_mention,
--           job_health_insurance,
--           job_country,
--           salary_year_avg,
--           salary_rate,
--           salary_hour_avg,
--           search_location
--       ) AS row_number
--   FROM
--     job_postings_fact_staging
-- ) AS duplicate_cte
-- WHERE
--   row_number > 1


DELETE
FROM
  duplicate_cte
WHERE
  row_number > 1

-- OR

DELETE 
FROM 
  duplicate_cte
WHERE id IN (
    SELECT id 
    FROM CTE 
    WHERE row_num > 1
);

SELECT
  DISTINCT job_title
FROM
  job_postings_fact_staging
ORDER BY 1
