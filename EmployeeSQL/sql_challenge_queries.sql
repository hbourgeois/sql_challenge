-- list the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- list the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- list the manager of each department along with:
-- their department number, department name, employee number, last name, and first name
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_managers dm
JOIN employees e on dm.emp_no = e.emp_no
JOIN departments d on dm.dept_no = d.dept_no;


-- list the department number for each employee and include:
-- their emp_no, last name, first name, and dept name
SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_employees de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;


-- list first name, last name, and sex of each employee whose first name is Hercules and last name starts with "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- list each employee in the Sales Department incl their emp_no, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_employees de ON e.emp_no=de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- list each employee in the Sales & Development Dept incl their emp_no, last name, first name, and dept name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_employees de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- list the frequency counts, in descending order, of all the employee last names
SELECT last_name, COUNT (*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


