/* These Are my Create Statements */

CREATE TABLE DEPARTMENT(
	DepartmentName Char(35) NOT NULL,
	BudgetCode Char(30) NOT NULL,
	OfficerNumber Char(15) NOT NULL,
	Phone Char(12) NOT NULL,
	CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DepartmentName) 
	);
CREATE TABLE EMPLOYEE( 
	EmployeeNumber Int NOT NULL Auto_Increment,
	FirstName Char(25) NOT NULL, 
	LastName Char(35) NOT NULL,
	Department Char(35) NOT NULL DEFAULT 'Human Resources',
	Phone Char(12) NULL,
	Email VarChar(100) NOT NULL UNIQUE,
	CONSTRAINT EMPLOYEE_PK PRIMARY KEY(EmployeeNumber),
	CONSTRAINT EMP_DEPART_FK FOREIGN KEY(Department)
						REFERENCES DEPARTMENT(DepartmentName) 
							ON UPDATE CASCADE 
	);
CREATE TABLE PROJECT(	
	ProjectID Int NOT NULL Auto_Increment,
	ProjectName Char(50) NOT NULL,
	Department Char(35) NOT NULL,
	MaxHours Numeric(8,2) NOT NULL DEFAULT 100,
	StartDate Date NULL,
	EndDate Date NULL,
	CONSTRAINT PROJECT_PK PRIMARY KEY (ProjectID),
	CONSTRAINT PROJ_DEPART_FK FOREIGN KEY (Department) 
						REFERENCES DEPARTMENT (DepartmentName)
							ON UPDATE CASCADE
	);
CREATE TABLE ASSIGNMENT ( 
	ProjectID Int NOT NULL,
	EmployeeNumber Int NOT NULL,
	HoursWorked Numeric(6,2) NULL,
	CONSTRAINT ASSIGNMENT_PK PRIMARY KEY (ProjectID, EmployeeNumber),
	CONSTRAINT ASSIGN_PROJ_FK FOREIGN KEY (ProjectID)
						REFERENCES PROJECT (ProjectID)
							ON UPDATE NO ACTION
							ON DELETE CASCADE,
	CONSTRAINT ASSIGN_EMP_FK FOREIGN KEY (EmployeeNumber)
						REFERENCES EMPLOYEE (EmployeeNumber) 
							ON UPDATE NO ACTION
							ON DELETE NO ACTION
	);
