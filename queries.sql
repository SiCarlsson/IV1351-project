-- Query 1

SELECT  
	TO_CHAR(date, 'Mon') AS month, 
	COUNT(*) AS Total, 
	COUNT(individual_lesson.id) AS Individual,
	COUNT(group_lesson.id) AS Group,
	COUNT(ensemble.id) AS Ensemble
FROM lesson
LEFT JOIN individual_lesson ON lesson.id = individual_lesson.lesson_id
LEFT JOIN group_based_lesson ON lesson.id = group_based_lesson.lesson_id
LEFT JOIN group_lesson ON group_based_lesson.id = group_lesson.group_based_lesson_id
LEFT JOIN ensemble ON group_based_lesson.id = ensemble.group_based_lesson_id




