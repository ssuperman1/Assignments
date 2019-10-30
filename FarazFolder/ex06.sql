SELECT HoursWorked, EmployeeNumber, ProjectID
FROM assignment
WHERE HoursWorked >
 (SELECT MAX(HoursWorked)
 FROM assignment)
ORDER BY HoursWorked;

/*Double Not Exist*/

SELECT DISTINCT ProjectID
FROM project
WHERE NOT EXISTS (
	SELECT *
	FROM assignment
		WHERE NOT EXISTS (
		SELECT *
		FROM assignment
		WHERE assignment.ProjectID = project.ProjectID));
