-- Total Employee details
SELECT empl.emp_no, empl.last_name, empl.first_name, empl.gender, sal.salary
FROM employees as empl
LEFT JOIN salaries as sal ON empl.emp_no = sal.emp_no;

-- All Employees hired in 1986
SELECT * FROM employees
WHERE hire_date LIKE '1986%'

--Manager in each Department information
SELECT dep.dept_no, dep.dept_name, dm.from_date, dm.to_date, dm.emp_no, empl.last_name, empl.first_name
FROM departments as dep
INNER JOIN dept_manager AS dm ON dm.dept_no = dep.dept_no
JOIN employees AS empl ON empl.emp_no = dm.emp_no;

--The Department of each employee
SELECT empl.emp_no, empl.first_name, empl.last_name, dn.dept_name
FROM employees AS empl
INNER JOIN dept_emp AS de ON empl.emp_no = de.emp_no
INNER JOIN departments AS dep ON dep.dept_no = de.dept_no;

--All employees with the name 'Hercules' and last names that begin with 'B'
SELECT * FROM employees
WHERE last_name LIKE 'B%'
AND first_name LIKE 'Hercules';

--Every employee in the sales department (employee number, last name, first name, and department name)
SELECT empl.emp_no, empl.last_name, empl.first_name, dep.dept_name
FROM employees AS empl
INNER JOIN dept_emp AS de ON empl.emp_no = de.emp_no
INNER JOIN departments AS dep ON dep.dept_no = de.dept_no
WHERE dep.dept_name LIKE 'Sales';

--Every employee in the sales and development department (employee number, last name, first name, and department name)
SELECT empl.emp_no, empl.first_name, empl.last_name, dep.dept_name
FROM employees AS empl
INNER JOIN dept_emp AS de ON empl.emp_no = de.emp_no
INNER JOIN departments AS dep ON dep.dept_no = de.dept_no
WHERE dep.dept_name LIKE 'Sales'
OR dep.dept_name LIKE 'Development';

--Frequency of common employee last names
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;