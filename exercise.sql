CREATE TABLE STUDENT (
  std_id INTEGER PRIMARY KEY,
  Fname TEXT NOT NULL,
  Lname TEXT NOT NULL,
  GPA FLOAT NOT NULL,
  MAJOR TEXT NOT NULL
);
INSERT INTO STUDENT VALUES (201, 'Shivansh', 'Mahajan', 8.79, 'CS');
INSERT INTO STUDENT VALUES (202, 'Umesh', 'Sharma', 8.44, 'Math');
INSERT INTO STUDENT VALUES (203, 'Rakesh', 'Kumar', 5.60, 'Bios');
INSERT INTO STUDENT VALUES (204, 'Radha', 'Sharma', 9.20, 'Chem');
INSERT INTO STUDENT VALUES (205, 'KUsh', 'Kumar', 7.85, 'Phys');
INSERT INTO STUDENT VALUES (206, 'Prem', 'Chopra', 9.56, 'His');
INSERT INTO STUDENT VALUES (207, 'Pankaj', 'Vats', 9.78, 'Eng');
INSERT INTO STUDENT VALUES (208, 'Navleen', 'Kaur', 7.00, 'Math');

SELECT * FROM Student

-- 7:Write a SQL query to print the FIRST_NAME and LAST_NAME from Student table into single column COMPLETE_NAME
SELECT CONCAT(Fname, ' ', Lname) as COMPLETE_NAME 
FROM Student;

-- 8:Write a SQL query to print all Student details from Student table order by FIRST_NAME Ascending and MAJOR Subject descending .
SELECT * 
FROM Student
ORDER BY Fname, MAJOR DESC;

-- 9:Write a SQL query to print details of the Students with the FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
SELECT * 
FROM Student
WHERE Fname LIKE 'Prem%' OR Fname LIKE 'Shivansh%';

-- 10:Write a SQL query to print details of the Students excluding FIRST_NAME as 'Prem' and 'Shivansh' from Student table.
SELECT * 
FROM Student
WHERE Fname NOT LIKE 'Prem%' AND Fname NOT LIKE 'Shivansh%';

-- 11:Write a SQL query to print details of the Students whose FIRST_NAME ends with 'a'.
SELECT * 
FROM Student
WHERE Fname LIKE '%a';

-- 12:Write an SQL query to print details of the Students whose FIRST_NAME ends with ‘a’ and contains five alphabets.
SELECT * 
FROM Student
WHERE Fname LIKE '%____a';

-- 13: Write an SQL query to print details of the Students whose GPA lies between 9.00 and 9.99.
SELECT * 
FROM Student
WHERE GPA BETWEEN 9.00 AND 9.99;

-- 14: Write an SQL query to fetch the count of Students having Major Subject ‘Computer Science’.
SELECT COUNT(*), MAJOR 
FROM Student
WHERE MAJOR IN ('CS')
GROUP BY MAJOR;

-- 15: Write an SQL query to fetch Students full names with GPA >= 8.5 and <= 9.5..
SELECT CONCAT(Fname,' ',Lname) as full_names 
FROM Student
WHERE GPA BETWEEN 8.5 AND 9.5;

-- 16:Write an SQL query to fetch the no. of Students for each MAJOR subject in the descending order.
SELECT COUNT(*) as no_of_student, MAJOR 
FROM Student
GROUP BY MAJOR
ORDER BY MAJOR DESC;

-- 17:Display the details of students who have received scholarships, including their names, scholarship amounts, and scholarship dates.
SELECT 
	Student.Fname,
	Student.Lname,
	Scholarship.SCHOLARSHIP_AMOUNT,
	Scholarship.SCHOLARSHIP_DATES
FROM Student as ST
INNER JOIN Scholarship as SC
ON ST.std_id = SC.STUDENT_REF_ID;

-- 18: Write an SQL query to show only odd rows from Student table.
SELECT * 
FROM Student
WHERE std_id % 2 != 0;

-- 19. Write an SQL query to show only even rows from Student table.
SELECT * 
FROM Student
WHERE std_id % 2 = 0;

-- 20. List all students and their scholarship amounts if they have received any. If a student has not received a scholarship, display NULL for the scholarship details.
SELECT 
	Student.Fname,
	Student.Lname,
	Scholarship.SCHOLARSHIP_AMOUNT,
	Scholarship.SCHOLARSHIP_DATES
FROM Student as ST
LEFT JOIN Scholarship as SC
ON ST.std_id = SC.STUDENT_REF_ID;

-- 21:Write an SQL query to show the top n (say 5) records of Student table order by descending GPA.
SELECT * 
FROM Student
ORDER BY GPA DESC
LIMIT 5;

-- 22. Write an SQL query to determine the nth (say n=5) highest GPA from a table.
SELECT * 
FROM Student
ORDER BY GPA DESC
OFFSET 4 LIMIT 1;

