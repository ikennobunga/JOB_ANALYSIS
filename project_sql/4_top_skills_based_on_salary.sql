SELECT
  skills_dim.skills,
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
GROUP BY
  skills_dim.skills
ORDER BY
  avg_yearly_salary DESC
LIMIT 25



/*--
Here are the paying skills for data analysts, the top 25, can you provide some quick insights into some trends in the top-paying jobs

Key Trends in Top-Paying Data Analyst Skills
	1.	Emergence of Specialized Skills:
	•	SVN (Subversion) stands out with an exceptionally high average yearly salary of $400,000, indicating a niche demand for version control expertise in specific sectors.
	•	Solidity, used for smart contract development on blockchain platforms, commands a significant salary of $179,000, reflecting the growing importance of blockchain technology.
	2.	Programming and Development Tools:
	•	Skills like Golang ($155,000) and Terraform ($146,734) are highly valued, showing the demand for expertise in modern programming languages and infrastructure automation tools.
	•	Couchbase ($160,515) and VMware ($147,500) indicate a strong market for database management and virtualization skills.
	3.	AI and Machine Learning Frameworks:
	•	Tools such as DataRobot ($155,486), MXNet ($149,000), and Keras ($127,013) highlight the premium placed on machine learning and AI capabilities.
	•	The presence of Hugging Face ($123,950) and TensorFlow ($120,647) signifies the importance of natural language processing and deep learning frameworks.
	4.	Data Management and Analysis Tools:
	•	Skills like dplyr ($147,633), a data manipulation package in R, emphasize the need for data wrangling expertise.
	•	Technologies such as Kafka ($129,999) and Cassandra ($118,407) are essential for handling large-scale data streaming and storage solutions.
	5.	Version Control and Collaboration Platforms:
	•	Tools like GitLab ($134,126), Bitbucket ($116,712), and collaboration platforms like Notion ($118,092) are crucial for collaborative software development environments.
	6.	Industry-Specific Applications:
	•	The diverse range of skills also includes industry-specific applications like Twilio ($138,500) for communication APIs and Ansible ($124,370) for IT automation.
Overall, these trends illustrate a strong demand for specialized technical skills across various domains within data analytics. The focus is on advanced programming languages, AI frameworks, data management tools, and collaborative platforms that enhance productivity and innovation in data-driven environments.
*/