CREATE DATABASE company_db;
USE company_db;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50)
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary INT,
    Hire_Date DATE,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

INSERT INTO Department VALUES
(1,'HR'),
(2,'IT'),
(3,'Finance'),
(4,'Sales');

INSERT INTO Employee VALUES
(101,'Amit',50000,'2025-01-15',1),
(102,'Priya',65000,'2025-02-10',2),
(103,'Rahul',70000,'2025-03-05',2),
(104,'Sneha',55000,'2024-12-20',3),
(105,'Kiran',80000,'2025-04-01',4),
(106,'Neha',75000,'2025-05-12',2),
(107,'Rohit',60000,'2025-01-25',1),
(108,'Pooja',90000,'2025-06-01',4);

SELECT *
FROM Employee
ORDER BY Salary DESC
LIMIT 5;

SELECT Dept_ID, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dept_ID;

SELECT MAX(Salary) AS Second_Highest_Salary
FROM Employee
WHERE Salary < (SELECT MAX(Salary) FROM Employee);

SELECT *
FROM Employee e
WHERE Salary >
(
SELECT AVG(Salary)
FROM Employee
WHERE Dept_ID = e.Dept_ID
);

SELECT e.Emp_Name, d.Dept_Name
FROM Employee e
INNER JOIN Department d
ON e.Dept_ID = d.Dept_ID;

SELECT e.Emp_Name, d.Dept_Name
FROM Employee e
LEFT JOIN Department d
ON e.Dept_ID = d.Dept_ID;

SELECT Dept_ID, AVG(Salary) AS Avg_Salary
FROM Employee
GROUP BY Dept_ID
HAVING AVG(Salary) > 60000;

SELECT *
FROM Employee
WHERE Hire_Date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SELECT Emp_Name, COUNT(*)
FROM Employee
GROUP BY Emp_Name
HAVING COUNT(*) > 1;

DELETE e1
FROM Employee e1
JOIN Employee e2
ON e1.Emp_Name = e2.Emp_Name
AND e1.Emp_ID > e2.Emp_ID;