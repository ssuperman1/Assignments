/* Query-CH03-XY by Faraz G and Frank A */

/* ERROR IN QUERY 34 */


/* *** SQL-Query-CH03-01 *** */
Select ProjectID, ProjectName, Department, MaxHours, StartDate, EndDate
From project;

/* *** SQL-Query-CH03-02 *** */
Select *
From project;

/* *** SQL-Query-CH03-03 *** */
Select ProjectName, Department, MaxHours
From project;

/* *** SQL-Query-CH03-04 *** */
Select ProjectName, MaxHours, Department
From project;

/* *** SQL-Query-CH03-05 *** */
Select Department
From project;

/* *** SQL-Query-CH03-06 *** */
Select DISTINCT Department
From project;

/* *** SQL-Query-CH03-07 *** */
Select *
From project
Where Department = 'Finance';

/* *** SQL-Query-CH03-08 *** */
Select *
From project
Where StartDate = '05/10/2017';

/* *** SQL-Query-CH03-09 *** */
Select *
From project
Where MaxHours > 135;

/* *** SQL-Query-CH03-10 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Where Department= 'Accounting';

/* ***SQL-Query-CH03-11 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Order By Department;

/* ***SQL-Query-CH03-12 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Order by Department DESC;

/* *** SQL-Query-CH03-13 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Order By Department DESC, LastName ASC;

/* *** SQL-Query-CH03-14 *** */
SELECT FirstName, LastName, Department, OfficePhone
From employee
Where Department = 'Accounting'
    And OfficePhone = '360-285-8430';

/* *** SQL-Query-CH03-15 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Where Department = 'Accounting'
    Or OfficePhone = '360-285-8410';

/* *** SQL-Query-CH03-16 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Where Department = 'Accounting'
    AND NOT OfficePhone = '360-285-8430';

/* *** SQL-Query-CH03-17 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM employee
WHERE Department IN ('Administration', 'Finance', 'Accounting');

/* *** SQL-Query-CH03-18 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM employee
WHERE Department NOT IN ('Administration', 'Finance', 'Accounting');

/* *** SQL-Query-CH03-19 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Where EmployeeNumber >= 2
  And EmployeeNumber <= 5;

/* *** SQL-Query-CH03-20 *** */
SELECT FirstName, LastName, Department, OfficePhone
FROM employee
WHERE EmployeeNumber BETWEEN 2 AND 5;

/* *** SQL-Query-CH03-21 *** */
Select *
From project
Where ProjectName LIKE '2017 Q_ Portfolio Analysis';

/* *** SQL-Query-CH03-22 *** */
Select *
From employee
Where OfficePhone LIKE '360-287-88__';

/* *** SQL-Query-CH03-23 *** */
SELECT *
FROM employee
WHERE OfficePhone LIKE '360-287-88%';

/* *** SQL-Query-CH03-24 *** */
SELECT *
FROM employee
WHERE Department LIKE '%ing';

/* *** SQL-Query-CH03-25 *** */
SELECT *
FROM employee
WHERE Department NOT LIKE '%ing';

/* *** SQL-Query-CH03-26 *** */
Select FirstName, LastName, Department, OfficePhone
From employee
Where OfficePhone IS NULL;

-- SQL-QUERY-CH03-27
SELECT	FirstName, LastName, Department, OfficePhone
FROM employee
WHERE OfficePhone IS NOT NULL;

-- SQL-QUERY-CH03-28
SELECT COUNT(*)
FROM project;

-- SQL-QUERY-CH03-29
SELECT COUNT(*) AS NumberOfProjects
FROM project;

-- SQL-QUERY-CH03-30
SELECT COUNT(Department) AS NumberOfDepartments
FROM project;

-- SQL-QUERY-CH03-31
SELECT COUNT(DISTINCT Department) AS NumberOfDepartments
FROM project;

-- SQL-QUERY-CH03-32
SELECT SUM(MaxHours) AS TotalMaxHours,
	   AVG(MaxHours) AS AverageMaxHours,
	   MIN(MaxHours) AS MinimumMaxHours,
	   MAX(MaxHours) AS MaximumMaxHours
FROM project
WHERE ProjectID <= 1200;

-- SQL-QUERY-CH03-33
SELECT ProjectName, COUNT(*)
FROM project;

