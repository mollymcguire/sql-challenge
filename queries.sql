-- employee salary information
SELECT e.emp_no, e.last_name, e.first_name
FROM employees as e
LEFT JOIN salaries as s
	ON(e.emp_no = s.emp_no)
	ORDER BY e.emp_no;

-- employees hired in 1986
SELECT e.first_name, e.last_name
FROM employees
	WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';

-- department managers
SELECT mgr.dept_no, d.dept_name, mgr.emp_no, e.last_name, e.first_name, mgr.from_date, mgr.to_date
FROM dept_manager AS mgr
INNER JOIN departments AS d
	ON (mgr.dept_no = d.dept_no)
INNER JOIN employees as e
	ON (mgr.emp_no = e.emp_no);
	
-- employees & associated departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
	ON (d.dept_no = de.dept_no)
ORDER BY e.emp_no;

-- employees with first_name = 'Hercules' AND last_name = 'starting with B' (use wildcard)
-- remember that syntax requires single ' versus "
SELECT * FROM employees
WHERE first_name = 'Hercules' AND (last_name LIKE 'B%');

-- employees employeed in the SALES and DEVELOPMENT Department
-- list all departments 
SELECT dept_name FROM departments
-- note:  sales and development are two separate departments

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN departments as d
	ON (d.dept_no = de.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

-- employee last name frequency count
SELECT last_name,
COUNT(last_name)
FROM employees
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY COUNT(last_name) DESC;








