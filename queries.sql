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
WHERE
    EXTRACT(
        YEAR
        FROM
            date
    ) = 2024
GROUP BY
    month
ORDER BY
    month DESC
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
WHERE
    lesson.date >= date_trunc ('month', CURRENT_DATE)
    AND lesson.date < date_trunc ('month', CURRENT_DATE) + INTERVAL '1 month'
GROUP BY
    instructor.id,
    first_name,
    last_name
HAVING
    COUNT(lesson.id) >= 3
ORDER BY
    "No of Lessons" DESC;

--
-- Query 4
--
CREATE VIEW available_seats AS
SELECT
    TO_CHAR (lesson.date, 'Dy') AS Day,
    genre AS genre,
    CASE
        WHEN COUNT(student_id) = CAST(maximum_number_of_spots AS BIGINT) THEN 'No Seats'
        WHEN COUNT(student_id) >= CAST(maximum_number_of_spots AS BIGINT) - 2
        AND COUNT(student_id) < CAST(maximum_number_of_spots AS BIGINT) THEN '1 or 2 Seats'
        ELSE 'Many Seats'
    END AS "No of Free Seats"
FROM
    lesson
    LEFT JOIN lesson_student ON lesson.id = lesson_student.lesson_id
    LEFT JOIN group_based_lesson ON lesson.id = group_based_lesson.lesson_id
    LEFT JOIN ensemble ON group_based_lesson.id = ensemble.group_based_lesson_id
WHERE
    maximum_number_of_spots IS NOT NULL
    AND genre IS NOT NULL
    AND lesson.date >= date_trunc ('week', CURRENT_DATE) + INTERVAL '1 week'
    AND lesson.date < date_trunc ('week', CURRENT_DATE) + INTERVAL '2 weeks'
GROUP BY
    lesson.id,
    genre,
    maximum_number_of_spots
ORDER BY
    day DESC;

--
-- Query Higher grade
--
COPY (
    SELECT
        CASE
            WHEN ensemble.id IS NOT NULL THEN 'ensemble'
            WHEN group_lesson.id IS NOT NULL THEN 'group'
            WHEN individual_lesson.id IS NOT NULL THEN 'individual'
            ELSE 'lesson type missing'
        END AS lesson_type,
        ensemble.genre AS genre,
        COALESCE(
            individual_lesson.specific_instrument,
            group_lesson.specific_instrument
        ) AS instrument,
        lesson_price_scheme.price_per_lesson AS lesson_price,
        CONCAT (person.last_name, ', ', person.first_name) AS student_name,
        email.email AS student_email
    FROM
        lesson
        LEFT JOIN group_based_lesson ON lesson.id = group_based_lesson.lesson_id
        LEFT JOIN group_lesson ON group_based_lesson.id = group_lesson.group_based_lesson_id
        LEFT JOIN ensemble ON group_based_lesson.id = ensemble.group_based_lesson_id
        LEFT JOIN individual_lesson ON lesson.id = individual_lesson.lesson_id
        LEFT JOIN lesson_student ON lesson.id = lesson_student.lesson_id
        LEFT JOIN student ON student.id = lesson_student.student_id
        LEFT JOIN person ON person.id = student.person_id
        LEFT JOIN person_email ON person.id = person_email.person_id
        LEFT JOIN email ON email.id = person_email.email_id
        LEFT JOIN lesson_price_scheme ON lesson.lesson_price_scheme_id = lesson_price_scheme.id
    WHERE
        student.id IS NOT NULL
) TO '/path/to/output.csv'
WITH
    CSV HEADER;

-- Change the path to the desired location of the output file.
--
-- Insert data into historical database.
--
COPY historical_lesson_information (
    lesson_type,
    genre,
    instrument,
    lesson_price,
    student_name,
    student_email
)
FROM
    '/path/to/output.csv'
WITH
    CSV HEADER;

-- Change the path to the location of the output file from the previous query.