/* -- SQL-QUERY-CH03-34
SELECT *
FROM project
WHERE MaxHours > AVG(MaxHours); */

-- SQL-QUERY-CH03-35
SELECT ProjectID, ProjectName, MaxHours, (24.50 * MaxHours) AS MaxProjectCost
FROM project;

-- SQL-QUERY-CH03-36
SELECT Department, Count(*) AS NumberOfEmployees
FROM employee
GROUP BY Department;

-- SQL-QUERY-CH03-37
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM employee
GROUP BY Department
HAVING COUNT(*) > 1;

-- SQL-QUERY-CH03-38
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM employee
WHERE EmployeeNumber <= 10
GROUP BY Department
HAVING COUNT(*) > 1;

-- SQL-QUERY-CH03-39
SELECT FirstName, LastName
FROM employee
WHERE EmployeeNumber IN (6, 10, 11, 16, 17);

-- SQL-QUERY-CH03-40
SELECT EmployeeNumber
FROM assignment
WHERE HoursWorked > 50;

-- SQL-QUERY-CH03-41
SELECT FirstName, LastName
FROM employee
WHERE EmployeeNumber IN
		(SELECT DISTINCT EmployeeNumber
		 FROM assignment
		 WHERE HoursWorked > 50);

-- SQL-QUERY-CH03-42
SELECT DISTINCT ProjectID
FROM project
WHERE Department = 'Accounting';

-- SQL-QUERY-CH03-43
SELECT DISTINCT EmployeeNumber
FROM assignment
WHERE HoursWorked > 40
	AND ProjectID IN
	( SELECT ProjectID
	FROM project
	WHERE Department = 'Accounting');

-- SQL-QUERY-CH03-44
SELECT FirstName, LastName
FROM employee
WHERE EmployeeNumber IN
	( SELECT DISTINCT EmployeeNumber
	FROM assignment
	WHERE HoursWorked > 40
		AND ProjectID IN
			( SELECT ProjectID
			FROM project
			WHERE Department = 'Accounting'));

-- SQL-QUERY-CH03-45
SELECT FirstName, LastName, ProjectID, HoursWorked
FROM employee, assignment;

-- SQL-QUERY-CH03-46
SELECT FirstName, LastName, ProjectID, HoursWorked
FROM employee, assignment
WHERE employee.EmployeeNumber = assignment.EmployeeNumber;

-- SQL-QUERY-CH03-47
SELECT FirstName, LastName, ProjectID, HoursWorked
FROM employee, assignment
WHERE employee.EmployeeNumber = assignment.EmployeeNumber
ORDER BY employee.EmployeeNumber, ProjectID;

-- SQL-QUERY-CH03-48
SELECT FirstName, LastName, ProjectID, HoursWorked
FROM employee JOIN assignment
	ON employee.EmployeeNumber = assignment.EmployeeNumber
ORDER BY employee.EmployeeNumber, ProjectID;

-- SQL-QUERY-CH03-49
SELECT FirstName, LastName, SUM(HoursWorked) AS TotalHoursWorked
FROM employee AS E JOIN assignment AS A
	ON E.EmployeeNumber = A.EmployeeNumber
GROUP BY LastName, FirstName
ORDER BY LastName, FirstName;

-- SQL-QUERY-CH03-50
SELECT FirstName, LastName, ProjectID, HoursWorked
FROM employee as E JOIN assignment AS A
	ON E.EmployeeNumber = A.EmployeeNumber
WHERE HoursWorked > 50
ORDER BY LastName, FirstName, ProjectID;

-- SQL-QUERY-CH03-51
SELECT ProjectName, FirstName, LastName, HoursWorked
FROM employee as E JOIN assignment AS A
	ON E.EmployeeNumber = A.EmployeeNumber
		JOIN project AS P
			ON A.ProjectID = P.ProjectID
ORDER BY P.ProjectID, A.EmployeeNumber;

-- SQL-QUERY-CH03-52
SELECT *
FROM project;

-- SQL-QUERY-CH03-53
SELECT ProjectName, FirstName, LastName, HoursWorked
FROM employee as E JOIN assignment AS A
	ON E.EmployeeNumber = A.EmployeeNumber
		JOIN project AS P
			ON A.ProjectID = P.ProjectID
ORDER BY P.ProjectID, A.EmployeeNumber;
