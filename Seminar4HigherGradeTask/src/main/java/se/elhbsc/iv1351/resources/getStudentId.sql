SELECT student.id, CONCAT (person.first_name, ' ', person.last_name) AS student_name
FROM student
LEFT JOIN person ON person.id = person_id