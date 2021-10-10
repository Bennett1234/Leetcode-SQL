SELECT student_id, course_id, grade FROM (
SELECT *, ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC, course_id ASC) AS grade_rnk
FROM Enrollments
) AS tmp
WHERE grade_rnk = 1
ORDER BY student_id;
