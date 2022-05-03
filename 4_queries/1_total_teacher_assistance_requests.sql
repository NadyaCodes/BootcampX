SELECT count(assistance_requests.teacher_id) as total_assistances, teachers.name as name
FROM assistance_requests
JOIN teachers ON teacher_id = teachers.id
GROUP BY teachers.name
HAVING name='Waylon Boehm';