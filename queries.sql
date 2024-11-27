--
-- Query 1
--

SELECT
    TO_CHAR (date, 'Mon') AS month,
    COUNT(*) AS Total,
    COUNT(individual_lesson.id) AS Individual,
    COUNT(group_lesson.id) AS Group,
    COUNT(ensemble.id) AS Ensemble
FROM
    lesson
    LEFT JOIN individual_lesson ON lesson.id = individual_lesson.lesson_id
    LEFT JOIN group_based_lesson ON lesson.id = group_based_lesson.lesson_id
    LEFT JOIN group_lesson ON group_based_lesson.id = group_lesson.group_based_lesson_id
    LEFT JOIN ensemble ON group_based_lesson.id = ensemble.group_based_lesson_id
    
    
--
-- Query 2
--

SELECT
    siblings_per_student AS "No of Siblings",
    COUNT(*) AS "No of Students"
FROM
    (
        SELECT
            student.id,
            COUNT(DISTINCT sibling_id) AS siblings_per_student
        FROM
            student
            LEFT JOIN student_sibling ON student.id = student_id
        GROUP BY
            student.id
    )
GROUP BY
    siblings_per_student
ORDER BY
    siblings_per_student;


--
-- Query 3
--

SELECT
    instructor.id AS "Instructor ID",
    first_name AS "First Name",
    last_name AS "Last Name",
    COUNT(lesson.id) AS "No of Lessons"
FROM
    instructor
    LEFT JOIN person ON person_id = person.id
    LEFT JOIN lesson ON instructor.id = instructor_id
GROUP BY
    instructor.id,
    first_name,
    last_name
ORDER BY
    "No of Lessons" DESC;


--
-- Query 4
--

SELECT
    TO_CHAR (lesson.date, 'Dy') AS Day,
    genre AS genre,
    CASE
        WHEN COUNT(student_id) = CAST(maximum_number_of_spots AS BIGINT) THEN 'No Seats'
        WHEN COUNT(student_id) >= CAST(maximum_number_of_spots AS BIGINT) - 2
        AND COUNT(student_id) < CAST(maximum_number_of_spots AS BIGINT) THEN '1 or 2 Seats'
        ELSE 'Seats Available'
    END AS available_seats
FROM
    lesson
    LEFT JOIN lesson_student ON lesson.id = lesson_student.lesson_id
    LEFT JOIN group_based_lesson ON lesson.id = group_based_lesson.lesson_id
    LEFT JOIN ensemble ON group_based_lesson.id = ensemble.group_based_lesson_id
WHERE
    maximum_number_of_spots IS NOT NULL
    AND genre IS NOT NULL
GROUP BY
    lesson.id,
    genre,
    maximum_number_of_spots
ORDER BY
    day ASC;