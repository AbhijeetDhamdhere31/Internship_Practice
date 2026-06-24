SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 5;

SELECT dept_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY dept_id;

SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

SELECT e.emp_name, e.salary, e.dept_id
FROM Employee e
WHERE e.salary >
(
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

SELECT e.emp_name, d.dept_name
FROM Employee e
INNER JOIN Department d
ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id = d.dept_id;

SELECT dept_id, COUNT(*) AS total_employees
FROM Employee
GROUP BY dept_id
HAVING COUNT(*) > 5;

SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SELECT emp_name, COUNT(*)
FROM Employee
GROUP BY emp_name
HAVING COUNT(*) > 1;

DELETE e1
FROM Employee e1
JOIN Employee e2
ON e1.emp_name = e2.emp_name
AND e1.emp_id > e2.emp_id;

