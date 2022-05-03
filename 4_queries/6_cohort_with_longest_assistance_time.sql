SELECT cohorts.name as name, AVG(completed_at - started_at) as average_assistance_time
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
JOIN assistance_requests ON student_id = students.id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1



-- MY VERSION: 
-- SELECT name, average_assistance_time
-- FROM (
--   SELECT cohorts.name as name, AVG(completed_at - started_at) as average_assistance_time
--   FROM students
--   JOIN cohorts ON cohorts.id = students.cohort_id
--   JOIN assistance_requests ON student_id = students.id
--   GROUP BY cohorts.name
--   ORDER BY AVG(completed_at - started_at)
-- ) AS x
-- WHERE average_assistance_time = (
--   SELECT Max(y.average_assistance_time)
--   FROM (
--   SELECT cohorts.name as name, AVG(completed_at - started_at) as average_assistance_time
--   FROM students
--   JOIN cohorts ON cohorts.id = students.cohort_id
--   JOIN assistance_requests ON student_id = students.id
--   GROUP BY cohorts.name
--   ORDER BY AVG(completed_at - started_at)
-- ) AS y)